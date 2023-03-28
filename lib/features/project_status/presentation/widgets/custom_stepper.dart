import 'package:designsprit/constants.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  final ProjectSteps projectSteps;

  const CustomStepper({Key? key, required this.projectSteps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: kLightGrey
          ),
          child: EnhanceStepper(
            stepIconSize: 30.h,
            type: cubit.stepType,
            currentStep: cubit.stepIndex,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomPrimaryButton(
                        press: details.onStepContinue,
                        text: 'ACCEPT',
                        height: 40.h,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: details.onStepCancel,
                        child: const Text(
                          'REJECT',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            physics: const ClampingScrollPhysics(),
            steps: projectSteps.steps
                .map(
                  (e) => EnhanceStep(
                    icon: Icon(
                      Icons.info,
                      size: 30.h,
                    ),
                    state: StepState.editing,
                    isActive: cubit.stepIndex == e.id,
                    title: Text(e.stepName),
                    subtitle: Text("${e.startDate}-${e.endDate}"),
                    content: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e.details),
                    ),
                  ),
                )
                .toList(),
            onStepCancel: () {
              cubit.go(-1);
            },
            onStepContinue: () {
              cubit.go(1);
            },
            onStepTapped: (index) {
              cubit.stepIndex = index;
            },
          ),
        );
      },
    );
  }
}
