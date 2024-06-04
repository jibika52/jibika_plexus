import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import '../../Utils/constants.dart';

class CustomSlideTExt extends StatelessWidget {
  CustomSlideTExt({super.key,required this.text});
  String ? text;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(20)
        ),
        color: Color(0xffE6E6E6),
      ),
      height: 35,
      alignment: Alignment.center,
      width: double.infinity,
      //    padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Marquee(
                text: '$text',
                style: GoogleFonts.poppins(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,fontSize: 17,
                    color: Main_Theme_textColor
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 2),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                
              },
              child: CircleAvatar(radius: 18,backgroundColor: splash_button_color,backgroundImage: AssetImage("Assets/Icons/i_icon.png"),))
        ],
      ),
    );
  }
}
