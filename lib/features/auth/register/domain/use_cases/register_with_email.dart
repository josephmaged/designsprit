import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterWithEmailUsecase extends BaseUseCase<UserCredential, RegisterEmailParameters> {
  final BaseRegisterRepo baseRegisterRepo;

  RegisterWithEmailUsecase(this.baseRegisterRepo);

  @override
  Future<Either<Failure, UserCredential>> call(RegisterEmailParameters parameters) async {
    return await baseRegisterRepo.registerWithEmail(parameters);
  }
}

class RegisterEmailParameters extends Equatable {
  final String email;
  final String password;

  const RegisterEmailParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
