import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepOne extends StatefulWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = AddAppointmentCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomDropdown(
            icon: Icons.list,
            text: 'Select Category',
            items: items,
            selectedValue: cubit.categoryValue,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            controller: cubit.area,
            textInputType: TextInputType.number,
            validator: (value) {},
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
          CustomDropdown(
            icon: Icons.list,
            text: 'Select Images',
            items: items,
            selectedValue: cubit.imagesValue,
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
      ),
    );
  }
}
