import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/function/custom_snack_bar.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/widgets/social_button.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterForm extends StatelessWidget {
  TextEditingController nameController;

  TextEditingController emailController;

  TextEditingController passwordController;

  RegisterForm({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            // color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: AppStrings.emailHint,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        IntlPhoneField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: AppStrings.mobileNumber,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 2),
                            ),
                          ),
                          initialCountryCode: 'EG',
                          onChanged: (phone) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: RegisterCubit.get(context).isPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(RegisterCubit.get(context).suffix),
                              onPressed: () {
                                RegisterCubit.get(context).changePasswordVisibility();
                              },
                            ),
                          ),
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
                             // RegisterCubit.get(context).loginWithGoogle();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
