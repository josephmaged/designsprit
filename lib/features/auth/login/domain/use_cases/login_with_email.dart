import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithEmailUsecase extends BaseUseCase<UserCredential, LoginEmailParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginWithEmailUsecase(this.baseLoginRepo);

  @override
  Future<Either<Failure, UserCredential>> call(LoginEmailParameters parameters) async {
    return await baseLoginRepo.loginWithEmail(parameters);
  }
}

class LoginEmailParameters extends Equatable {
  final String email;
  final String password;

  const LoginEmailParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
