import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/apple_button.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/flutter_social_button/social_button.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
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
                    SizedBox(height: 20.h),
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
                                  minimumSize: Size(50.sp, 30.sp), alignment: Alignment.centerLeft),
                              onPressed: () {},
                              child: const Text(
                                AppStrings.forgetPassword,
                                style: Styles.textStyle14,
                              ),
                            ),
                          ),
                          state.requestState == RequestState.loading
                              ? const CircularProgressIndicator()
                              : FlutterSocialButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.loginWithEmail();
                                    }
                                  },
                                  title: AppStrings.login,
                                ),
                        ],
                      ),
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
                            cubit.loginWithGoogle();
                          },
                          buttonType: ButtonType.google,
                        ),
                        /*  SizedBox(width: 10.w),
                        FlutterSocialButton(
                          mini: true,
                          onTap: () {
                            //cubit.loginWithFacebook();
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
            ),
            bottomNavigationBar: BottomAppBar(
              color: kPrimaryColor,
              height: 80.h,
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.registerText,
                      style: Styles.textStyle14.copyWith(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: Styles.textStyle16.copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                      ),
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
