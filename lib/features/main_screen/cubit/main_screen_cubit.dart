import 'package:bloc/bloc.dart';
import 'package:designsprit/features/home/presentation/pages/home_view.dart';
import 'package:designsprit/features/more/presentation/pages/more_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const MorePage(),
  ];

  List<String> screenNames = [
    "Home",
    "Chat",
    "Favorite",
    "More"
  ];

  List<IconData> bottomItems = [
    Icons.home,
    Icons.message,
    Icons.bookmark_border_rounded,
    Icons.more_vert,
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(state.copyWith(currentIndex: currentIndex));
  }
}
