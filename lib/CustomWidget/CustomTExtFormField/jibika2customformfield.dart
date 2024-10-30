import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';

class JibikaCustomTextFromField extends StatelessWidget {
  JibikaCustomTextFromField({
    super.key,
    this.is_need_widget,
    required this.getwidget,
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
  bool? is_need_widget;
  Widget getwidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          // border: Border.all(
          //   color: Main_Theme_textColor
          // )
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 14),
              width: 45,
              height: 30,
              alignment: Alignment.centerLeft,
              child: CustomImageSction2(
                height: height,
                width: width,
                radius: 1,
                image: "$image",
                img_color: Main_Theme_textColor,
              )),
          Container(
            height: 15,
            width: 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_textColor.withOpacity(0.15)),
            margin: EdgeInsets.only(top: 10, left: 0, right: 12),
          ),
          Expanded(
              child: is_need_widget == true
                  ? getwidget
                  : TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Main_Theme_textColor.withOpacity(0.2)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomButtonColor),
                        ),
                        hintText: hintText,
                        hintStyle: TextStyle(
                            fontSize: font13header,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            color: Main_Theme_textColor.withOpacity(0.4)),
                      ),
                    ))
        ],
      ),
    );
  }
}
