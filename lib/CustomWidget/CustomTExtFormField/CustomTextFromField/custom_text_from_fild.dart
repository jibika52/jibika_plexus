import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTExtFromField extends StatelessWidget {
  CustomTExtFromField({Key? key,
    required this.controller,
    required this.hintText,
    required this.fontSize,
    required this.fontWeight,
    required this.text_color,
      this.suffixIcon,
      this.keyboardType,
    required this.obscureText,
  }) : super(key: key);
   TextEditingController controller;
   String hintText;
  double fontSize;
  final FontWeight fontWeight;
  final Color?  text_color;
  final Widget?  suffixIcon;
  bool obscureText;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText ,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: "$hintText",
          hintStyle: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight:fontWeight,
        color: text_color,
        letterSpacing: 0.3,
          ),
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(15.0),
          borderSide: new BorderSide(),
        ),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.only(left: 15),
      ),
    );
  }
}
