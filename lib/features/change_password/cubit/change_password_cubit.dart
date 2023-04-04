import 'package:bloc/bloc.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isCurrentPassword = true;
  final currentController = TextEditingController();
  final passwordController = TextEditingController();

  void changeCurrentPasswordVisibility() {
    isCurrentPassword = !isCurrentPassword;
    emit(state.copyWith(isCurrentPassword: isCurrentPassword));
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(state.copyWith(isPassword: isPassword));
  }

  Future<void> changePassword() async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final user = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(email: user!.email!, password: currentController.text);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(
        passwordController.text,
      );
      emit(
        state.copyWith(responseMessage: 'Successfully changed password', requestState: RequestState.loaded),
      );
    } catch (error) {
      emit(
        state.copyWith(
          responseMessage: 'Password can\'t be changed$error',
          requestState: RequestState.loaded
        ),
      );
    }
  }
}
