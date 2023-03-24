import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(const StatusState());

  static StatusCubit get(context) => BlocProvider.of(context);

  StepperType stepType = StepperType.vertical;

  List<Tuple4<String, IconData, StepState, String>> steps = [
    const Tuple4("Design Stage", Icons.directions_bike, StepState.error, "1//2023 - 1/10/2023"),
    const Tuple4("License Design Stage", Icons.directions_bus, StepState.editing, "1//2023 - 1/10/2023"),
    const Tuple4("Operational Graphic Stage", Icons.directions_railway, StepState.indexed, "1//2023 - 1/10/2023"),
    const Tuple4("Follow-up Stage", Icons.directions_boat, StepState.complete, "1//2023 - 1/10/2023"),
    const Tuple4("Stage 5", Icons.directions_boat, StepState.disabled, "1//2023 - 1/10/2023"),
  ];

  int stepIndex = 0;

  void go(int index) {
    if (index == -1 && stepIndex <= 0) {
      return;
    }

    if (index == 1 && stepIndex >= steps.length - 1) {
      return;
    }

    stepIndex += index;
    emit(
      state.copyWith(stepIndex: stepIndex),
    );
  }
}
