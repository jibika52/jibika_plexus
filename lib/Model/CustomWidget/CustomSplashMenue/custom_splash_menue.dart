import 'package:flutter/material.dart';

import '../CustomImage/custom_image.dart';
import '../CustomText/custom_text.dart';

class CustomSplashMenue extends StatelessWidget {
 CustomSplashMenue({super.key,
 required this.image1,
   required this.text1,
  required this.image2,
  required this.text2
 });
  String image1;
  String image2;
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              CustomImageSction(height: 14, width: 14, radius: 1, image: "$image1"),
              SizedBox(width: 5,),
              CustomText(fontSize: 11, fontWeight: FontWeight.w300,textAlign: TextAlign.center, text: "$text1", letterSpacing: 0.1),
            ],
          ),
        ),

        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageSction(height: 14, width: 14, radius: 1, image: "$image2"),
              SizedBox(width: 5,),
              CustomText(fontSize: 13, fontWeight: FontWeight.w300,textAlign: TextAlign.center, text: "$text2", letterSpacing: 0.1),
              "$text1"=="Allowance & Deduction"?  SizedBox(width: 20,):Container(),
              "$text1"=="Allowance & Deduction"?  CustomImageSction(height: 8, width: 8, radius: 1, image: "Assets/Frame 34613 (8).png"):Container(),
              "$text1"=="Allowance & Deduction"?  SizedBox(width: 5,):Container(),
              "$text1"=="Allowance & Deduction"?  CustomImageSction(height: 8, width: 8, radius: 1, image: "Assets/Frame 34613 (8).png"):Container(),
              "$text1"=="Allowance & Deduction"?  SizedBox(width: 5,):Container(),
              "$text1"=="Allowance & Deduction"?  CustomImageSction(height: 8, width: 8, radius: 1, image: "Assets/Frame 34613 (8).png"):Container(),
            ],
          ),
        ),
      ],
    );
  }
}
