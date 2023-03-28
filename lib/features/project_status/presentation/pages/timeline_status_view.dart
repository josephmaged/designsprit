import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:designsprit/features/project_status/presentation/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatusCubit, StatusState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: AppStrings.projectTimeline,
          ),
          body: state.requestState == RequestState.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.responseMessage == "Not Found"
                  ? Center(
                      child: Image.asset(AssetsData.notFound),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.projectSteps!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTile(
                          title: Text(state.projectSteps![index].projectName),
                          children: [CustomStepper(projectSteps: state.projectSteps![index])],
                        );
                      },
                    ),
        );
      },
    );
  }
}
