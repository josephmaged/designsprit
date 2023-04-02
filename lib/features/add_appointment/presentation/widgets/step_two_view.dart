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
                    items: state.countriesResponse
                        .map(
                          (item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Text(
                              item.countryName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    selectedValue: state.countryValue == 0 ? state.countriesResponse.first.id : state.countryValue,
                    onChanged: (value) {
                      cubit.updateCountryValue(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Government',
                    items: state.governmentsResponse
                        .map(
                          (item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Text(
                              item.govName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    selectedValue:
                        state.governmentValue == 0 ? state.governmentsResponse.first.id : state.governmentValue,
                    onChanged: (value) {
                      cubit.updateGovernmentValue(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomDropdown(
                    icon: Icons.list,
                    text: 'Region',
                    items: state.regionsResponse
                        .map(
                          (item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Text(
                              item.regionName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    selectedValue: state.regionValue == 0 ? state.regionsResponse.first.id : state.regionValue,
                    onChanged: (value) {
                      cubit.updateRegionValue(value);
                    },
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
