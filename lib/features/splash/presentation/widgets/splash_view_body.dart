import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.logo,
        width: 150.w,
      ),
    );
  }

  void navigateToHome() {
    bool? isFirstTime = CacheHelper.getData(key: Constants.isFirstTime);
    String? uuid = CacheHelper.getData(key: Constants.fID);

    print(isFirstTime);

    if (isFirstTime ?? true) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          GoRouter.of(context).pushReplacement(AppRouter.konBoardingView);
        },
      );
    } else {
      if (uuid == null) {
        Future.delayed(const Duration(seconds: 2), () {
          GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          GoRouter.of(context).pushReplacement(AppRouter.kMainScreenView);
        });
      }
    }
  }
}
