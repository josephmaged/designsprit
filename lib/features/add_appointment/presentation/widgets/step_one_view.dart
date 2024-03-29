import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_multi_dropdown.dart';
import 'package:designsprit/features/add_appointment/domain/entities/families.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepOne extends StatefulWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return BlocBuilder<AddAppointmentCubit, AddAppointmentState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: state.categoryState == RequestState.loaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomDropdown(
                      icon: Icons.list,
                      text: 'Select Family',
                      items: state.familiesResponse
                          .map(
                            (item) => DropdownMenuItem<Families>(
                              value: item,
                              child: Text(
                                item.familiesName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      selectedValue: state.familiesValue ?? state.familiesResponse.first,
                      onChanged: (value) {
                        cubit.updateFamiliesValue(value);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomDropdown(
                      icon: Icons.list,
                      text: 'Select Category',
                      items: state.categoriesDropdown == null
                          ? state.categoriesResponse
                              .map(
                                (item) => DropdownMenuItem<int>(
                                  value: item.id,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList()
                          : state.categoriesDropdown!
                              .map(
                                (item) => DropdownMenuItem<int>(
                                  value: item.id,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                      selectedValue: state.categoryValue == 0 ? state.categoriesResponse.first.id : state.categoryValue,
                      onChanged: (value) {
                        cubit.updateCategoryValue(value);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      controller: cubit.area,
                      textInputType: TextInputType.number,
                      validator: (value) => Validator.validateEmail(value),
                      label: 'Area',
                      prefixWidget: Icon(
                        Icons.numbers,
                        size: 20.w,
                      ),
                      errorMessage: 'Please enter Area',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomDropdown2(
                      icon: Icons.list,
                      text: 'Select Images',
                      items: Constants.favorites != [] ? Constants.favorites : ['No Favorites', 'Add some Likes'],
                      selectedItems: cubit.selectedFavorites,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      controller: cubit.notes,
                      textInputType: TextInputType.multiline,
                      validator: (value) {},
                      label: 'Notes',
                      prefixWidget: Icon(
                        Icons.edit_note,
                        size: 20.w,
                      ),
                      maxLines: 5,
                      minLines: 1,
                      errorMessage: 'Please enter your Notes',
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
