part of 'item_cubit.dart';

class ItemState extends Equatable {
  final List<ItemDetails> itemDetailsResponse;
  final List<ListImages> itemImagesResponse;
  final List<ApiResponse> updateItemResponse;
  final RequestState requestState;
  final String? responseMessage;

  const ItemState({
    this.itemDetailsResponse = const [],
    this.itemImagesResponse = const [],
    this.updateItemResponse = const [],
    this.requestState = RequestState.loading,
    this.responseMessage,
  });

  ItemState copyWith({
    List<ItemDetails>? itemDetailsResponse,
    List<ListImages>? itemImagesResponse,
    List<ApiResponse>? updateItemResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return ItemState(
      itemDetailsResponse: itemDetailsResponse ?? this.itemDetailsResponse,
      itemImagesResponse: itemImagesResponse ?? this.itemImagesResponse,
      updateItemResponse: updateItemResponse ?? this.updateItemResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        itemDetailsResponse,
        itemImagesResponse,
        updateItemResponse,
        requestState,
        responseMessage,
      ];
}
