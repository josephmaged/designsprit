import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/item_details/data/models/item_details_model.dart';
import 'package:designsprit/features/item_details/data/models/item_images_model.dart';
import 'package:designsprit/features/item_details/data/models/list_images_model.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/update_item_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseItemDetailsRemoteDataSource {
  Future<List<ItemDetailsModel>> getItemDetails(ItemDetailsParameters parameters);

  Future<List<ListImagesModel>> getItemImages(ItemImagesParameters parameters);

  Future<List<ApiResponse>> updateItem(UpdateItemParameters parameters);
}

class ItemDetailsRemoteDataSource extends BaseItemDetailsRemoteDataSource {
  @override
  Future<List<ItemDetailsModel>> getItemDetails(ItemDetailsParameters parameters) async {
    final response = await Dio().get(ApiConst.getItemById(parameters.id));

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ItemDetailsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ItemDetailsModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: const ErrorMessageModel(
          statusMessage: 'Invalid server response',
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ListImagesModel>> getItemImages(ItemImagesParameters parameters) async {
    final response = await Dio().get(ApiConst.getItemImageById(parameters.id));

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data']['itemImages'];
        if (data is List) {
          return data.map((e) => ListImagesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ListImagesModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: const ErrorMessageModel(
          statusMessage: 'Invalid server response',
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ApiResponse>> updateItem(UpdateItemParameters parameters) async {
    final response = await Dio().post(
      ApiConst.updateItem,
      data: {
        'UserId': parameters.uid,
        'ItemImageId': parameters.itemImageId,
        'IsLiked': parameters.isLiked,
      },
      options: Options(
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
        },
      ),
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => ApiResponse.fromJson(e)).toList();
      } else if (data is Map<String, dynamic>) {
        return [ApiResponse.fromJson(data)];
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
