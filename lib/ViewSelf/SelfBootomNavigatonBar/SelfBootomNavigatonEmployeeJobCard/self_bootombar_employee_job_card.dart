import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfLoan/self_loan.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfProfile/self_profile.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfStationary/self_stationary.dart';

import '../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';
import '../SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import '../self_bootom_navigation_bar.dart';

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
    "Documents",
    "Conveyance",
    "Loan",
    "Production",
    "Complain",
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
                        if(index==0){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileScreen(
                            areYouFromEmployee: "user",
                            getProfile: [],
                          ),));
                        }
                      else if(index==1){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
                        currentIndex: 1,
                        ),));
                        }
                        else if(index==2){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
                            currentIndex: 1,
                          ),));
                         }
                        else if(index==3){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
                            currentIndex: 1,
                          ),));
                         }
                        else if(index==4){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfStationary()));
                         }
                        else if(index==5){
                        }
                        else if(index==6){
                        }
                        else if(index==7){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfLoanScreen(),));
                        }
                        else if(index==8){
                        }
                        else if(index==9){
                        }
                        else{

                        }
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
