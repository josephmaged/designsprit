import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:designsprit/features/auth/register/presentation/widgets/register_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: RegisterViewBody(),
    );
  }
}
