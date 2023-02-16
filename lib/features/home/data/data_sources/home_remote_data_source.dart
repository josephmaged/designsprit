import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/home/data/models/home_category_model.dart';
import 'package:designsprit/features/home/data/models/home_populars_model.dart';
import 'package:dio/dio.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeCategoryModel> getCategories();

  Future<HomePopularsModel> getPopularItems();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<HomeCategoryModel> getCategories() async {
    final response = await Dio().get(ApiConst.getRandomCategories);
    if (response.statusCode == 200) {
      return HomeCategoryModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<HomePopularsModel> getPopularItems() async {
    final response = await Dio().get(ApiConst.GetRandomItems);
    if (response.statusCode == 200) {
      return HomePopularsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
