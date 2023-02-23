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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
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
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
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
                          SizedBox(
                            height: 12.h,
                          ),
                          /*CustomTextFormField(
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
                          ),*/
                          SizedBox(
                            height: 12.h,
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
                          SizedBox(height: 25.h),
                          state.requestState == RequestState.loading
                              ? const CircularProgressIndicator()
                              : FlutterSocialButton(
                                  onTap: () {
                                    GoRouter.of(context).push(AppRouter.kMainScreenView);
                                    /*if (_formKey.currentState!.validate()) {
                            cubit.register();
                          }*/
                                  },
                                  title: AppStrings.register,
                                ),
                          SizedBox(height: 10.h),
                          Row(
                            children: <Widget>[
                              const Expanded(
                                child: Divider(
                                  color: kLightGrey,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              const Text("OR"),
                              SizedBox(width: 5.w),
                              const Expanded(
                                child: Divider(
                                  color: kLightGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterSocialButton(
                                mini: true,
                                onTap: () {
                                  cubit.registerWithGoogle();
                                },
                                buttonType: ButtonType.google,
                              ),
                              SizedBox(width: 10.w),
                              FlutterSocialButton(
                                mini: true,
                                onTap: () {
                                  //cubit.registerWithFacebook();
                                },
                                buttonType: ButtonType.facebook,
                              ),
                              SizedBox(width: 10.w),
                              FlutterSocialButton(
                                mini: true,
                                onTap: () {
                                  //cubit.registerWithApple();
                                },
                                buttonType: ButtonType.apple,
                              ),
                            ],
                          ),
                        ],
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
              height: 70.h,
              child: Padding(
                padding: EdgeInsets.all(10.h),
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
                style: TextStyle(
                  fontSize: 14.sp,
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
