
import 'package:designsprit/core/widgets/flutter_social_button/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        FlutterSocialButton(
          mini: true,
          onTap: () {
            //cubit.registerWithApple();
          },
          buttonType: ButtonType.apple,
        ),
      ],
    );
  }
}