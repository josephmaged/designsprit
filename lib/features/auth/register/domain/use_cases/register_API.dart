import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/repositories/base_register_repo.dart';
import 'package:equatable/equatable.dart';

class RegisterApiUsecase extends BaseUseCase<List<RegisterResponse>, RegisterApiParameters> {
  final BaseRegisterRepo baseRegisterRepo;

  RegisterApiUsecase(this.baseRegisterRepo);

  @override
  Future<Either<Failure, List<RegisterResponse>>> call(RegisterApiParameters parameters) async {
    return await baseRegisterRepo.registerAPI(parameters);
  }
}

class RegisterApiParameters extends Equatable {
  final String fuid;
  final String? name;
  final String? email;
  final String? phone;

  const RegisterApiParameters({
    required this.fuid,
     this.name,
     this.email,
    this.phone,
  });

  @override
  List<Object?> get props => [fuid, name, email, phone];
}
