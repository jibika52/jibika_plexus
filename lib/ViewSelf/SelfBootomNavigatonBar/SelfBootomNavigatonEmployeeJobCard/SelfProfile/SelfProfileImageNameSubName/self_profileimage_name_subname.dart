import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      margin: EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'Assets/Employee_Profile_Icon/profileinf.svg',
                height: 30.0,
                width: 30.0,
                color: Main_Theme_textColor,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$text1",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Main_Theme_textColor.withOpacity(0.9)
                    ),
                  ),
                  "$text1"==""?Container():  Text(
                    "$text2",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Main_Theme_textColor.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
