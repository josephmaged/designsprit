import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/login/data/models/login_response_model.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';

import 'package:equatable/equatable.dart';

class LoginApiUsecase extends BaseUseCase<List<LoginResponseModel>, LoginApiParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginApiUsecase(this.baseLoginRepo);

  @override
  Future<Either<Failure, List<LoginResponseModel>>> call(LoginApiParameters parameters) async {
    return await baseLoginRepo.loginAPI(parameters);
  }
}

class LoginApiParameters extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String fuid;

  const LoginApiParameters({this.name, this.email, this.password, required this.fuid});

  @override
  List<Object?> get props => [name, email, password, fuid];
}
