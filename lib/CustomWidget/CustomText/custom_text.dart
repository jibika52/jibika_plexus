
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key,
    required this.fontSize,
    required this.fontWeight,
    required  this.text,
    required this.letterSpacing,
    this.textAlign,
    this.fontStyle,
    this.overflow,
    this.maxLines,
  });

  String? text;
  double? fontSize;
  double? letterSpacing;
  FontWeight? fontWeight;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      textAlign: textAlign,
      maxLines:maxLines ,
      "$text",
      style: GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Main_Theme_textColor,
        fontStyle: fontStyle,
      ),
    );
  }
}

class ColorCustomText extends StatelessWidget {
  ColorCustomText({super.key,
    required this.fontSize,
    required this.fontWeight,
    required  this.text,
    required this.letterSpacing,
    this.overflow,
    this.textAlign,
    this.maxLines,
   required this.textColor
  });

  String? text;
  double? fontSize;
  double? letterSpacing;
  FontWeight? fontWeight;
  final TextAlign? textAlign;
  Color textColor;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      "$text",
      style: GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}




