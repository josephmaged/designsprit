import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          titleName: AppStrings.myProfile,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        60.r
                      ),
                    ),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageUrl:
                      "https://lh3.googleusercontent.com/a/AGNmyxav7RcuwpdMP7pW5D_FRscwntHNmrL-FClRKgg8hw=s288"
                          ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) => null,
                          label: 'Name',
                          prefixWidget: const Icon(
                            Icons.drive_file_rename_outline,
                          ),
                          controller: controller,
                          errorMessage: 'Please enter a valid Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Email',
                          prefixWidget: const Icon(Icons.email),
                          controller: controller,
                          errorMessage: 'Please enter a valid email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'phone number',
                          prefixWidget: const Icon(Icons.phone),
                          controller: controller,
                          errorMessage: 'Please enter a valid Phone Number',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Mobile',
                          prefixWidget: const Icon(Icons.phone_android),
                          controller: controller,
                          errorMessage: 'Please enter a valid Mobile',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Source',
                          prefixWidget: const Icon(Icons.source),
                          controller: controller,
                          errorMessage: 'Please enter how you know us',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'User Name',
                          prefixWidget: const Icon(Icons.person),
                          controller: controller,
                          errorMessage: 'Please enter a valid User Name',
                        ),
                        const SizedBox(height: 20),
                        CustomPrimaryButton(
                          text: AppStrings.updateProfile,
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Change Password'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
