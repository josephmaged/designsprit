import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterWithGoogleUsecase extends BaseUseCase<UserCredential, NoParameters> {
  final BaseRegisterRepo baseRegisterRepo;

  RegisterWithGoogleUsecase(this.baseRegisterRepo);

  @override
  Future<Either<Failure, UserCredential>> call(NoParameters parameters) async {
    return await baseRegisterRepo.registerWithGoogle();
  }
}
