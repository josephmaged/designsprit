import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(tittle: '', listOfActions: const []),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                      'https://media.licdn.com/dms/image/C4D03AQG-oGUJCV5Enw/profile-displayphoto-shrink_800_800/0/1578167754622?e=1677110400&v=beta&t=0fDtdbVqUCpnUIre_Lf2Kvh72_2F4J8RPPzjFR84Kms')),
              SingleChildScrollView(
                child: Form(
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
                          errorMessage: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Email',
                          prefixWidget: const Icon(Icons.email),
                          controller: controller,
                          errorMessage: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'phone number',
                          prefixWidget: const Icon(Icons.phone),
                          controller: controller,
                          errorMessage: 'Phone',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Mobile',
                          prefixWidget: const Icon(Icons.phone),
                          controller: controller,
                          errorMessage: 'Mobile',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Source',
                          prefixWidget: const Icon(Icons.source),
                          controller: controller,
                          errorMessage: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          label: 'Company name',
                          prefixWidget: const Icon(Icons.backpack),
                          controller: controller,
                          errorMessage: 'Email',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: () {},
                    child: const Text('Update')),
              ),
              TextButton(onPressed: () {}, child: const Text('Change Password'))
            ],
          ),
        ),
      ),
    );
  }
}
