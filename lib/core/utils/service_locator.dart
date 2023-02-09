import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:designsprit/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:designsprit/features/auth/register/data/repositories/register_repo.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_apple.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_facebook.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_google.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final sl = GetIt.instance;

class SetupServiceLocator {
  void init(){
    //getIt.registerSingleton<ApiService>(ApiService(Dio()));


    /// BLOC
    sl.registerFactory(() => LoginCubit());
    sl.registerFactory(() => RegisterCubit(sl(),sl()));

    /// USE CASES
    sl.registerLazySingleton(() => RegisterApiUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithAppleUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithGoogleUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithFacebookUsecase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(() => RegisterRemoteDataSource());


/*    sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    sl.registerSingleton<FacebookAuth>(FacebookAuth.instance);*/

    /*sl.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    sl<FirebaseAuth>(),
    sl<FacebookAuth>(),
    sl.get<ApiService>(),
  ));*/
  }
}
