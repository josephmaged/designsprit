import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Scaffold(
          body: HomeViewBody(),
        );
      },
    );
  }
}
