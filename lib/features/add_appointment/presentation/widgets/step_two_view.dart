import 'package:designsprit/core/widgets/custom_dropdown.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTwo extends StatelessWidget {
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
  String? countryValue;
  String? governmentValue;
  String? regionValue;
  TextEditingController street = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(
          icon: Icons.list,
          text: 'Country',
          items: items,
          selectedValue: countryValue,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomDropdown(
          icon: Icons.list,
          text: 'Government',
          items: items,
          selectedValue: governmentValue,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomDropdown(
          icon: Icons.list,
          text: 'Region',
          items: items,
          selectedValue: regionValue,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          controller: street,
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
    );
  }
}
