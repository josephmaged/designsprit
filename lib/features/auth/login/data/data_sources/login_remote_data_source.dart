import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/auth/login/data/models/login_response_model.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginResponseModel> loginAPI(LoginApiParameters parameters);

  Future<LoginResponseModel> loginWithApple();

  Future<UserCredential> loginWithGoogle();

  Future<LoginResponseModel> loginWithFacebook();
}


class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  late FirebaseAuth auth;

  @override
  Future<LoginResponseModel> loginAPI(LoginApiParameters parameters) async {
    final response = await Dio().get(ApiConst.loginPath(parameters.uid));
    if (response.statusCode == 200) {
      return (response.data['data']).map((e) => LoginResponseModel.fromJson(e));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<LoginResponseModel> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<LoginResponseModel> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var user = await auth.signInWithCredential(credential);
    return user;
  }
}