import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/timesheet_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return BlocBuilder<AddAppointmentCubit, AddAppointmentState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            if(state.responseMessage == "Not avalable time ..") {
              Center(
                child: Image.asset(AssetsData.notFound),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Select Appointment',
                    items: state.timeSheetResponse
                        .map(
                          (item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Text(
                              "${item.date} - ${(item.time)?.split(".").first}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    selectedValue: state.timeSheetValue == 0 ? state.timeSheetResponse.first.id : state.timeSheetValue,
                    onChanged: (value) {
                      cubit.updateTimeSheetValue(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          case RequestState.error:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
