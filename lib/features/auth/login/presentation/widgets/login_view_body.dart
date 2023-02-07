import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/function/custom_snack_bar.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
        return ModalProgressHUD(
          dismissible: false,
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(elevation: 0,backgroundColor: Colors.white),
            body: LoginForm(emailController, passwordController),
            bottomNavigationBar: BottomAppBar(
              surfaceTintColor: kPrimaryColor,
              notchMargin: 8,
              color: kPrimaryColor,
              height: MediaQuery.of(context).size.height / 5,
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(
                              width: 1,
                            ),
                          ),
                          Text(
                            AppStrings.rememberMe,
                            style: Styles.textStyle14.copyWith(
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.registerText,
                          style: Styles.textStyle14.copyWith(
                              color: Colors.white
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                          child: Text(AppStrings.signUp,
                            style: Styles.textStyle16.copyWith(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                /*LoginCubit.get(context).login(
                    email: emailController.text,
                    password: passwordController.text);*/
              },
              child: const Icon(Icons.arrow_forward),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
          ),
        );
      },
    );
  }
}
