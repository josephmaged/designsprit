import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

/*
Mobile: 01116177705
address:  فيلا 22  الشويفات
Mail: designspiritinfo2022@gmail.com
*/

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: 'About Us',
        listOfActions: [],
      ),
      body: Column(
        children: [
          Image.asset(AssetsData.aboutUs),
          Padding(
            padding: EdgeInsets.only(
              top: 80.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Mobile:'),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri(scheme: 'tel', path: '01116177705'));
                      },
                      child: const Text('01116177705'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Mail:'),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri(scheme: 'mailto', path: 'designspiritinfo2022@gmail.com'));
                      },
                      child: const Text('designspiritinfo2022@gmail.com'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text('address:  فيلا 22  الشويفات'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
