import 'package:flutter/material.dart';

import '../CustomWidget/CustomText/custom_text.dart';

class MySelfLeaveStatus extends StatelessWidget {
   MySelfLeaveStatus({super.key,required this.text1,required this.text2,this.text3,required this.textColor});
  String text1;
  String text2;
  String ? text3;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${text1}", letterSpacing: 0.3,),
        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w300, text: "${text2}", letterSpacing: 0.3, textColor: textColor,),
      ],
    );
  }
}

class MySelfLeaveStatus2 extends StatelessWidget {
   MySelfLeaveStatus2({super.key,required this.text1,required this.text2 ,
     required this.textColor,
     required this.textColor2,
     required this.fontSize1,
     required this.fontSize2,
     this.fontWeight1,
     this.fontWeight2,
    required this.is_row,
    required this.width_height,
   });
  String text1;
  String text2;
  Color textColor;
  Color textColor2;
  double fontSize1;
  double fontSize2;
  double width_height;
   FontWeight? fontWeight1;
   FontWeight? fontWeight2;
   bool is_row;
  @override
  Widget build(BuildContext context) {
    return  is_row?  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorCustomText(fontSize: fontSize1, fontWeight: fontWeight1, text: "${text1}", letterSpacing: 0.3, textColor: textColor,),
        SizedBox(width: width_height,),
        ColorCustomText(fontSize: fontSize2, fontWeight: FontWeight.w300, text: "${text2}", letterSpacing: 0.3, textColor: textColor2,),
      ],
    ) :  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorCustomText(fontSize: fontSize1, fontWeight:fontWeight1, text: "${text1}", letterSpacing: 0.3, textColor: textColor,),
        SizedBox(height: width_height,),
        ColorCustomText(fontSize: fontSize2, fontWeight: fontWeight2, text: "${text2}", letterSpacing: 0.3, textColor: textColor2,),
      ],
    );
  }
}
