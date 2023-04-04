import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenDemo extends StatelessWidget {
  const ChatScreenDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController demo = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(titleName: AppStrings.chat, listOfActions: []),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: demo,
                    validator: (value) => Validator.validateName(value),
                    label: "Enter your message",
                    errorMessage: "Please enter your message",
                    textInputType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Icon(Icons.send),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
