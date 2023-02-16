import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, LoginResponse>> loginWithFacebook();

  Future<Either<Failure, UserCredential>> loginWithGoogle();

  Future<Either<Failure, UserCredential>> loginWithEmail(LoginEmailParameters parameters);

  Future<Either<Failure, LoginResponse>> loginWithApple();

  Future<Either<Failure, LoginResponse>> loginAPI(LoginApiParameters parameters);
}