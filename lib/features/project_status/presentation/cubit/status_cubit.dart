import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  final GetProjectStepsUseCase getProjectTrackerUseCase;

  StatusCubit(this.getProjectTrackerUseCase) : super(const StatusState());

  static StatusCubit get(context) => BlocProvider.of(context);

  String fuid = CacheHelper.getData(key: Constants.userID);

  Future<void> getProjectTracker() async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));

    final result = await getProjectTrackerUseCase(ProjectStepsParameters(fuid: fuid));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        projectSteps: r,
      ));
    });
  }

  StepperType stepType = StepperType.vertical;

  int stepIndex = 0;

  void go(int index) {
    if (index == -1 && stepIndex <= 0) {
      return;
    }

    if (index == 1 && stepIndex >= state.projectSteps!.length - 1) {
      return;
    }

    stepIndex += index;
    emit(
      state.copyWith(stepIndex: stepIndex),
    );
  }
}
