import 'package:bloc/bloc.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_google.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginApiUsecase loginApi;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit(this.loginApi, this.loginWithGoogleUsecase) : super(const LoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String uid,
  }) async {
    final result = await loginApi(LoginApiParameters(uid: uid));

    result.fold(
      (l) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            loginMessage: l.errMessage,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            loginResponse: r,
            requestState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> loginWithGoogle() async {
    final result = await loginWithGoogleUsecase(const NoParameters());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            loginMessage: l.errMessage,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            userCredential: r,
            requestState: RequestState.loaded,
          ),
        );
      },
    );
  }

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(state.copyWith(isPassword: isPassword));
  }

  bool checked = false;

  void changeCheckState() {
    checked = !checked;
    emit(state.copyWith(checkState: checked));
  }
}
