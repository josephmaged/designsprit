import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/profile/data/models/user_data_model.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';
import 'package:dio/dio.dart';

abstract class BaseProfileRemoteDataSource {
  Future<List<UserDataModel>> updateUserData(UserData parameters);
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  @override
  Future<List<UserDataModel>> updateUserData(UserData parameters) async {
    print(parameters);
    final formData = FormData.fromMap({
      "Fuid": parameters.fuid,
      "UserName": parameters.userName,
      "UserEmail": parameters.userEmail,
      "Phone": parameters.phone,
      "Mobile": parameters.mobile,
      "Description": null,
      "Image": parameters.imageFile,
      "KnownFrom": parameters.source,
    });
    final response = await Dio().post(
      ApiConst.updateUserData,
      data: formData,
      options: Options(
        headers: {
          "Content-Type": 'multipart/form-data',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        },
      ),
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => UserDataModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [UserDataModel.fromJson(data)];
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
