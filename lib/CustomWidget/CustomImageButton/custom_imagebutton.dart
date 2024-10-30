import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';
import '../CustomText/custom_text.dart';

class CustomImageButton extends StatelessWidget {
  CustomImageButton({
    super.key,
    required this.height,
    required this.img,
    required this.text,
    required this.textColor,
    required this.b_color,
  });
  double height;
  String img;
  String text;
  Color textColor;
  Color b_color;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomButtonColor, width: 0.8),
          color: Color(0xffE3F0ED),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageSction(
                height: 17.5, width: 17.5, radius: 0, image: "$img"),
            SizedBox(
              width: 8,
            ),
            ColorCustomText(
                fontSize: fontTitle,
                fontWeight: FontWeight.w400,
                text: "$text",
                letterSpacing: 0.2,
                textColor: CustomButtonColor)
          ],
        ));
  }
}
