import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: ApiConst.getImages(image!),
              width: 85.w,
              height: 85.h,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(
                .8,
              ),
              width: 100.h,
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
