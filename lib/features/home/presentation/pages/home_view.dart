import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            tittle: 'Home',
            color: kPrimaryColor,
          ),
          body: const HomeViewBody(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              HomeCubit.get(context).changeIndex(index);
            },
            currentIndex: HomeCubit.get(context).currentIndex,
            items: HomeCubit.get(context).bottomItems,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 4)),
            onPressed: () {
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
