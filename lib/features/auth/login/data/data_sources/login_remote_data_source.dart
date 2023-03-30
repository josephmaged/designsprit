import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/auth/login/data/models/login_response_model.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_email.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseLoginRemoteDataSource {
  Future<List<LoginResponseModel>> loginAPI(LoginApiParameters parameters);

  Future<LoginResponseModel> loginWithApple();

  Future<UserCredential> loginWithGoogle();

  Future<UserCredential> loginWithEmail(LoginEmailParameters parameters);

  Future<LoginResponseModel> loginWithFacebook();
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  late FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<List<LoginResponseModel>> loginAPI(LoginApiParameters parameters) async {
    final response = await Dio().get(ApiConst.loginPath(parameters.fuid));
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => LoginResponseModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [LoginResponseModel.fromJson(data)];
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

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(credential);
      return userCredential;
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
        message: 'Missing Google Auth Token',
      );
    }
  }

  @override
  Future<UserCredential> loginWithEmail(LoginEmailParameters parameters) async {
    final user =
        await auth.signInWithEmailAndPassword(email: parameters.email, password: parameters.password);
    return user;
  }
}
