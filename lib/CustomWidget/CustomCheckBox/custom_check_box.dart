import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });
  String text;
  Color color;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 80,
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Main_Theme_WhiteCollor,
                border: Border.all(
                    color: Main_Theme_textColor.withOpacity(0.9), width: 1.5)),
            child: Container(
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          ColorCustomText(
            fontSize: font13header,
            fontWeight: FontWeight.w400,
            text: "$text",
            letterSpacing: 0.1,
            textColor: textColor,
          )
        ],
      ),
    );
  }
}
