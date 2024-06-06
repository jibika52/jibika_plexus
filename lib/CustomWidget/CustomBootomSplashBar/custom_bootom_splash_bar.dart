import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomText/custom_text.dart';

class CustomBootomSplashBar extends StatelessWidget {
  const CustomBootomSplashBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: CustomButtomColor,
      padding: EdgeInsets.only(
          left: 20,right: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Help", letterSpacing: 0.2,textColor: Main_Theme_WhiteCollor),
          ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Our client", letterSpacing: 0.2,textColor: Main_Theme_WhiteCollor),
          ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Privacy", letterSpacing: 0.2,textColor: Main_Theme_WhiteCollor),
        ],
      ),
    );
  }
}
