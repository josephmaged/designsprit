import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class RegisterRepo extends BaseRegisterRepo {
  final BaseRegisterRemoteDataSource baseRegisterDataSource;

  RegisterRepo(this.baseRegisterDataSource);

  @override
  Future<Either<Failure, List<RegisterResponse>>> registerAPI(RegisterApiParameters parameters) async {
    try {
      final result = await baseRegisterDataSource.registerAPI(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> registerWithApple() async {
    try {
      final result = await baseRegisterDataSource.registerWithApple();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithEmail(RegisterEmailParameters parameters) async {
    try {
      final result = await baseRegisterDataSource.registerWithEmail(parameters);
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(FirebaseFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> registerWithFacebook() async {
    try {
      final result = await baseRegisterDataSource.registerWithFacebook();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithGoogle() async {
    try {
      final result = await baseRegisterDataSource.registerWithGoogle();
      return Right(result);
    } on PlatformException catch (failure) {
      return Left(FirebaseFailure(failure.message!));
    }
  }
}
