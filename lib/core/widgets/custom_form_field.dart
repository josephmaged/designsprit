import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
     this.prefixWidget,
     this.suffixWidget,
    required this.label,
    required this.errorMessage,
    required this.textInputType,
    this.maxLines = 1,
    this.minLines = 1,
    this.secure = false
  });

  final TextEditingController controller;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final FormFieldValidator validator;
  final String errorMessage;
  final String label;
  final TextInputType textInputType;
  final bool secure;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: secure,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10.r)),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget
      ),
    );
  }
}