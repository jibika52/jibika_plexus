import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';
import '../../CustomImage/custom_image.dart';
import '../../CustomText/custom_text.dart';

class CustomDrawerOption extends StatelessWidget {
  CustomDrawerOption({
    super.key,
    required this.image,
    required this.name,
    required this.size,
    required this.size2,
  });
  String name, image;
  double size, size2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 44,
      width: double.infinity,
      //   color: Colors.red,
      child: Row(
        children: [
          CustomImageSction(
              height: size, width: size2, radius: 0, image: "$image"),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.024,
          ),
          CustomText(
              fontSize: fontTitle,
              fontWeight: FontWeight.w400,
              text: "$name",
              letterSpacing: 0.3),
        ],
      ),
    );
  }
}
