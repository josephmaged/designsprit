import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    bool? isFirstTime = CacheHelper.getData(key: Constants.isFirstTime);
    String? uuid = CacheHelper.getData(key: Constants.userID);

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
