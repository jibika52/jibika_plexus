import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../Utils/constants.dart';

class JibikaCustomTextFromField extends StatelessWidget {
 JibikaCustomTextFromField({super.key,
 required this.controller,required this.height,required this.img,required this.hinttext, required this.keyboardType , required this.obscureText
 });
  String img;
  String hinttext;
  TextInputType? keyboardType;
  double height;
  TextEditingController controller;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18,right: 10.0),
            child: Container(
              height: 60,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset("$img",height: 22,width: 19,fit: BoxFit.fill,),


                ],
              ),
            ),
          ),
       //   Assets/Icons/lock.png
          Expanded(
            child: TextFormField(
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: GoogleFonts.poppins(
                  color: Main_Theme_textColor,
                  fontSize: 15,fontWeight: FontWeight.w500
                  ,letterSpacing: 0.2

              ),
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter  numbers only";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
              //  label:CustomText(fontSize: 10, fontWeight: FontWeight.w500, text: '$hinttext', letterSpacing: 0.2),
                labelStyle: GoogleFonts.poppins(
                    color: Main_Theme_textColor.withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2
                ),
                errorStyle: TextStyle(
                  fontSize: 0.1,
                ),
               labelText: '$hinttext',
                contentPadding: EdgeInsets.only(
                    bottom: 10, top: 5,left: 10),
                /// prefix icon ///
              ),
            ),
          ),
        ],
      ),
    );
  }
}
