import 'package:designsprit/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<DropdownMenuItem> items;
  Object? selectedValue;
  ValueChanged<dynamic>? onChanged;

  CustomDropdown({
    Key? key,
    required this.icon,
    required this.text,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(10),
          isExpanded: true,
          hint: Row(
            children: [
              Icon(
                icon,
                size: 20.w,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4.h,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items,
          value: selectedValue,
          onChanged: onChanged,
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ),
          iconSize: 14.w,
        ),
      ),
    );
  }
}
