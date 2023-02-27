part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<HomeCategoryResponseData> randomCategory;
  final RequestState randomCategoryState;
  final String randomCategoryMessage;

  final List<HomePopularsResponseData> mostPopular;
  final RequestState mostPopularState;
  final String mostPopularMessage;

  const HomeState(
      {this.randomCategory = const [],
      this.randomCategoryState = RequestState.loading,
      this.randomCategoryMessage = '',
      this.mostPopular = const [],
      this.mostPopularState = RequestState.loading,
      this.mostPopularMessage = ''});

  HomeState copyWith({
    List<HomeCategoryResponseData>? randomCategory,
    RequestState? randomCategoryState,
    String? randomCategoryMessage,
    List<HomePopularsResponseData>? mostPopular,
    RequestState? mostPopularState,
    String? mostPopularMessage,
  }) {
    return HomeState(
        randomCategory: randomCategory ?? this.randomCategory,
        randomCategoryState: randomCategoryState ?? this.randomCategoryState,
        randomCategoryMessage: randomCategoryMessage ?? this.randomCategoryMessage,
        mostPopular: mostPopular ?? this.mostPopular,
        mostPopularState: mostPopularState ?? this.mostPopularState,
        mostPopularMessage: mostPopularMessage ?? this.mostPopularMessage);
  }

  @override
  List<Object?> get props => [
        randomCategory,
        randomCategoryState,
        randomCategoryMessage,
        mostPopular,
        mostPopularState,
        mostPopularMessage,
      ];
}
