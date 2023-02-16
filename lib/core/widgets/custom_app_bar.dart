import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String tittle;
  final VoidCallback? notificationIconClickedCallBack;
  final List<Widget>? listOfActions;
  Color? color = kPrimaryColor;

  CustomAppBar(
      {required this.tittle,
      this.listOfActions,
      this.notificationIconClickedCallBack,
      this.color,
      super.key});

  @override
  Widget? get title => Text(
        tittle,
        style: Styles.textStyle16.copyWith(color: Colors.white),
      );

  @override
  Color? get backgroundColor => color;

  @override
  List<Widget>? get actions =>
      listOfActions ??
      [
        IconButton(
          splashColor: Colors.white,
          disabledColor: Colors.white,
          icon: const Icon(Icons.notifications),
          onPressed: notificationIconClickedCallBack,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
      ];

  @override
  ShapeBorder? get shape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      );
}
