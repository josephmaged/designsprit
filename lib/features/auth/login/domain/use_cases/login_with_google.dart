import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithGoogleUsecase extends BaseUseCase<UserCredential, NoParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginWithGoogleUsecase(this.baseLoginRepo);

  @override
  Future<Either<Failure, UserCredential>> call(NoParameters noParameters) async {
    return await baseLoginRepo.loginWithGoogle();
  }
}
