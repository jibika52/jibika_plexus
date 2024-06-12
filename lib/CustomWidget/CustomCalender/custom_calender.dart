import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';

import '../../Utils/constants.dart';

class CustomCalender extends StatelessWidget {
   CustomCalender({super.key,required this.onTap});
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Main_Theme_textColor.withOpacity(0.04)
          ),
          height: 30,
          width: 30,
          alignment: Alignment.center,
        //  child: Icon(Icons.calendar_month,size: 18,color: Main_Theme_textColor.withOpacity(0.4),)
          child:CustomImageSction(height: 30, width: 30, radius: 3, image: "Assets/DashBoardIcons/clender.png")
      ),
    );
  }
}
