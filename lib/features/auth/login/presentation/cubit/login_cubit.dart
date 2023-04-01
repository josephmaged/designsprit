import 'dart:convert';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/auth/login/data/models/login_response_model.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_email.dart';
import 'package:designsprit/features/auth/login/domain/use_cases/login_with_google.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginApiUsecase loginApi;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;
  final LoginWithEmailUsecase loginWithEmailUsecase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit(this.loginApi, this.loginWithGoogleUsecase, this.loginWithEmailUsecase) : super(const LoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login() async {
    print(state.userCredential!.user!.uid);
    final result = await loginApi(LoginApiParameters(fuid: state.userCredential!.user!.uid));

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
        CacheHelper.saveData(key: Constants.fID, value: r[0].fuid);
        CacheHelper.saveData(key: Constants.userID, value: r[0].id);
        String user = jsonEncode(r[0]);
        CacheHelper.saveData(key: Constants.userData, value: user);
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(requestState: RequestState.loading));

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
          ),
        );

        login();
      },
    );
  }

  Future<void> loginWithEmail() async {
    emit(state.copyWith(requestState: RequestState.loading));
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
