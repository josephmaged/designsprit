import 'package:bloc/bloc.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register(
      {required String name,
        required String email,
        required String password}) async {

    var user = await _authRepo.register(name, email, password);

    user.fold((l) => emit(RegisterFailure(l.toString())),
            (r) => emit(RegisterSuccess(user: r)));
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

  bool checked = false;

  void changeCheckState() {
    checked = !checked;
    emit(RegisterChangeRememberMeState());
  }
}
