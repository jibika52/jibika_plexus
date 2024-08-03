import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfProfile/self_profile.dart';

import '../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';

class SelfBootomBarJobCardScreen extends StatefulWidget {
  const SelfBootomBarJobCardScreen({super.key});

  @override
  State<SelfBootomBarJobCardScreen> createState() => _SelfBootomBarJobCardScreenState();
}

class _SelfBootomBarJobCardScreenState extends State<SelfBootomBarJobCardScreen> {
  int selected_index=0;
  List countList=[
    "Profile ",
    "Job Card",
    "Leave",
    "Pay Slip",
    "Stationary",
    "Doc",
    "Conv.",
    "Loan",
    "Prod",
    "Complaint.",
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
    "Assets/DashBoardIcons/finger_scan.png", ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part -----------------------------
            // CustomEmployeeProfile(image: "Assets/DrawerImage/testperson.png", id: "89899898", name: "Abdur Rahaman", designation: "Software Engineer",
            //   time: "30Y 6M", onTap1: () {
            //
            //   }, onTap2: () {
            //
            //   },
            //   onTap3: () {
            //
            //   },
            //   need_location: false,
            // ),
            /// Second part -----------------------------

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40,top: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 20,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: countList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if(index==0){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfProfileScreen(),));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: CustomButtonColor,width: 1.5),
                            color: CustomButtonColor.withOpacity(0.04)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 7),
                            CustomImageSction(height: MediaQuery.of(context).size.height*0.05, width: MediaQuery.of(context).size.width*0.1, radius: 4, image: "${listimage[index]}"),
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
