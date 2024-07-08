import 'dart:ui';

import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';
import '../CustomText/custom_text.dart';

class CustomTrackNowButton extends StatelessWidget {
    CustomTrackNowButton({super.key,
      required this.b_text,
      required this.onTap,
    });
  String b_text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: onTap,
      //     () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeTrackinScreen(),));
      // },
      child: Container(
        height: 38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Main_Theme_textColor_tir_Condition.withOpacity(0.7),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "$b_text", letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
            SizedBox(width: 5,),
            Icon(Icons.arrow_forward_ios_rounded,size: 17,color: Main_Theme_WhiteCollor),
          ],
        ),
      ),
    );
  }
}
