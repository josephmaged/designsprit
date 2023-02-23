import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/core/utils/validator.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/core/widgets/social_button.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:go_router/go_router.dart';

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
                                    GoRouter.of(context).push(AppRouter.kMainScreenView);
                                    /*if (_formKey.currentState!.validate()) {
                            cubit.login(uid: '');
                          }*/
                                  },
                                  title: AppStrings.login,
                                ),
                        ],
                      ),
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
                            cubit.loginWithGoogle();
                          },
                          buttonType: ButtonType.google,
                        ),
                        SizedBox(width: 10.w),
                        FlutterSocialButton(
                          mini: true,
                          onTap: () {
                            //cubit.loginWithFacebook();
                          },
                          buttonType: ButtonType.facebook,
                        ),
                        SizedBox(width: 10.w),
                        FlutterSocialButton(
                          mini: true,
                          onTap: () {
                            //cubit.loginWithApple();
                          },
                          buttonType: ButtonType.apple,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: kPrimaryColor,
              height: 120.h,
              child: Padding(
                padding: EdgeInsets.all(10.h),
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            side: BorderSide(
                              width: 1.w,
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
