import 'package:designsprit/features/categories_list/presentation/pages/categories_list.dart';
import 'package:designsprit/features/favorites/presentation/pages/favorites_view.dart';
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
    const Categories(),
    const FavoritesView(),
    const MorePage(),
  ];

  List<String> screenNames = ["Home", "Categories", "Favorite", "More"];

  List<IconData> bottomItems = [
    Icons.home,
    Icons.category,
    Icons.bookmark_border_rounded,
    Icons.more_vert,
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(state.copyWith(currentIndex: currentIndex));
  }
}
