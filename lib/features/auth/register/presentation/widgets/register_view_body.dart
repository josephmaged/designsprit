import 'package:country_code_picker/country_code_picker.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/function/launch_url.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/core/widgets/social_button.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/strings.dart';

class RegisterViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'EG';

  RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        /* if (state is RegisterLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }*/
        if (state.requestState == RequestState.loading) {}
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.register,
                      style: Styles.textStyle30,
                    ),
                    const Text(
                      AppStrings.welcome,
                      style: Styles.textStyle16,
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
                              validator: (value) => Validator.validateNumber(value),
                              prefixWidget: CountryCodePicker(
                                initialSelection: initialCountry,
                                favorite: const ['EG'],
                                showFlag: true,
                                showCountryOnly: false,
                                onChanged: (CountryCode? code) {
                                  code = code;
                                },
                              ),
                              controller: cubit.phoneController,
                              errorMessage: "Enter your phone number",
                              label: "Phone Number",
                              textInputType: TextInputType.phone,
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
                                icon: RegisterCubit.get(context).isPassword == true
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                            state.requestState == RequestState.loading
                                ? const CircularProgressIndicator()
                                : CustomPrimaryButton(
                                    text: AppStrings.register,
                                    press: () {
                                      GoRouter.of(context).push(AppRouter.kMainScreenView);
                                      /*if (_formKey.currentState!.validate()) {
                              cubit.register();
                            }*/
                                    },
                                  ),
                            const SizedBox(height: 10),
                            Row(children: const <Widget>[
                              Expanded(child: Divider()),
                              SizedBox(width: 5),
                              Text("OR"),
                              SizedBox(width: 5),
                              Expanded(child: Divider()),
                            ]),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SocialButton(MediaQuery.of(context).size, AssetsData.google, 'Google', () {
                                  cubit.registerWithGoogle();
                                }),
                                const SizedBox(
                                  width: 5,
                                ),
                                SocialButton(MediaQuery.of(context).size, AssetsData.facebook, 'Facebook', () {
                                  // RegisterCubit.get(context).loginWithFacebook();
                                }),
                                const SizedBox(
                                  width: 5,
                                ),
                                SocialButton(MediaQuery.of(context).size, AssetsData.apple, 'Apple', () {
                                  // RegisterCubit.get(context).loginWithApple();
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppStrings.haveAccount,
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kLoginView);
                          },
                          child: const Text(AppStrings.login),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: kPrimaryColor,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: privacyPolicyLinkAndTermsOfService(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget privacyPolicyLinkAndTermsOfService(context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text.rich(
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By continuing, you agree to our ',
            children: <TextSpan>[
              TextSpan(
                text: 'Terms of Service \n',
                style: const TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch terms of service link here
                  },
              ),
              TextSpan(
                text: 'and ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchCustomUr(context, 'https://policies.google.com/terms?hl=en-EG&fg=1');
                      },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
