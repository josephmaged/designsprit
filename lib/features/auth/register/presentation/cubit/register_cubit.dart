import 'package:bloc/bloc.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterApi registerApi;

  RegisterCubit(this.registerApi) : super(RegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await registerApi(RegisterApiParameters(
      name: name,
      email: email,
      password: password,
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        registerMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        registerResponse: r,
        requestState: RequestState.loaded,
      ));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

  bool checked = false;

  void changeCheckState() {
    checked = !checked;
    emit(RegisterChangeRememberMeState());
  }
}
