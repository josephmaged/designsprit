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
            tittle: 'Home',
            color: kPrimaryColor,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 4)),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouter.kProjectView);
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
