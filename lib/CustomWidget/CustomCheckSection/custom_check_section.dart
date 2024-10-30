import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomText/custom_text.dart';

class CustomSaveInfoSection extends StatefulWidget {
  CustomSaveInfoSection({super.key, required this.text});
  String text;
  @override
  State<CustomSaveInfoSection> createState() => _CustomSaveInfoSectionState();
}

class _CustomSaveInfoSectionState extends State<CustomSaveInfoSection> {
  bool is_check = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          is_check = !is_check;
        });
      },
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: CustomButtonColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Main_Theme_textColor),
              // image: DecorationImage(image: AssetImage(is_check?"Assets/Icons/check 1.png":""),fit: BoxFit.fill)
            ),
            child: Image.asset(
              "Assets/Icons/check 1.png",
              height: 20,
              width: 20,
              fit: BoxFit.fill,
              color: is_check ? Main_Theme_WhiteCollor : CustomButtonColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ColorCustomText(
            text: "${widget.text}",
            fontSize: fontSubTitle,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
            textColor: Main_Theme_textColor.withOpacity(0.5),
          ))
        ],
      ),
    );
  }
}
