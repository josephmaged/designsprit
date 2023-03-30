import 'package:country_code_picker/country_code_picker.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_API.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_email.dart';
import 'package:designsprit/features/auth/register/domain/use_cases/register_with_google.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterApiUsecase registerApi;
  final RegisterWithGoogleUsecase registerWithGoogleUsecase;
  final RegisterWithEmailUsecase registerWithEmailUsecase;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  RegisterCubit(
    this.registerApi,
    this.registerWithGoogleUsecase,
    this.registerWithEmailUsecase,
  ) : super(const RegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  CountryCode? code;

  Future<void> register() async {
    final result = await registerApi(RegisterApiParameters(
      fuid: state.userCredential!.user!.uid,
      name: nameController.text,
      email: state.userCredential?.user?.email,
      phone: phoneController.text == "" ? '' : "$code${phoneController.text.substring(1)}",
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));

      CacheHelper.removeData(key: Constants.fID);
      CacheHelper.removeData(key: Constants.userID);
      CacheHelper.removeData(key: Constants.userData);
      FirebaseAuth.instance.signOut();
    }, (r) {
      emit(state.copyWith(
        registerResponse: r,
        requestState: RequestState.loaded,
      ));

      CacheHelper.saveData(key: Constants.fID, value: r[0].fuid);
      CacheHelper.saveData(key: Constants.userID, value: r[0].id);
      CacheHelper.saveData(key: Constants.userData, value: r[0]);
    });
  }

  Future<void> registerWithEmail() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await registerWithEmailUsecase(
      RegisterEmailParameters(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        userCredential: r,
      ));
      register();
    });
  }

  Future<void> registerWithGoogle() async {
    final result = await registerWithGoogleUsecase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        userCredential: r,
      ));
      register();
    });
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
