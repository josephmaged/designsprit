import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';

class RegisterWithGoogle extends BaseUseCase<RegisterResponse, NoParameters> {
  final BaseRegisterRepo baseRegisterRepo;

  RegisterWithGoogle(this.baseRegisterRepo);

  @override
  Future<Either<Failure, RegisterResponse>> call(NoParameters noParameters) async {
    return await baseRegisterRepo.registerWithGoogle();
  }
}
