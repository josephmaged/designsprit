import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

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

    final result = await getProjectTrackerUseCase(ProjectStepsParameters(fuid: "nTOSY7INS4V49tteR5BNu3wcLGY2"));

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

/*  List<Tuple4<String, IconData, StepState, String>> steps = [
    const Tuple4("Design Stage", Icons.directions_bike, StepState.error, "1//2023 - 1/10/2023"),
    const Tuple4("License Design Stage", Icons.directions_bus, StepState.editing, "1//2023 - 1/10/2023"),
    const Tuple4("Operational Graphic Stage", Icons.directions_railway, StepState.indexed, "1//2023 - 1/10/2023"),
    const Tuple4("Follow-up Stage", Icons.directions_boat, StepState.complete, "1//2023 - 1/10/2023"),
    const Tuple4("Stage 5", Icons.directions_boat, StepState.disabled, "1//2023 - 1/10/2023"),
  ];*/

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
