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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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


  static final String fuid = CacheHelper.getData(key: Constants.fID);
  Future<void> getItemImages({required String id}) async {
    final result = await getItemImagesUseCase(ItemImagesParameters(id: id, fuid: fuid));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        itemImagesResponse: r,
        requestState: RequestState.loaded,
      ));
    });
  }

  int uid = CacheHelper.getData(key: Constants.userID);

  Future<void> updateItem({required int imageId, required bool isLiked}) async {
    final result = await updateItemUseCase(UpdateItemParameters(uid: uid, itemImageId: imageId, isLiked: !isLiked));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        updateItemResponse: r,
        requestState: RequestState.loaded,
      ));

      Fluttertoast.showToast(
        msg: r.first.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );
    });
  }
  /*Future<bool> updateItemFun({required bool isLiked,required int imageId}) async {


    return updateItem( imageId: imageId, isLiked: isLiked).whenComplete(() => isLiked);

  }*/
}
