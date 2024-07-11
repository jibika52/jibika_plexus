import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomText/custom_text.dart';

class CustomCircleDay extends StatelessWidget {
  CustomCircleDay({super.key,
  required this.day,
  required this.onTap,
  required this.backgroundColor,
  required this.textColor,
  });
  String day;
  VoidCallback onTap;
  Color backgroundColor;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      autofocus: false,
      highlightColor:Main_Theme_WhiteCollor,
      focusColor:Main_Theme_WhiteCollor,
      splashColor: Main_Theme_WhiteCollor,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          right: 10
        ),
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:backgroundColor
        ),
        child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "$day", letterSpacing: 0.1,textColor: textColor,),
      ),
    );
  }
}
