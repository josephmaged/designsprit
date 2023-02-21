import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/function/custom_snack_bar.dart';
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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        /* if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          CacheHelper.saveData(key: Constants.uuid, value: state.user?.uid);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          customSnackBar(context, state.error);
        }*/
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
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
                            state.requestState == RequestState.loading
                                ? const CircularProgressIndicator()
                                : CustomPrimaryButton(
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
            bottomNavigationBar: BottomAppBar(
              color: kPrimaryColor,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        LoginCubit.get(context).changeCheckState();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: LoginCubit.get(context).checked,
                            onChanged: (value) {
                              LoginCubit.get(context).changeCheckState();
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(
                              width: 1,
                            ),
                          ),
                          Text(
                            AppStrings.rememberMe,
                            style: Styles.textStyle14.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.registerText,
                          style: Styles.textStyle14.copyWith(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                          child: Text(
                            AppStrings.signUp,
                            style:
                                Styles.textStyle16.copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
