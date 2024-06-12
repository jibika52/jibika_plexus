import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';

class HomeSeventhPartBodySection extends StatelessWidget {
  HomeSeventhPartBodySection({super.key,required this.image,required this.Head_text,required this.body_text,required this.footer_text});
  String image;
  String Head_text;
  String body_text;
  String footer_text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        //  color: Colors.red,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill)
            ),
          ),
          SizedBox(height: 5,),
          ColorCustomText(text: "$Head_text", fontSize: font12header, fontWeight: FontWeight.w600,letterSpacing: 0.2,textColor: Colors.white,  ),
          SizedBox(height:1,),
          ColorCustomText(text: "$body_text", fontSize: font10, fontWeight: FontWeight.w400,letterSpacing: 0.2,textColor: Colors.white,)
          ,SizedBox(height: 1,),
          ColorCustomText(text: "$footer_text", fontSize: font10, fontWeight: FontWeight.w400,letterSpacing: 0.2,textColor: Colors.white,)
        ],
      ),
    );
  }
}
