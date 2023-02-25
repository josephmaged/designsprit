import 'package:designsprit/constants.dart';
import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
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
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  TextEditingController area = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomDropdown(
            icon: Icons.list,
            text: 'Select Need',
            items: items,
            selectedValue: selectedValue1,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomDropdown(
            icon: Icons.list,
            text: 'Select Project Type',
            items: items,
            selectedValue: selectedValue2,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            controller: area,
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
            text: 'Select Design Theme',
            items: items,
            selectedValue: selectedValue3,
          ),
        ],
      ),
    );
  }
}
