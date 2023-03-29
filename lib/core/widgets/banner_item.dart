import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({required this.name, super.key, this.image});

  final List<String>? image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kItemDetailsView);
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              height: 200,
              child: CachedNetworkImage(
                imageUrl: ApiConst.getImages(image!.first),
                errorWidget: (context, url, error) => Image.asset(AssetsData.notFound),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    name,
                    style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
