import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointment extends StatelessWidget {
  const AddAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return BlocConsumer<AddAppointmentCubit, AddAppointmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.addAppointment),
          ),
          body: Stepper(
              steps: cubit.getSteps(),
              currentStep: cubit.currentStep,
              type: StepperType.horizontal,
              elevation: 1,
              onStepContinue: () {
                final isLastStep = cubit.currentStep == cubit.getSteps().length - 1;
                if (isLastStep) {
                } else {
                  cubit.addStep();
                }
              },
              onStepCancel: () => cubit.currentStep == 0 ? null : cubit.minusStep(),
              controlsBuilder: (context, details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (cubit.currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text("Previous"),
                        ),
                      ),
                    if (cubit.currentStep != 0)
                      const SizedBox(
                        width: 50,
                      ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                );
              },
              onStepTapped: (value) => cubit.currentStep = value),
        );
      },
    );
  }
}
