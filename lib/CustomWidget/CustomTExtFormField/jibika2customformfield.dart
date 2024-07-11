import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';

class JibikaCustomTextFromField extends StatelessWidget {
   JibikaCustomTextFromField({super.key,
   required this.image,
   required this.controller,
   required this.hintText,
   required this.height,
   required this.width,
   });
  String hintText;
  String image;
  double height;
  double width;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Main_Theme_textColor
        // )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
              height: 35,
              alignment: Alignment.centerLeft,
              child: CustomImageSction2(height: height, width: width, radius: 1, image: "$image",img_color: Main_Theme_textColor,)),
          Container(
            height: 15,
            width: 1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Main_Theme_textColor.withOpacity(0.15)),
            margin: EdgeInsets.only(left: 0,right: 15),
          ),
          Expanded(child: TextFormField(
            controller:controller ,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Main_Theme_textColor.withOpacity(0.2)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomButtonColor),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: Main_Theme_textColor.withOpacity(0.4)
                ),
            ),
          ))
        ],
      ),
    );
  }
}
