import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar {
  final String titleName;
  final VoidCallback? notificationIconClickedCallBack;
  final List<Widget>? listOfActions;
  Color? color = kPrimaryColor;
  int count;

  CustomAppBar(
      {required this.titleName,
      this.listOfActions,
      this.notificationIconClickedCallBack,
      this.color,
      required this.count,
      super.key});

  @override
  Widget? get title => Text(
        titleName,
        style: Styles.textStyle16.copyWith(color: Colors.white),
      );

  @override
  Color? get backgroundColor => color;

  @override
  List<Widget>? get actions =>
      listOfActions ??
      [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Badge.count(
            count: count,
            textStyle: TextStyle(
              fontSize: 15.sp,
            ),
            child: IconButton(
              splashColor: Colors.white,
              disabledColor: Colors.white,
              icon: const Icon(Icons.notifications),
              onPressed: notificationIconClickedCallBack,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20),
      ];

  @override
  ShapeBorder? get shape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      );
}
