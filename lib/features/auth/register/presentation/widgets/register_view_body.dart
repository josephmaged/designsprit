import 'package:country_code_picker/country_code_picker.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/flutter_social_button/social_button.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:designsprit/features/auth/register/presentation/widgets/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        if (state.requestState == RequestState.loaded) {
          GoRouter.of(context).pushReplacement(AppRouter.kMainScreenView);
        } else if (state.requestState == RequestState.error) {
          SnackBar snackBar = SnackBar(
            content: Text("${state.responseMessage}"),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
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
                            controller: cubit.nameController,
                            validator: (value) => Validator.validateName(value),
                            label: AppStrings.name,
                            errorMessage: "Please enter a valid name",
                            textInputType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
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
                          CustomTextFormField(
                            validator: (value) => Validator.validateNumber(value),
                            prefixWidget: CountryCodePicker(
                              initialSelection: initialCountry,
                              favorite: const ['EG'],
                              showFlag: true,
                              showCountryOnly: false,
                              onChanged: (CountryCode? code) {
                                cubit.code = code;
                              },
                              onInit: (CountryCode? code) {
                                cubit.code = code;
                              },
                            ),
                            controller: cubit.phoneController,
                            errorMessage: "Enter your phone number",
                            label: "Phone Number",
                            textInputType: TextInputType.phone,
                          ),
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
                                    if (_formKey.currentState!.validate()) {
                                      cubit.registerWithEmail();
                                    }
                                  },
                                  title: AppStrings.register,
                                ),
                          SizedBox(height: 20.h),
                          Row(
                            children: <Widget>[
                              const Expanded(
                                child: Divider(
                                  color: kLightGrey,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              const Text("OR"),
                              SizedBox(width: 10.w),
                              const Expanded(
                                child: Divider(
                                  color: kLightGrey,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
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
                              /* SizedBox(width: 10.w),
                              FlutterSocialButton(
                                mini: true,
                                onTap: () {
                                  //cubit.registerWithFacebook();
                                },
                                buttonType: ButtonType.facebook,
                              ),
                              //if (Platform.isIOS)
                                const AppleButton(),*/
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
                            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
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
                child: const PrivacyPolicy(),
              ),
            ),
          ),
        );
      },
    );
  }
}
