import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTwo extends StatelessWidget {
  TextEditingController country = TextEditingController();
  TextEditingController government = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: country,
          textInputType: TextInputType.streetAddress,
          validator: (value) {},
          label: 'Country',
          errorMessage: 'Please enter a country',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          controller: country,
          textInputType: TextInputType.streetAddress,
          validator: (value) {},
          label: 'Government',
          errorMessage: 'Please enter a government',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          controller: country,
          textInputType: TextInputType.streetAddress,
          validator: (value) {},
          label: 'Region',
          errorMessage: 'Please enter a region',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          controller: country,
          textInputType: TextInputType.streetAddress,
          validator: (value) {},
          label: 'Address',
          errorMessage: 'Please enter address',
        ),
      ],
    );
  }
}
