import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/auth/register/data/models/register_response_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterResponseModel> registerAPI();

  Future<RegisterResponseModel> registerWithApple();

  Future<RegisterResponseModel> registerWithGoogle();

  Future<RegisterResponseModel> registerWithFacebook();
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<RegisterResponseModel> registerAPI() async {
    final response = await Dio().get(ApiConst.registerPath);
    if (response.statusCode == 200) {
      return (response.data['data']).map((e) => RegisterResponseModel.fromJson(e));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<RegisterResponseModel> registerWithApple() {
    // TODO: implement registerWithApple
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseModel> registerWithFacebook() {
    // TODO: implement registerWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseModel> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }
}
