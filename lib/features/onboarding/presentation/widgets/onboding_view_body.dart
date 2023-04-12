import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'onboarding_pages.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: IntroductionScreen(
          pages: pages,
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Done"),
          onDone: () {
            CacheHelper.saveData(key: Constants.isFirstTime, value: false)
                .then((value) {
              if (value!) {
                GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
              }
            });
          },
          baseBtnStyle: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
          ),
          skipStyle: TextButton.styleFrom(foregroundColor: Colors.red),
          doneStyle: TextButton.styleFrom(foregroundColor: Colors.green),
          nextStyle: TextButton.styleFrom(foregroundColor: Colors.blue),
        ),
      ),
    );
  }
}
