import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';

class LoginWithFacebookUsecase extends BaseUseCase<LoginResponse, NoParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginWithFacebookUsecase(this.baseLoginRepo);

  @override
  Future<Either<Failure, LoginResponse>> call(NoParameters noParameters) async {
    return await baseLoginRepo.loginWithFacebook();
  }
}
