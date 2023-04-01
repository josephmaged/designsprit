import 'package:designsprit/constants.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TimeSheetDropdown extends StatefulWidget {
  final IconData icon;
  final String text;
  final List<TimeSheet> items;
  TimeSheet? selectedModel;

  TimeSheetDropdown({
    Key? key,
    required this.icon,
    required this.text,
    required this.items,
    this.selectedModel,
  }) : super(key: key);

  @override
  State<TimeSheetDropdown> createState() => _TimeSheetDropdownState();
}

class _TimeSheetDropdownState extends State<TimeSheetDropdown> {
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
                (model) => DropdownMenuItem<TimeSheet>(
                  value: model,
                  child: Text(
                    "${model.date}  -  ${model.time}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: widget.selectedModel,
          onChanged: (value) {
            setState(() {
              widget.selectedModel = value!;
            });
          },
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
