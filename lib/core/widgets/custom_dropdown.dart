import 'package:designsprit/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final IconData icon;
  final String text;
  final List items;
  Object? selectedValue;

  CustomDropdown({
    Key? key,
    required this.icon,
    required this.text,
    required this.items,
    this.selectedValue,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            hint: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 20.w,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 4.h,
                ),
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: widget.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value!;
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14.w,
          ),
        ),
      ),
    );
  }
}
