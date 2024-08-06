import 'package:flutter/material.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class SelfProfileImageNameSubName extends StatelessWidget {
  SelfProfileImageNameSubName({super.key,required this.image,required this.text1,required this.text2});
  String ? image;
  String ? text1;
  String ? text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5,left: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Main_Theme_WhiteCollor,
        border: Border(
            bottom: BorderSide(color: Main_Theme_textColor.withOpacity(0.1),)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageSction2(height: 24, width: 24, radius: 5, image: "$image", img_color: Main_Theme_textColor),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4,),
              ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "$text1", letterSpacing: 0.3, textColor: Main_Theme_textColor,),
              ColorCustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "$text2", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
            ],
          ),
        ],
      ),
    );
  }
}
