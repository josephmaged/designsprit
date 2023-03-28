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
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: ApiConst.getImages(image!),
              width: 85.w,
              height: 85.h,
            ),
            Container(
              color: Colors.black.withOpacity(
                .8,
              ),
              width: 100.h,
              child: Text(
                text!,
                style: Styles.textStyle18.copyWith(
                    color: Colors.white
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
