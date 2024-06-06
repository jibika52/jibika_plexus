
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double button_text_fontSize,button_height;
  FontWeight ?fontWeight;
  double  borderRadius;
  final Color? custom_button_collor;
  final Color? button_text_color;
    CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.button_text_fontSize,
    required this.button_height,
    required this.custom_button_collor,
    required this.button_text_color,
    required this.borderRadius,
      this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: button_height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: custom_button_collor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Main_Theme_textColor
          )
        ),
        child: Center(
          child: Text(
            text,
            style:  GoogleFonts.roboto(
                color: button_text_color, fontWeight: fontWeight, fontSize: button_text_fontSize),
          ),
        ),
      ),
    );
  }
}