import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  final passwordController = TextEditingController();

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(state.copyWith(isPassword: isPassword));
  }

  Future<void> changePassword() async{
    final user = await FirebaseAuth.instance.currentUser!;

    user.updatePassword(passwordController.text).then((_){
      print("Successfully changed password");
    }).catchError((error){
      print("Password can't be changed$error");
     });
  }
}
