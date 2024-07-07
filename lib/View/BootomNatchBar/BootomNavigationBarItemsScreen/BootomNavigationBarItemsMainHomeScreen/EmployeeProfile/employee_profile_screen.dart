import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int selected_index=0;
  List countList=[
    "Profile ",
    "Job Card",
    "Leave",
    "Payroll",
    "Tracking",
    "Deduction",
    "Allowance.",
    "Convince",
    "Loan",
    "Arrear.",
    "Inactive",
    "Prod...",
    "Doc",
  ];
  List listimage=[
    "Assets/DashBoardIcons/employee_icon.png",
    "Assets/DashBoardIcons/finger_scan.png",
    "Assets/DashBoardIcons/aireplane_leave.png",
    "Assets/DashBoardIcons/promotion.png",
    "Assets/DashBoardIcons/loan.png",
    "Assets/DashBoardIcons/convence.png",
    "Assets/DashBoardIcons/requistion.png",
    "Assets/DashBoardIcons/complain.png",
    "Assets/DashBoardIcons/employee_icon.png",
    "Assets/DashBoardIcons/finger_scan.png",
    "Assets/DashBoardIcons/aireplane_leave.png",
    "Assets/DashBoardIcons/promotion.png",
    "Assets/DashBoardIcons/loan.png",
  ];
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
            /// First part -----------------------------
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomImageSction(height: 30, width: 30, radius: 7, image: "Assets/DashBoardIcons/callfont.png"),
                        CustomImageSction(height: 30, width: 30, radius: 7, image: "Assets/DashBoardIcons/messagetext.png"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /// Second part -----------------------------

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 46.0,right: 46,top: 30),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 30,
                ),
                scrollDirection: Axis.vertical,
                    itemCount: countList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: CustomButtonColor,width: 1.5),
                          color: CustomButtonColor.withOpacity(0.1)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 7),
                            CustomImageSction(height: 47, width: 54, radius: 4, image: "${listimage[index]}"),
                            Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(  
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                      color: CustomButtonColor,
                                    ),
                                    padding: EdgeInsets.only(
                                      top: 2,bottom: 2,right: 5,left: 5
                                    ),
                                    child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${countList[index]}", letterSpacing: 0.2, textColor: Main_Theme_WhiteCollor),
                                                              ),
                                )),
                          ],
                        ),
                      );
                    },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
