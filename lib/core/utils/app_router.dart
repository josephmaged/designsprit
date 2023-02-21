import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:designsprit/features/add_appointment/presentation/pages/add_appointment.dart';
import 'package:designsprit/features/auth/login/presentation/pages/login_view.dart';
import 'package:designsprit/features/auth/register/presentation/pages/register_view.dart';
import 'package:designsprit/features/home/presentation/pages/home_view.dart';
import 'package:designsprit/features/main_screen/page/main_screen_view.dart';
import 'package:designsprit/features/more/presentation/pages/more_page.dart';
import 'package:designsprit/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:designsprit/features/profile/presentation/pages/profile_view.dart';
import 'package:designsprit/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kMainScreenView = '/mainScreenView';
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const konBoardingView = '/onBoarding';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kRegisterView = '/registerView';
  static const kAppointmentView = '/addAppointment';
  static const kMoreView = '/moreView';
  static const kProfileView = '/profileView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ScreenUtilInit(
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          builder: (BuildContext context, Widget? child) {
            return const SplashView();
          },
        ),
      ),
      GoRoute(
        path: konBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kMainScreenView,
        builder: (context, state) => const MainScreenView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kMoreView,
        builder: (context, state) => const MorePage(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kAppointmentView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AddAppointmentCubit>(),
          child: const AddAppointment(),
        ),
      ),
    ],
  );
}
