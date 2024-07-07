import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeProfileScreen extends StatefulWidget {
  const EmployeeProfileScreen({super.key});

  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Uzzal Biswas")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 114,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(colors: [
                  Main_Theme_textColor_tir_Condition.withOpacity(0.2),
                  Main_Theme_textColor_tir_Condition.withOpacity(0.4),
                  Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                  Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                  Main_Theme_textColor_tir_Condition,
                ])
              ),
              child: Row(
                children: [
                  CustomImageSction(height: 94, width: 78, radius: 7, image: "Assets/DrawerImage/testperson.png"),
                  Expanded(child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xffACC027).withOpacity(0.6),
                          ),
                          child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "#8969666", letterSpacing: 0.5, textColor: Main_Theme_WhiteCollor,),
                        ),
                        SizedBox(height:2,),
                        ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "Abdur Rahman", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                        ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "Software Eng.", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                        ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "30Y 5M", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                        SizedBox(height: 8,)
                      ],
                    ),
                  )),
                  Container(
                    height: 114,
                    width: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
