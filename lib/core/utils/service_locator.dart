import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FacebookAuth>(FacebookAuth.instance);

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt<FirebaseAuth>(),
    getIt<FacebookAuth>(),
    getIt.get<ApiService>(),
  ));
}
