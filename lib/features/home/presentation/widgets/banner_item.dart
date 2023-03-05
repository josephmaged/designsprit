import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  BannerItem({required this.name, super.key, required image});

  String? image;
  String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              height: 200,
              child: Image.network(
                image ??
                    "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png",
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
                    style: Styles.textStyle20.copyWith(
                      color: kPrimaryColor
                    ),
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
