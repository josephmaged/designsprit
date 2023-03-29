import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/items_list/data/models/items_list_model.dart';
import 'package:designsprit/features/items_list/domain/use_cases/get_items_list_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseItemsListRemoteDataSource {
  Future<List<ItemsListModel>> getItemsList(GetItemsListParameters parameters);
}

class ItemsListRemoteDataSource extends BaseItemsListRemoteDataSource{
  @override
  Future<List<ItemsListModel>> getItemsList(GetItemsListParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getItemsByCategoryId(parameters.categoryId),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ItemsListModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ItemsListModel.fromJson(data)];
        }
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