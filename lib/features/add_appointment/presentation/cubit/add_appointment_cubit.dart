import 'package:bloc/bloc.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_one_view.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_three.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_two_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'add_appointment_state.dart';

class AddAppointmentCubit extends Cubit<AddAppointmentState> {
  AddAppointmentCubit() : super(const AddAppointmentState());

  static AddAppointmentCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  void addStep() {
    currentStep += 1;
    emit(
      state.copyWith(
        currentStep: currentStep,
      ),
    );
  }

  void minusStep() {
    currentStep -= 1;
    emit(
      state.copyWith(
        currentStep: currentStep,
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: Text(
            'Project Data',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const StepOne(),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text(
            'Address',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: StepTwo(),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: Text(
            'Appointment',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const StepThree(),
          isActive: currentStep >= 2,
        ),
      ];
}
