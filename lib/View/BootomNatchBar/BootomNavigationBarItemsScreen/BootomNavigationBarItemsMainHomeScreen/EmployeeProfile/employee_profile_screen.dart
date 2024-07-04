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
              margin: EdgeInsets.all(10),
              height: 104,
              width: double.infinity,
              child: Row(
                children: [
                  CustomImageSction(height: 94, width: 78, radius: 7, image: "Assets/DrawerImage/testperson.png"),
                  Expanded(child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 42,
                          color: Color(0xffACC027).withOpacity(0.6),
                          child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w500, text: " jibika plexus", letterSpacing: 0.5, textColor: CustomButtonColor,),
                        ),
                        ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: " Abdur Rahman", letterSpacing: 0.5, textColor: presentsent_color.withOpacity(0.7),),
                        ColorCustomText(fontSize: 10, fontWeight: FontWeight.w500, text: "  Software Eng.", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                        ColorCustomText(fontSize: 10, fontWeight: FontWeight.w300, text: "  30Y 5M", letterSpacing: 0.5, textColor: CustomButtonColor,),

                      ],
                    ),
                  )),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
