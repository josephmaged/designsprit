import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/home/data/models/home_category_data_model.dart';
import 'package:designsprit/features/home/data/models/home_populars_data_model.dart';
import 'package:designsprit/features/home/data/models/home_populars_model.dart';
import 'package:dio/dio.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HomeCategoryDataModel>> getCategories();

  Future<List<HomePopularsDataModel>> getPopularItems();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<List<HomeCategoryDataModel>> getCategories() async {
    final response = await Dio().get(ApiConst.getRandomCategories);
    if (response.statusCode == 200) {
      return List<HomeCategoryDataModel>.from(
          (response.data['data'] ?? []).map(
        (e) => HomeCategoryDataModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HomePopularsDataModel>> getPopularItems() async {
    final response = await Dio().get(ApiConst.getRandomItems);
    if (response.statusCode == 200) {
      return List<HomePopularsDataModel>.from(
          (response.data['data'] ?? []).map(
                (e) => HomePopularsDataModel.fromJson(e),
          ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
