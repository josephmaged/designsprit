part of 'item_cubit.dart';

class ItemState extends Equatable {
  final List<ItemDetails>? itemDetailsResponse;
  final List<ListImages>? itemImagesResponse;
  final List<ApiResponse>? updateItemResponse;
  final RequestState requestState;
  final String? responseMessage;
  final bool? isLiked;

  const ItemState(
      {this.itemDetailsResponse,
      this.itemImagesResponse,
      this.updateItemResponse,
      this.requestState = RequestState.loading,
      this.responseMessage,
      this.isLiked});

  ItemState copyWith({
    List<ItemDetails>? itemDetailsResponse,
    List<ListImages>? itemImagesResponse,
    List<ApiResponse>? updateItemResponse,
    RequestState? requestState,
    String? responseMessage,
    bool? isLiked,
  }) {
    return ItemState(
      itemDetailsResponse: itemDetailsResponse ?? this.itemDetailsResponse,
      itemImagesResponse: itemImagesResponse ?? this.itemImagesResponse,
      updateItemResponse: updateItemResponse ?? this.updateItemResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [
        itemDetailsResponse,
        itemImagesResponse,
        updateItemResponse,
        requestState,
        responseMessage,
        isLiked,
      ];
}
