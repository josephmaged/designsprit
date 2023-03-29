import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:designsprit/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:designsprit/features/auth/login/data/repositories/login_repo.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_apple.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_facebook.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_google.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:designsprit/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:designsprit/features/auth/register/data/repositories/register_repo.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_apple.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_email.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_facebook.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_google.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:designsprit/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:designsprit/features/home/data/repositories/HomeRepo.dart';
import 'package:designsprit/features/home/domain/repositories/base_home_repo.dart';
import 'package:designsprit/features/home/domain/use_cases/home_categories_use_case.dart';
import 'package:designsprit/features/home/domain/use_cases/home_populars_use_case.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/features/item_details/presentation/cubit/item_cubit.dart';
import 'package:designsprit/features/items_list/data/data_sources/items_list_remote_data_source.dart';
import 'package:designsprit/features/items_list/data/repositories/items_list_repo.dart';
import 'package:designsprit/features/items_list/domain/repositories/items_list_repo.dart';
import 'package:designsprit/features/items_list/domain/use_cases/get_items_list_usecase.dart';
import 'package:designsprit/features/items_list/presentation/cubit/items_list_cubit.dart';
import 'package:designsprit/features/main_screen/cubit/main_screen_cubit.dart';
import 'package:designsprit/features/project_status/data/data_sources/project_tracker_data_source.dart';
import 'package:designsprit/features/project_status/data/repositories/project_repo.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final sl = GetIt.instance;

class SetupServiceLocator {
  void init() {
    //getIt.registerSingleton<ApiService>(ApiService(Dio()));

    /// BLOC
    sl.registerFactory(() => LoginCubit(sl(), sl()));
    sl.registerFactory(() => RegisterCubit(sl(), sl(), sl()));
    sl.registerFactory(() => MainScreenCubit());
    sl.registerFactory(() => HomeCubit(sl(), sl()));
    sl.registerFactory(() => AddAppointmentCubit());
    sl.registerFactory(() => StatusCubit(sl()));
    sl.registerFactory(() => ItemCubit());
    sl.registerFactory(() => ItemsListCubit(sl()));

    /// Register
    /// USE CASES
    sl.registerLazySingleton(() => RegisterApiUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithAppleUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithGoogleUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithFacebookUsecase(sl()));
    sl.registerLazySingleton(() => RegisterWithEmailUsecase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(() => RegisterRemoteDataSource());

    /// Login
    /// USE CASES
    sl.registerLazySingleton(() => LoginApiUsecase(sl()));
    sl.registerLazySingleton(() => LoginWithAppleUsecase(sl()));
    sl.registerLazySingleton(() => LoginWithGoogleUsecase(sl()));
    sl.registerLazySingleton(() => LoginWithFacebookUsecase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());

    /// Home
    /// USE CASES
    sl.registerLazySingleton(() => HomeCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => HomePopularsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseHomeRepo>(() => HomeRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(() => HomeRemoteDataSource());

    /// Project Tracker
    /// USE CASE
    sl.registerLazySingleton(() => GetProjectStepsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseProjectStepsRepo>(() => ProjectStepsRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseProjectStepsDataSource>(() => ProjectStepsRemoteDataSource());

    /// Items List
    /// USE CASE
    sl.registerLazySingleton(() => GetItemsListUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseItemsListRepo>(() => ItemsListRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseItemsListRemoteDataSource>(() => ItemsListRemoteDataSource());
  }
}
