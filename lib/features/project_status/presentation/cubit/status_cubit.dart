import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_projects_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_steps_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  final GetStepsUseCase getStepsUseCase;
  final GetProjectsUseCase getProjectsUseCase;
  final UpdateProjectStepsUseCase updateProjectTrackerUseCase;

  StatusCubit(this.getStepsUseCase, this.updateProjectTrackerUseCase, this.getProjectsUseCase) : super(const StatusState());

  static StatusCubit get(context) => BlocProvider.of(context);

  String fuid = CacheHelper.getData(key: Constants.fID);

  Future<void> getProjects() async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));
/// Fuid
    final result = await getProjectsUseCase(ProjectsParameters(fuid:  "VWj8dVsuvzfcfJ1y97Bu3Jxs7du1" /*fuid*/));

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
///Steps id
    final result = await getStepsUseCase(StepsParameters(id: 15 /*id*/));

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

  Future<void> updateProjectTracker({
  required int stepId,
    required bool status
}) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));

    final result = await updateProjectTrackerUseCase(UpdateProjectStepsParameters(stepId: state.steps![stepId].id, status: status));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        apiResponse: r,
      ));
    });
  }

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
    );/*
    updateProjectTracker(stepId: index,status: isAccepted);*/
  }
}
