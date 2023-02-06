import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/function/custom_snack_bar.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  bool isLoading = false;

  TextEditingController emailController;

  TextEditingController passwordController;

  LoginForm(this.emailController, this.passwordController);

  @override
  Widget build(BuildContext buildContext) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
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
        }
      },
      builder: (context, state) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                      child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: AppStrings.emailHint,
                          hintText: 'Enter your Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: AuthCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              )),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            icon: Icon(AuthCubit.get(context).suffix),
                            onPressed: () {
                              AuthCubit.get(context).changePasswordVisibility();
                            },
                          ),
                        ),
                      )
                    ],
                  )),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      style: TextButton.styleFrom(minimumSize: const Size(50, 30), alignment: Alignment.centerLeft),
                      onPressed: () {},
                      child: const Text(
                        AppStrings.forgetPassword,
                        style: Styles.textStyle14,
                      )),
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
                      AuthCubit.get(context).loginWithGoogle();
                    }),
                    const SizedBox(
                      width: 5,
                    ),
                    SocialButton(MediaQuery.of(context).size, AssetsData.facebook, 'Facebook', () {
                      AuthCubit.get(context).loginWithFacebook();
                    }),
                    const SizedBox(
                      width: 5,
                    ),
                    SocialButton(MediaQuery.of(context).size, AssetsData.apple, 'Apple', () {
                      AuthCubit.get(context).loginWithApple();
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
