import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/categories_list/data/models/categories_model.dart';
import 'package:designsprit/features/categories_list/domain/use_cases/get_categories_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseCategoriesRemoteDataSource {
  Future<List<CategoriesModel>> getCategories(CategoriesParameters parameters);
}

class CategoriesRemoteDataSource extends BaseCategoriesRemoteDataSource {
  @override
  Future<List<CategoriesModel>> getCategories(CategoriesParameters parameters) async {
    final response = await Dio().get(ApiConst.getCategoriesList(parameters.id));
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => CategoriesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [CategoriesModel.fromJson(data)];
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
