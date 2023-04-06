import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        return Container(
          child: state.projects == null
              ? Center(
                  child: Image.asset(AssetsData.notFound),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.projects!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(5.r),
                      child: ListTile(
                        title: Text("${state.projects?[index].projectName}"),
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
                ),
        );
      },
    );
  }
}
