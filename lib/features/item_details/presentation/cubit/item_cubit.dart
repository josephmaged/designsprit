import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/item_details/domain/entities/item_details.dart';
import 'package:designsprit/features/item_details/domain/entities/list_images.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/update_item_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final GetItemDetailsUseCase getItemDetailsUseCase;
  final GetItemImagesUseCase getItemImagesUseCase;
  final UpdateItemUseCase updateItemUseCase;

  ItemCubit(
    this.getItemDetailsUseCase,
    this.getItemImagesUseCase,
    this.updateItemUseCase,
  ) : super(const ItemState());

  static ItemCubit get(context) => BlocProvider.of(context);

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
      emit(state.copyWith(itemImagesResponse: r, requestState: RequestState.loaded));
    });
  }

  int uid = CacheHelper.getData(key: Constants.userID);

  Future<void> updateItem({required int uId, required int imageId, required bool isLiked}) async {
    final result = await updateItemUseCase(UpdateItemParameters(uid: uId, itemImageId: imageId, isLiked: Constants.isLiked));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        updateItemResponse: r,
        requestState: RequestState.loaded,
        isLiked: !isLiked,
      ));

      Fluttertoast.showToast(
        msg: r.first.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    });
  }

  Future<void> updateItemFun({required int imageId}) async {
    print(Constants.isLiked);


    Constants.isLiked = !Constants.isLiked;
    await updateItem(uId: uid, imageId: imageId, isLiked: Constants.isLiked);
  }
}
