import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAppointment extends StatelessWidget {
  const AddAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return BlocProvider(
      create: (context) => sl<AddAppointmentCubit>(),
      child: BlocConsumer<AddAppointmentCubit, AddAppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
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
                  return Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (cubit.currentStep != 0)
                            Expanded(
                              child: CustomPrimaryButton(
                                text: "Previous",
                                press: details.onStepCancel,
                              ),
                            ),
                          if (cubit.currentStep != 0)
                            SizedBox(
                              width: 20.w,
                            ),
                          Expanded(
                            child: CustomPrimaryButton(
                              press: details.onStepContinue,
                              text: "Next",
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                onStepTapped: (value) => cubit.currentStep = value),
          );
        },
      ),
    );
  }
}
