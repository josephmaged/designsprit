import 'dart:convert';

import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/auth/register/data/models/register_response_model.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_email.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<List<RegisterResponseModel>> registerAPI(RegisterApiParameters parameters);

  Future<UserCredential> registerWithEmail(RegisterEmailParameters parameters);

  Future<RegisterResponseModel> registerWithApple();

  Future<UserCredential> registerWithGoogle();

  Future<RegisterResponseModel> registerWithFacebook();
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  late FirebaseAuth auth;

  @override
  Future<List<RegisterResponseModel>> registerAPI(RegisterApiParameters parameters) async {
    final response = await Dio().post(
      ApiConst.registerPath,
      data: {
        "fuid": parameters.fuid,
        "name": parameters.name,
        "email": parameters.email,
        "phone": parameters.phone,
      },
      options: Options(
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
        },
      ),
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => RegisterResponseModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [RegisterResponseModel.fromJson(data)];
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
  Future<UserCredential> registerWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    late UserCredential userCredential;

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      userCredential = await auth.signInWithCredential(credential);
    }

    return userCredential;
  }

  @override
  Future<UserCredential> registerWithEmail(RegisterEmailParameters parameters) async {
    final user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: parameters.email, password: parameters.password);
    return user;
  }
}
