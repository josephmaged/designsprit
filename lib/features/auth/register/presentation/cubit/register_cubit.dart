import 'package:bloc/bloc.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_google.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterApiUsecase registerApi;
  final RegisterWithGoogleUsecase registerWithGoogleUsecase;


  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  RegisterCubit(this.registerApi, this.registerWithGoogleUsecase) : super(const RegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register() async {
    final result = await registerApi(RegisterApiParameters(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
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

  Future<void> registerWithGoogle() async {
    final result = await registerWithGoogleUsecase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        registerMessage: l.errMessage
      ));
    }, (r) {
      emit(state.copyWith(
        userCredential: r,
        requestState: RequestState.loaded
      ));
    });
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(state.copyWith(
        isPassword : isPassword
    ));
  }

  bool checked = false;

  void changeCheckState() {
    checked = !checked;
    emit(
      state.copyWith(
        checkState: checked
      )
    );
  }
}
