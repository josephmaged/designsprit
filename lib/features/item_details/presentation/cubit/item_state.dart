part of 'item_cubit.dart';

class ItemState extends Equatable {
  final List<ItemDetails>? itemDetailsResponse;
  final List<ItemImages>? itemImagesResponse;
  final RequestState requestState;
  final String? responseMessage;

  const ItemState({
    this.itemDetailsResponse,
    this.itemImagesResponse,
    this.requestState = RequestState.loading,
    this.responseMessage,
  });

  ItemState copyWith({
    List<ItemDetails>? itemDetailsResponse,
    List<ItemImages>? itemImagesResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return ItemState(
      itemDetailsResponse: itemDetailsResponse ?? this.itemDetailsResponse,
      itemImagesResponse: itemImagesResponse ?? this.itemImagesResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        itemDetailsResponse,
        itemImagesResponse,
        requestState,
        responseMessage,
      ];
}
