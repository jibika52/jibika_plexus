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
