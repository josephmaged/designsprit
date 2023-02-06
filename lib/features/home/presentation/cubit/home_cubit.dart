import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark_border_rounded,
      ),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: 'More'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState());
  }
}
