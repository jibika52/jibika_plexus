import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../Utils/constants.dart';

class JibikaCustomTextFromField extends StatelessWidget {
 JibikaCustomTextFromField({super.key,
 required this.controller,required this.height,required this.img,required this.hinttext, required this.keyboardType , required this.obscureText,this.suffixIcon
 });
  String img;
  String hinttext;
  TextInputType? keyboardType;
  double height;
  TextEditingController controller;
  bool obscureText;
 final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16,right: 5.0),
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
                  Image.asset("$img",height: 25,width: 25,fit: BoxFit.fill,color: Main_Theme_textColor.withOpacity(0.7),),


                ],
              ),
            ),
          ),
       //   Assets/Icons/lock.png
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Main_Theme_textColor.withOpacity(0.3),
                    width: 1
                  )
                )
              ),
              padding: EdgeInsets.only(top: 10),
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
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
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
                      bottom: 10, top: 0,left: 10),
                  /// prefix icon ///
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class JibikaCustomTextFromField2 extends StatelessWidget {
  JibikaCustomTextFromField2({super.key,
    required this.controller,required this.height,required this.img,required this.hinttext, required this.keyboardType , required this.obscureText,this.suffixIcon
  });
  String img;
  String hinttext;
  TextInputType? keyboardType;
  double height;
  TextEditingController controller;
  bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23,right: 5.0),
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
                  Image.asset("$img",height: 17,width: 17,fit: BoxFit.fill,color: Main_Theme_textColor.withOpacity(0.7),),


                ],
              ),
            ),
          ),
          //   Assets/Icons/lock.png
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Main_Theme_textColor.withOpacity(0.3),
                          width: 1
                      )
                  )
              ),
              padding: EdgeInsets.only(top: 10),
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
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
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
                      bottom: 10, top: 0,left: 10),
                  /// prefix icon ///
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
