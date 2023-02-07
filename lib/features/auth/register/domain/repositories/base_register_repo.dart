import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRegisterRepo {
  Future<Either<Failure, RegisterResponse>> registerWithFacebook();

  Future<Either<Failure, RegisterResponse>> registerWithGoogle();

  Future<Either<Failure, RegisterResponse>> registerWithApple();

  Future<Either<Failure, RegisterResponse>> registerAPI();
}