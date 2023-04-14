part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<HomeFamiliesResponseData> randomFamilies;
  final RequestState randomFamiliesState;
  final String randomFamiliesMessage;

  final List<HomePopularsResponseData> mostPopular;
  final RequestState mostPopularState;
  final String mostPopularMessage;

  const HomeState(
      {this.randomFamilies = const [],
      this.randomFamiliesState = RequestState.loading,
      this.randomFamiliesMessage = '',
      this.mostPopular = const [],
      this.mostPopularState = RequestState.loading,
      this.mostPopularMessage = ''});

  HomeState copyWith({
    List<HomeFamiliesResponseData>? randomFamilies,
    RequestState? randomFamiliesState,
    String? randomFamiliesMessage,
    List<HomePopularsResponseData>? mostPopular,
    RequestState? mostPopularState,
    String? mostPopularMessage,
  }) {
    return HomeState(
        randomFamilies: randomFamilies ?? this.randomFamilies,
        randomFamiliesState: randomFamiliesState ?? this.randomFamiliesState,
        randomFamiliesMessage: randomFamiliesMessage ?? this.randomFamiliesMessage,
        mostPopular: mostPopular ?? this.mostPopular,
        mostPopularState: mostPopularState ?? this.mostPopularState,
        mostPopularMessage: mostPopularMessage ?? this.mostPopularMessage);
  }

  @override
  List<Object?> get props => [
        randomFamilies,
        randomFamiliesState,
        randomFamiliesMessage,
        mostPopular,
        mostPopularState,
        mostPopularMessage,
      ];
}
