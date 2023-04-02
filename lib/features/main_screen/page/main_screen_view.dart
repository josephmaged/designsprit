import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/main_screen/cubit/main_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MainScreenCubit.get(context);
    return BlocConsumer<MainScreenCubit, MainScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: cubit.screenNames[cubit.currentIndex],
            notificationIconClickedCallBack: () {
              GoRouter.of(context).push(AppRouter.kNotificationsView);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            activeIndex: cubit.currentIndex,
            icons: cubit.bottomItems,
            gapLocation: GapLocation.center,
            backgroundColor: kPrimaryColor,
            activeColor: kSecondaryColor,
            inactiveColor: Colors.white,
            leftCornerRadius: 15,
            rightCornerRadius: 15,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kSecondaryColor,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAppointmentView);
            },
            child: const Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
