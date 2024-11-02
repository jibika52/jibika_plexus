import 'package:flutter/material.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Utils/constants.dart';

class SelfAttendanceSummarySecondPart extends StatelessWidget {
  SelfAttendanceSummarySecondPart({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.image_h,
    required this.image_w,
  });
  String image;
  String text1;
  String text2;
  double image_h;
  double image_w;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: CustomAppbarColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "$image",
            height: image_h,
            width: image_w,
            color: Main_Theme_textColor.withOpacity(0.5),
          ),
          SizedBox(
            height: 3,
          ),
          ColorCustomText(
            overflow: TextOverflow.ellipsis,
            fontSize: font10,
            fontWeight: FontWeight.w600,
            text: "$text1",
            letterSpacing: 0.3,
            textColor: Main_Theme_textColor.withOpacity(0.7),
          ),
          SizedBox(
            height: 3,
          ),
          ColorCustomText(
            fontSize: font10,
            fontWeight: FontWeight.w400,
            text: "$text2",
            letterSpacing: 0.3,
            textColor: Main_Theme_textColor.withOpacity(0.7),
          )
        ],
      ),
    );
  }
}
