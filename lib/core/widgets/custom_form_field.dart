
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: secure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget
      ),
    );
  }
}