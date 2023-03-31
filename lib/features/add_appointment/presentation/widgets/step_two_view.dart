import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return BlocBuilder<AddAppointmentCubit, AddAppointmentState>(
      builder: (context, state) {
        return state.requestState == RequestState.loaded
            ? Column(
                children: [
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Country',
                    items: cubit.countries,
                    selectedValue: cubit.countryValue,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Government',
                    items: cubit.governments,
                    selectedValue: cubit.governmentValue,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Region',
                    items: cubit.regions,
                    selectedValue: cubit.regionValue,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: cubit.street,
                    textInputType: TextInputType.streetAddress,
                    validator: (value) {},
                    label: 'Address',
                    prefixWidget: Icon(
                      Icons.location_on,
                      size: 20.w,
                    ),
                    maxLines: 5,
                    minLines: 1,
                    errorMessage: 'Please enter address',
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
