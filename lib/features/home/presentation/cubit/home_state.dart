part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<HomeCategoryResponseData> randomCategory;
  final RequestState randomCategoryState;
  final String randomCategoryMessage;

  const HomeState(
      {this.randomCategory = const [],
      this.randomCategoryState = RequestState.loading,
      this.randomCategoryMessage = ''});

  HomeState copyWith({
     List<HomeCategoryResponseData>? randomCategory,
     RequestState? randomCategoryState,
     String? randomCategoryMessage,
}) {
    return HomeState(
      randomCategory: randomCategory ?? this.randomCategory,
      randomCategoryState: randomCategoryState ?? this.randomCategoryState,
      randomCategoryMessage: randomCategoryMessage ?? this.randomCategoryMessage
    );
  }

  @override
  List<Object?> get props => [
    randomCategory,
    randomCategoryState,
    randomCategoryMessage
  ];
}
