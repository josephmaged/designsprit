import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/item_details/data/models/item_details_model.dart';
import 'package:designsprit/features/item_details/data/models/item_images_model.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseItemDetailsRemoteDataSource {
  Future<List<ItemDetailsModel>> getItemDetails(ItemDetailsParameters parameters);

  Future<List<ItemImagesModel>> getItemImages(ItemImagesParameters parameters);
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
  Future<List<ItemImagesModel>> getItemImages(ItemImagesParameters parameters) async {
    final response = await Dio().get(ApiConst.getItemImageById(parameters.id));


    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ItemImagesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ItemImagesModel.fromJson(data)];
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
}
