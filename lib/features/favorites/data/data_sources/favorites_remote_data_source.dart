import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/favorites/data/models/favorites_model.dart';
import 'package:designsprit/features/favorites/domain/use_cases/get_favorites_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseFavoritesRemoteDataSource {
  Future<List<FavoritesModel>> getFavorites(FavoritesParameters parameters);
}

class FavoritesRemoteDataSource extends BaseFavoritesRemoteDataSource {
  @override
  Future<List<FavoritesModel>> getFavorites(FavoritesParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getFavorites(parameters.uid),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => FavoritesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [FavoritesModel.fromJson(data)];
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
