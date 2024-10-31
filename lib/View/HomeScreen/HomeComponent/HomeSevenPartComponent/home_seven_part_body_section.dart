import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';

class HomeSeventhPartBodySection extends StatelessWidget {
  HomeSeventhPartBodySection(
      {super.key,
      required this.image,
      required this.Head_text,
      required this.body_text,
      required this.footer_text,
      required this.color});
  String image;
  String Head_text;
  String body_text;
  String footer_text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: color,
        //   color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.8),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$image"), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 4,
          ),
          ColorCustomText(
            text: "$Head_text",
            fontSize: font13header,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 0.5,
          ),
          ColorCustomText(
            text: "$body_text",
            fontSize: font11,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 0.5,
          ),
          ColorCustomText(
            text: "$footer_text",
            fontSize: font11,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
