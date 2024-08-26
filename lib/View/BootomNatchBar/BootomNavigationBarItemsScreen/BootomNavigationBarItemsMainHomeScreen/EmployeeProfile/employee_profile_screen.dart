import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeProfileScreen extends StatefulWidget {
   EmployeeProfileScreen({super.key ,required this.currentEmployeedataIndex});
  dynamic currentEmployeedataIndex;
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
            CustomEmployeeProfile(
              image: "${widget.currentEmployeedataIndex["EmpPhotoPath"]}",
              id: "${widget.currentEmployeedataIndex["IdCardNo"]}",
              name: "${widget.currentEmployeedataIndex["EmployeeNameEnglish"]}",
              designation: "${widget.currentEmployeedataIndex["Designation"]}",
              time: "${widget.currentEmployeedataIndex["Department"]}", onTap1: () {

                }, onTap2: () {

                },
            onTap3: () {

            },
              need_location: false,
            ),
            /// Second part -----------------------------

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 95
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: countList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //   border: Border.all(color: CustomButtonColor,width: 1.5),
                            color: CustomButtonColor.withOpacity(1.0)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 7),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                alignment: Alignment.centerRight,
                                child: CustomImageSction2(height: MediaQuery.of(context).size.height*0.05, width: MediaQuery.of(context).size.width*0.1, radius: 4, image: "${listimage[index]}", img_color: Main_Theme_WhiteCollor,)),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 10,bottom: 0,right: 5,left: 10
                                  ),
                                  child: ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "${countList[index]}", letterSpacing: 0.2, textColor: Main_Theme_WhiteCollor),
                                ),
                              ),
                            ),
                          ],
                        ),
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
