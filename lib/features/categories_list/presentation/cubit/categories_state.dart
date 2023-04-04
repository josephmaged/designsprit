part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final List<Categories> categoriesList;
  final RequestState requestState;
  final String responseMessage;

  const CategoriesState({
    this.categoriesList = const [],
    this.requestState = RequestState.loading,
    this.responseMessage = '',
  });

  CategoriesState copyWith({
    List<Categories>? categoriesList,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return CategoriesState(
      categoriesList: categoriesList ?? this.categoriesList,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        categoriesList,
        requestState,
        responseMessage,
      ];
}
