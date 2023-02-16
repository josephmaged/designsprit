import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/function/custom_snack_bar.dart';
import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/core/widgets/social_button.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        /* if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          CacheHelper.saveData(key: "uuid", value: state.user?.uid).then((value) {
            if (value!) {
              GoRouter.of(buildContext).pushReplacement(AppRouter.kHomeView);
            }
          });
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          customSnackBar(context, state.error);
        }*/
      },
      builder: (context, state) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  AppStrings.loginNow,
                  style: Styles.textStyle30,
                  textAlign: TextAlign.start,
                ),
                const Text(
                  AppStrings.welcome,
                  style: Styles.textStyle16,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: cubit.emailController,
                          validator: (value) => Validator.validateEmail(value),
                          label: AppStrings.emailHint,
                          errorMessage: "Please enter a valid email",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 12,
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

                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(50, 30), alignment: Alignment.centerLeft),
                            onPressed: () {},
                            child: const Text(
                              AppStrings.forgetPassword,
                              style: Styles.textStyle14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomPrimaryButton(
                          text: AppStrings.login,
                          press: () {
                            GoRouter.of(context).push(AppRouter.kMainScreenView);
                            /* if (_formKey.currentState!.validate()) {
                              cubit.login(uid: '');
                            }*/
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: kLightGrey,
                  )),
                  SizedBox(width: 5),
                  Text("OR"),
                  SizedBox(width: 5),
                  Expanded(
                      child: Divider(
                    color: kLightGrey,
                  )),
                ]),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SocialButton(MediaQuery.of(context).size, AssetsData.google, 'Google', () {
                      cubit.loginWithGoogle();
                    }),
                    const SizedBox(
                      width: 5,
                    ),
                    SocialButton(MediaQuery.of(context).size, AssetsData.facebook, 'Facebook', () {
                      // LoginCubit.get(context).loginWithFacebook();
                    }),
                    const SizedBox(
                      width: 5,
                    ),
                    SocialButton(MediaQuery.of(context).size, AssetsData.apple, 'Apple', () {
                      // LoginCubit.get(context).loginWithApple();
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
