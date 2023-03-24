import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocConsumer<StatusCubit, StatusState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: AppStrings.projectTimeline,
          ),
          body: EnhanceStepper(
            stepIconSize: 30,
            type: cubit.stepType,
            horizontalTitlePosition: HorizontalTitlePosition.bottom,
            horizontalLinePosition: HorizontalLinePosition.top,
            currentStep: cubit.stepIndex,
            physics: const ClampingScrollPhysics(),
            steps: cubit.steps
                .map((e) => EnhanceStep(
                      icon: Icon(
                        e.item2,
                        size: 30,
                      ),
                      state: e.item3,
                      isActive: cubit.stepIndex == cubit.steps.indexOf(e),
                      title: Text(e.item1),
                      subtitle: Text(
                        e.item4.toString(),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                        ],
                      ),
                    ))
                .toList(),
            onStepCancel: () {
              cubit.go(-1);
            },
            onStepContinue: () {
              cubit.go(1);
            },
            onStepTapped: (index) {
              print(index);
              cubit.stepIndex = index;
            },
          ),
        );
      },
    );
  }
}
