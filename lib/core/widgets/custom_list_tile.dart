import 'package:designsprit/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
  });

  final String text;
  final Icon leadingIcon;
  final IconData trailingIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: leadingIcon,
      trailing: Icon(
        trailingIcon,
        size: 20.sp,
        color: kSecondaryColor,
      ),
      onTap: onTap,
    );
  }
}
