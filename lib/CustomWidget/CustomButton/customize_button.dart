import 'package:flutter/material.dart';

import '../CustomText/custom_text.dart';

class CustomizeButton extends StatelessWidget {
   CustomizeButton({super.key,required this.onTap,required this.text,required this.textColor,required this.presentsent_color,required this.fontSize,this.is_clicked});
  Color  presentsent_color;
  Color  textColor;
  String text;
  double fontSize;
  VoidCallback onTap;
  bool ? is_clicked ;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      splashColor: Colors.red,
     onTap:onTap,
      child: Container(
        height: 30,
        width: 82,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: is_clicked==true?presentsent_color:Colors.white,
            border: Border.all(
                color: presentsent_color,
                width: 1
            )
        ),
        alignment: Alignment.center,
        child: ColorCustomText(fontSize: fontSize, fontWeight: FontWeight.w600, text: "$text", letterSpacing: 0.4, textColor: textColor ,),
      ),
    ) ;
  }
}
