import 'package:designsprit/core/utils/function/launch_url.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        child: Center(
          child: Text.rich(
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            TextSpan(
              text: 'By continuing, you agree to our ',
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms of Service \n',
                  style: TextStyle(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // code to open / launch terms of service link here
                    },
                ),
                TextSpan(
                  text: 'and ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchCustomUr(context, 'https://policies.google.com/terms?hl=en-EG&fg=1');
                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
