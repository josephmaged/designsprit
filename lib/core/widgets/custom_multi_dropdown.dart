import 'package:designsprit/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown2 extends StatefulWidget {
  final IconData icon;
  final String text;
  final List<dynamic> items;
  List<dynamic>? selectedItems=[];

  CustomDropdown2({
    Key? key,
    required this.icon,
    required this.text,
    required this.items,
    this.selectedItems,
  }) : super(key: key);

  @override
  State<CustomDropdown2> createState() => _CustomDropdown2State();
}

class _CustomDropdown2State extends State<CustomDropdown2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 12.w),
          ),
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
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = widget.selectedItems!.contains(item);
                      return InkWell(
                        onTap: () {
                          isSelected ? widget.selectedItems!.remove(item) : widget.selectedItems!.add(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              isSelected
                                  ? const Icon(Icons.check_box_outlined)
                                  : const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 16),
                              Text(
                                item,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
          value: widget.selectedItems!.isEmpty ? null : widget.selectedItems!.last,
          selectedItemBuilder: (context) {
            return widget.items.map(
                  (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.selectedItems!.join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                );
              },
            ).toList();
          },
          onChanged: (value) {
            setState(() {
              widget.selectedItems!= value!;
            });
          },
        ),
      ),
    );
  }
}
