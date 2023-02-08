import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:designsprit/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:designsprit/features/auth/register/data/repositories/register_repo.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_apple.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_facebook.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_google.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  /// BLOC
  getIt.registerFactory(() => LoginCubit());
  getIt.registerFactory(() => RegisterCubit(getIt()));

  /// USE CASES
  getIt.registerSingleton(() => RegisterApi(getIt()));
  getIt.registerSingleton(() => RegisterWithApple(getIt()));
  getIt.registerSingleton(() => RegisterWithGoogle(getIt()));
  getIt.registerSingleton(() => RegisterWithFacebook(getIt()));

  /// Repository
  getIt.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(getIt()));

  /// DATA SOURCE
  getIt.registerLazySingleton<BaseRegisterRemoteDataSource>(() => RegisterRemoteDataSource());


  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FacebookAuth>(FacebookAuth.instance);

  /*getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt<FirebaseAuth>(),
    getIt<FacebookAuth>(),
    getIt.get<ApiService>(),
  ));*/
}
