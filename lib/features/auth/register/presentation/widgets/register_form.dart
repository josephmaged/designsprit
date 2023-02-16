import 'package:country_code_picker/country_code_picker.dart';
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
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'EG';

  RegisterForm({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        /*  if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          CacheHelper.saveData(key: "uuid", value: state.user?.data?.id);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        } else if (state is RegisterFailure) {
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
                        CustomPrimaryButton(
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
      ),
    );
  }
}
