import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:designsprit/features/project_status/presentation/widgets/payment_view.dart';
import 'package:designsprit/features/project_status/presentation/widgets/projects_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            AppStrings.projectTimeline,
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: false,
              tabs: [
                Tab(
                  child: Text('Project Steps'),
                ),
                Tab(
                  child: Text('Project Payments'),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ProjectsView(),
            PaymentView(),
          ],
        ),
      ),
    );
  }
}
