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
        return SingleChildScrollView(
          child: state.requestState == RequestState.loaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TimeSheetDropdown(
                      icon: Icons.list,
                      text: 'Select Appointment',
                      items: state.timeSheetResponse!,
                      selectedModel: cubit.selectedTimeSheet,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
