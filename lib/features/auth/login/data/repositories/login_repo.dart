import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:designsprit/features/auth/login/data/models/login_response_model.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo extends BaseLoginRepo {
  final BaseLoginRemoteDataSource baseLoginDataSource;

  LoginRepo(this.baseLoginDataSource);

  @override
  Future<Either<Failure, List<LoginResponseModel>>> loginAPI(LoginApiParameters parameters) async {
    final result = await baseLoginDataSource.loginAPI(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> loginWithApple() async {
    final result = await baseLoginDataSource.loginWithApple();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> loginWithFacebook() async {
    final result = await baseLoginDataSource.loginWithFacebook();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithGoogle() async {
    final result = await baseLoginDataSource.loginWithGoogle();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithEmail(LoginEmailParameters parameters) async {
    try {
      final result = await baseLoginDataSource.loginWithEmail(parameters);
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
