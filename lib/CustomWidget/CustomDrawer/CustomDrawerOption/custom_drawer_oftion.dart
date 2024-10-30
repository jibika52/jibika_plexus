import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../CustomText/custom_text.dart';

class DrawerOption extends StatelessWidget {
  String Text;
  final IconData? icon;
  DrawerOption({
    super.key,
    required this.Text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 200,
      padding: EdgeInsets.only(left: 15),
      child: Row(children: [
        Icon(icon, size: 22, color: Main_Theme_WhiteCollor),
        SizedBox(
          width: 12,
        ),
        ColorCustomText(
          text: "$Text",
          fontSize: fontTitle,
          fontWeight: FontWeight.w600,
          textColor: Main_Theme_textColor,
          letterSpacing: 0.25,
        ),
      ]),
    );
  }
}
