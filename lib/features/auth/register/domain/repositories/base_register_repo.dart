import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:dartz/dartz.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseRegisterRepo {
  Future<Either<Failure, RegisterResponse>> registerWithFacebook();

  Future<Either<Failure, UserCredential>> registerWithGoogle();

  Future<Either<Failure, RegisterResponse>> registerWithApple();

  Future<Either<Failure, UserCredential>> registerWithEmail(RegisterEmailParameters parameters);

  Future<Either<Failure, List<RegisterResponse>>> registerAPI(RegisterApiParameters parameters);
}