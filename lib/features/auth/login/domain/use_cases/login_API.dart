import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/repositories/base_login_repo.dart';

import 'package:equatable/equatable.dart';

class LoginApiUsecase extends BaseUseCase<LoginResponse, LoginApiParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginApiUsecase(this.baseLoginRepo);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginApiParameters parameters) async {
    return await baseLoginRepo.loginAPI(parameters);
  }
}

class LoginApiParameters extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String uid;

  const LoginApiParameters({this.name, this.email, this.password, required this.uid});

  @override
  List<Object?> get props => [name, email, password, uid];
}
