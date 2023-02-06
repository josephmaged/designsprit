import 'package:designsprit/constants.dart';
import 'package:designsprit/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          elevation: 0),
      body: SplashViewBody(),
    );
  }
}
