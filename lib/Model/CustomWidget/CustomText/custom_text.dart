import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibica_pleuxs/Utils/constants.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key,
    required this.fontSize,
    required this.fontWeight,
    required  this.text,
    required this.letterSpacing,
    this.textAlign
  });

  String? text;
  double? fontSize;
  double? letterSpacing;
  FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      "$text",
      style: GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Main_Theme_textColor,
      ),
    );
  }
}




