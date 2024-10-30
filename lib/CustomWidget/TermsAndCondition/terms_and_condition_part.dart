import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomText/custom_text.dart';

class CustomTermsAndConditionPart extends StatelessWidget {
  const CustomTermsAndConditionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: CustomText(
              fontSize: font13header,
              fontWeight: FontWeight.w400,
              text: "By proceeding further you are agreeing with",
              letterSpacing: 0.2),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorCustomText(
              fontSize: fontSubTitle,
              fontWeight: FontWeight.w400,
              text: "Terms & Conditions",
              letterSpacing: 0.2,
              textColor: Main_Theme_textColor_tir_Condition,
            ),
            CustomText(
              fontSize: fontSubTitle,
              fontWeight: FontWeight.w400,
              text: " and ",
              letterSpacing: 0.2,
            ),
            ColorCustomText(
              fontSize: fontSubTitle,
              fontWeight: FontWeight.w400,
              text: "Privacy Policy",
              letterSpacing: 0.2,
              textColor: Main_Theme_textColor_tir_Condition,
            ),
          ],
        ),
      ],
    );
  }
}
