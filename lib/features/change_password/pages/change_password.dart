import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/flutter_social_button/social_button.dart';
import 'package:designsprit/features/change_password/cubit/change_password_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ChangePasswordCubit.get(context);
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.changePassword,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
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
              /*state.requestState == RequestState.loading
                  ? const CircularProgressIndicator()
                  : */
              FlutterSocialButton(
                buttonType: ButtonType.customButton,
                onTap: () async {
                  /* if (_formKey.currentState!.validate()) {
                    cubit.changePassword().then((value) {
                      GoRouter.of(context).pushReplacement(AppRouter.kProfileView);
                    });
                  }*/
                },
                title: AppStrings.changePassword,
              ),
            ],
          ),
        ),
      );
    });
  }
}
