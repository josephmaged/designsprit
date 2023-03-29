import 'package:designsprit/features/items_list/domain/use_cases/get_items_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/items_list/domain/entities/items_list.dart';
import 'package:equatable/equatable.dart';

part 'items_list_state.dart';

class ItemsListCubit extends Cubit<ItemsListState> {
  final GetItemsListUseCase getItemsListUseCase;

  ItemsListCubit(
    this.getItemsListUseCase,
  ) : super(const ItemsListState());

  static ItemsListCubit get(context) => BlocProvider.of(context);

  Future<void> getItemsList({required String categoryId}) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));

    print(categoryId);
    final result = await getItemsListUseCase(GetItemsListParameters(categoryId: categoryId));

    result.fold((l) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          responseMessage: l.errMessage,
        ),
      );
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        itemsList: r,
      ));
    });
  }
}
