import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/project_status/domain/entities/installments.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentView extends StatelessWidget {
  PaymentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(10.r),
          child: Container(
            child: state.installments == null
                ? Center(
                    child: Image.asset(AssetsData.notFound),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.installments!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String day = state.installments![index].date.split('T').first;
                      return ExpansionTile(
                        title: Text(
                          state.installments![index].projectName,
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.installments![index].installmentValue.toString()} EGP',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      day,
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.installments![index].status,
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
