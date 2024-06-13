import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class CustomLeftDrawer extends StatelessWidget {
  const CustomLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Main_Theme_WhiteCollor,
        width: 291,
        padding: EdgeInsets.only(left: 13,right: 13,top: 13),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
              child: Row(
                children: [
                  CustomImageSction(height: 121, width: 100, radius: 0, image: "Assets/DrawerImage/testperson.png"),
                  Expanded(child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 44,
                          color: Color(0xffACC027).withOpacity(0.6),
                          child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w500, text: "jibika plexus", letterSpacing: 0.5, textColor: CustomButtonColor,),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 13,
                          color: Color(0xffE4E6E5),
                          child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Abdur Rahman", letterSpacing: 0.5, textColor: CustomButtonColor,),
                        ),


                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
