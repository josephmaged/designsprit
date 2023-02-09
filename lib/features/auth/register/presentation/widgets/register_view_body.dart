import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/function/launch_url.dart';
import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:designsprit/features/auth/register/presentation/widgets/register_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/strings.dart';

class RegisterViewBody extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        /* if (state is RegisterLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }*/
      },
      builder: (context, state) {
        return ModalProgressHUD(
          dismissible: false,
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
            body: RegisterForm(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController),
            bottomNavigationBar: BottomAppBar(
              surfaceTintColor: kPrimaryColor,
              notchMargin: 8,
              color: kPrimaryColor,
              height: 200,
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      privacyPolicyLinkAndTermsOfService(context),
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
              /*  RegisterCubit.get(context).register(
                    name: nameController.text, email: emailController.text, password: passwordController.text);*/
              },
              child: const Icon(Icons.arrow_forward),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By continuing, you agree to our ',
            children: <TextSpan>[
              TextSpan(
                text: 'Terms of Service \n',
                style: const TextStyle(
                  fontSize: 16,
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
