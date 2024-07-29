

import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';

class BarchatHeaderPart extends StatefulWidget {
  BarchatHeaderPart({Key? key,required this.name,required this.money,required this.parpose}) : super(key: key);
  String  name;
  String money;
  String  parpose;
  @override
  State<BarchatHeaderPart> createState() => _BarchatHeaderPartState();
}

class _BarchatHeaderPartState extends State<BarchatHeaderPart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(11),
            topLeft: Radius.circular(11)
        ),
        color: Main_Theme_WhiteCollor,
        border: Border(
          right: BorderSide(width: 2, color: Main_Theme_WhiteCollor,style: BorderStyle.solid),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorCustomText(text: "${widget.name}", fontSize:13, fontWeight: FontWeight.w500,letterSpacing: 0.3,textColor: Main_Theme_textColor.withOpacity(0.9)),
          ColorCustomText(text: "${widget.money}", fontSize: 14, fontWeight: FontWeight.w600,letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.6) ),
          ColorCustomText(text: "${widget.parpose}", fontSize: font11, fontWeight: FontWeight.w400,letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.6)),
        ],
      ),
    ));
  }
}