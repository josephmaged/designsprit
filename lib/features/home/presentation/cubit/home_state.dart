part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeCategoryLoading extends HomeState {}

class HomeCategorySuccess extends HomeState {
  final HomeCategoryResponse categoryModel;

  HomeCategorySuccess(this.categoryModel);
}

class HomeCategoryFailure extends HomeState {
  final String message;

  HomeCategoryFailure(this.message);
}


class HomePopularLoading extends HomeState{

}

class HomePopularFailure extends HomeState{
  final String errMessage;
  HomePopularFailure(this.errMessage);
}
class HomePopularSuccess extends HomeState{
  final HomePopularsResponse homePopularsResponse;
  HomePopularSuccess(this.homePopularsResponse);
}