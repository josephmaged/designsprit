import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  SocialButton(this.size, this.image, this.name, this.function);

  late Size size;
  late String image;
  late String name;
  late Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width / 3.5,
        height: size.height / 13,
        decoration: BoxDecoration(
          color: Colors.white24,
          border: Border.all(
              color: kLightGrey, // Set border color
              width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                image,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              name,
              style: Styles.textStyle14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
