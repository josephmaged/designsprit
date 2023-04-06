import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/installments.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_installments_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_projects_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_steps_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  final GetStepsUseCase getStepsUseCase;
  final GetProjectsUseCase getProjectsUseCase;
  final UpdateProjectStepsUseCase updateProjectTrackerUseCase;
  final GetInstallmentsUseCase getInstallmentsUseCase;

  StatusCubit(
      this.getStepsUseCase, this.updateProjectTrackerUseCase, this.getProjectsUseCase, this.getInstallmentsUseCase)
      : super(const StatusState());

  static StatusCubit get(context) => BlocProvider.of(context);

  String fuid = CacheHelper.getData(key: Constants.fID);
  int uid = CacheHelper.getData(key: Constants.userID);

  Future<void> getProjects() async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));

    final result = await getProjectsUseCase(ProjectsParameters(fuid: fuid));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        projects: r,
      ));
    });
  }

  Future<void> getSteps({required int id}) async {
    emit(state.copyWith(
      stepsState: RequestState.loading,
    ));

    final result = await getStepsUseCase(StepsParameters(id: id));

    result.fold((l) {
      emit(state.copyWith(
        stepsState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        stepsState: RequestState.loaded,
        steps: r,
      ));
      Constants.stepsList = r.map((e) => e).toList();
    });
  }

  Future<void> getInstallments() async {
    emit(state.copyWith(
      stepsState: RequestState.loading,
    ));

    final result = await getInstallmentsUseCase(GetProjectInstallmentsParameters(uid: uid));

    result.fold((l) {
      emit(state.copyWith(
        stepsState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        stepsState: RequestState.loaded,
        installments: r,
      ));
      print(r);
    });
  }

  Future<void> updateProjectTracker({required int stepId, required bool status}) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));

    final result = await updateProjectTrackerUseCase(UpdateProjectStepsParameters(stepId: stepIndex, status: status));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
      Fluttertoast.showToast(
        msg: l.errMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        apiResponse: r,
      ));
      Fluttertoast.showToast(
        msg: "${r[0].message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );
    });
  }

  List<Tab> tabs = [
    const Tab(
      child: Text(
        'Project Steps',
      ),
    ),
    const Tab(
      child: Text(
        'Project Payments',
      ),
    ),
  ];

  StepperType stepType = StepperType.vertical;

  int stepIndex = 0;

  void go(int index, bool isAccepted) {
    if (index == -1 && stepIndex <= 0) {
      return;
    }

    if (index == 1 && stepIndex >= Constants.stepsList.length - 1) {
      return;
    }

    stepIndex += index;
    emit(
      state.copyWith(stepIndex: stepIndex),
    ); /*
    updateProjectTracker(stepId: index,status: isAccepted);*/
  }
}
