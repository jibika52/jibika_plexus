import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomText/custom_text.dart';

class CustomSaveInfoSection extends StatefulWidget {
  const CustomSaveInfoSection({super.key});

  @override
  State<CustomSaveInfoSection> createState() => _CustomSaveInfoSectionState();
}

class _CustomSaveInfoSectionState extends State<CustomSaveInfoSection> {
  bool is_check=true;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        setState(() {
          is_check=!is_check;
        });
      },
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Main_Theme_WhiteCollor,
                border: Border.all(
                    color: Main_Theme_textColor
                ),
               // image: DecorationImage(image: AssetImage(is_check?"Assets/Icons/check 1.png":""),fit: BoxFit.fill)
            ),
            child: Image.asset(is_check?"Assets/Icons/check 1.png":"",height: 20,width: 20,fit: BoxFit.fill,),
          ),
          const  SizedBox(width: 10,),
          Expanded(child: ColorCustomText(text: "Remember Me,",fontSize:16 ,fontWeight: FontWeight.w400,letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.5),))
        ],
      ),
    );
  }
}
