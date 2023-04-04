import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/flutter_social_button/social_button.dart';
import 'package:designsprit/features/change_password/cubit/change_password_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ChangePasswordCubit.get(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(listener: (context, state) {
      if (state.requestState == RequestState.loaded) {
        GoRouter.of(context).pushReplacement(AppRouter.kProfileView);
        Fluttertoast.showToast(
          msg: state.responseMessage!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 14.sp,
        );
      } else if (state.requestState == RequestState.error) {
        Fluttertoast.showToast(
          msg: state.responseMessage!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 14.sp,
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: CustomAppBar(
          titleName: AppStrings.changePassword,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: cubit.currentController,
                  validator: (value) => Validator.validatePassword(value),
                  secure: cubit.isCurrentPassword,
                  label: 'Current Password',
                  errorMessage: "Please enter your current password",
                  textInputType: TextInputType.visiblePassword,
                  suffixWidget: IconButton(
                    icon: cubit.isCurrentPassword == true
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      cubit.changeCurrentPasswordVisibility();
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  controller: cubit.passwordController,
                  validator: (value) => Validator.validatePassword(value),
                  secure: cubit.isPassword,
                  label: 'Password',
                  errorMessage: "Please enter your password",
                  textInputType: TextInputType.visiblePassword,
                  suffixWidget: IconButton(
                    icon: cubit.isPassword == true
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                state.requestState == RequestState.loading
                    ? const CircularProgressIndicator()
                    : FlutterSocialButton(
                        buttonType: ButtonType.customButton,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            cubit.changePassword();
                          }
                        },
                        title: AppStrings.changePassword,
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
