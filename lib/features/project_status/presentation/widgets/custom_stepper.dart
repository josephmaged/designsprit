import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            listOfActions: [],
            titleName: AppStrings.projectTimeline,
          ),
          body: EnhanceStepper(
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
                        press: () {
                          cubit.updateProjectTracker(stepId: details.stepIndex, status: true);
                          details.onStepContinue;
                        },
                        text: 'ACCEPT',
                        height: 40.h,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          cubit.updateProjectTracker(stepId: details.stepIndex, status: false);

                          details.onStepCancel;
                        },
                        child: const Text(
                          'REJECT',
                          style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            physics: const ClampingScrollPhysics(),
            steps: Constants.stepsList
                .map(
                  (e) => EnhanceStep(
                    icon: Icon(
                      Icons.info,
                      size: 30.h,
                    ),
                    state: StepState.editing,
                    isActive: cubit.stepIndex == e.id,
                    title: Text(e.stepName),
                    content: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e.status),
                    ),
                  ),
                )
                .toList(),
            onStepCancel: () {
              cubit.go(-1, false);
            },
            onStepContinue: () {
              cubit.go(1, true);
            }, /*
            onStepTapped: (index) {
              cubit.stepIndex = index;
              print(index);
            },*/
          ),
        );
      },
    );
  }
}
