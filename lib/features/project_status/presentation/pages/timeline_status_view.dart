import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocConsumer<StatusCubit, StatusState>(
      listener: (context, state) {
        if (state.stepsState == RequestState.loaded){
          GoRouter.of(context).push(AppRouter.kStepsView);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
              titleName: AppStrings.projectTimeline,
              listOfActions: [],
            ),
            body: state.requestState == RequestState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.requestState == RequestState.loaded
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.projects!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(5.r),
                            child: ListTile(
                              title: Text(state.projects![index].projectName),
                              onTap: () {
                                cubit.getSteps(id: state.projects![index].id);
                              },
                              trailing: const Icon(Icons.arrow_forward_ios),
                              tileColor: Colors.grey.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                          );
                        },
                      )
                    : Center(
                        child: Image.asset(AssetsData.notFound),
                      ));
      },
    );
  }
}
