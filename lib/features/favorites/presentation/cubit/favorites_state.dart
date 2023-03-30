part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  final List<Favorites> requestResponse;
  final RequestState requestState;
  final String responseMessage;

  const FavoritesState({
    this.requestResponse = const [],
    this.requestState = RequestState.loading,
    this.responseMessage = '',
  });

  FavoritesState copyWith({
    List<Favorites>? requestResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return FavoritesState(
      requestResponse: requestResponse ?? this.requestResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        requestResponse,
        requestState,
        responseMessage,
      ];
}
