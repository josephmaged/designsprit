part of 'items_list_cubit.dart';

class ItemsListState extends Equatable {
  final List<ItemsList>? itemsList;
  final RequestState? requestState;
  final String? responseMessage;

  const ItemsListState({
    this.itemsList,
    this.requestState,
    this.responseMessage,
  });

  ItemsListState copyWith({
    List<ItemsList>? itemsList,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return ItemsListState(
      itemsList: itemsList ?? this.itemsList,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        itemsList,
        requestState,
        responseMessage,
      ];
}
