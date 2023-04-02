import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var cubit = ProfileCubit.get(context);

    return Scaffold(
      appBar: CustomAppBar(
        titleName: AppStrings.myProfile,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(8.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      cubit.pickImage();
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 120.w,
                          height: 120.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60.r),
                            ),
                          ),
                          child: cubit.imageFile == null
                              ? CachedNetworkImage(
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  imageUrl: ApiConst.getImages(state.image!),
                                )
                              : Image.file(cubit.imageUi!),
                        ),
                        Positioned(
                          bottom: 5.h,
                          right: 5.w,
                          child: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            validator: (value) => null,
                            label: 'Name',
                            prefixWidget: const Icon(
                              Icons.drive_file_rename_outline,
                            ),
                            controller: cubit.usernameController,
                            errorMessage: 'Please enter a valid Name',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            validator: (value) {},
                            label: 'Email',
                            prefixWidget: const Icon(Icons.email),
                            controller: cubit.emailController,
                            errorMessage: 'Please enter a valid email',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            validator: (value) {},
                            label: 'phone number',
                            prefixWidget: const Icon(Icons.phone),
                            controller: cubit.phoneController,
                            errorMessage: 'Please enter a valid Phone Number',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            validator: (value) {},
                            label: 'Mobile',
                            prefixWidget: const Icon(Icons.phone_android),
                            controller: cubit.mobileController,
                            errorMessage: 'Please enter a valid Mobile',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            validator: (value) {},
                            label: 'Source',
                            prefixWidget: const Icon(Icons.source),
                            controller: cubit.sourceController,
                            errorMessage: 'Please enter how you know us',
                          ),
                          SizedBox(height: 20.h),
                           CustomPrimaryButton(
                            text: AppStrings.updateProfile,
                            press: () {
                              cubit.updateProfile();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  user.providerData.first.providerId == "google.com"
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kChangePasswordView);
                          },
                          child: const Text('Change Password'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
