import 'package:bloc/bloc.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/item_details/domain/entities/item_details.dart';
import 'package:designsprit/features/item_details/domain/entities/item_images.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';
import 'package:equatable/equatable.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final GetItemDetailsUseCase getItemDetailsUseCase;
  final GetItemImagesUseCase getItemImagesUseCase;

  ItemCubit(
    this.getItemDetailsUseCase,
    this.getItemImagesUseCase,
  ) : super(const ItemState());

  Future<void> getItemDetails({required String id}) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getItemDetailsUseCase(ItemDetailsParameters(id: id));


    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        itemDetailsResponse: r,
      ));
    });
  }

  Future<void> getItemImages({required String id}) async {

    final result = await getItemImagesUseCase(ItemImagesParameters(id: id));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        itemImagesResponse: r,
        requestState: RequestState.loaded
      ));
    });
  }
}
