import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
    "My Profile ",
    "My Job Card",
    "My Leave",
    "My Pay Slip",
    "My Stationary",
    "My Documents",
    "My Conveyance",
    "My Loan",
    "My Production",
    "My Complain",
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
        padding: EdgeInsets.only(left: 17, right: 17, bottom: 10, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 120),
          scrollDirection: Axis.vertical,
          itemCount: countList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                                  if(index==0){
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileScreen(
                                      areYouFromEmployee: "user",
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
                //  padding: EdgeInsets.only(left: 15,right: 15),
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                    ),
                    color: Main_Theme_textColor.withOpacity(0.2),
                    border: Border.all(
                        color: Main_Theme_textColor.withOpacity(0.1))),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "${countList[index]}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            // fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: 0.2,
                            color: Main_Theme_textColor,
                          ),
                        ),
                      ),
                    ),
                    /// down Object ---------------------------------------------
                    Positioned(
                        bottom: -65,
                        left: 55,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()
                            ..rotateZ(60 * 3.1415927 / 180),
                          child: Container(
                            height: 120,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10)),
                                //   borderRadius: BorderRadius.only(
                                //     bottomLeft: Radius.circular(45)
                                //   ),
                              // color: Main_Theme_textColor.withOpacity(0.3),

                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Main_Theme_WhiteCollor.withOpacity(0.25),
                                      Main_Theme_textColor.withOpacity(0.1)
                                    ]),

                            ),
                          ),
                        )),


                    /// Top Object ---------------------------------------------
                    Positioned(
                        top: -20,
                        left: 3,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()
                            ..rotateZ(50 * 3.1415927 / 180),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10)),
                                //   borderRadius: BorderRadius.only(
                                //     bottomLeft: Radius.circular(45)
                                //   ),
                                //   color: Main_Theme_textColor.withOpacity(0.07),

                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Main_Theme_WhiteCollor.withOpacity(0.25),
                                      Main_Theme_textColor.withOpacity(0.1)
                                    ]
                                )

                            ),
                          ),
                        )),


                    Positioned(
                      top: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Main_Theme_WhiteCollor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(7),
                        //  child: Image.asset("Assets/SelfIcon/test_attendance.png",height: 30,width: 30,color: Main_Theme_textColor.withOpacity(0.8),),
                        //    child: Image.asset("${listimage[listimage.length-1]}",height: 30,width: 30,color: Main_Theme_textColor.withOpacity(0.9),),
                        child: Image.asset(
                          "${listimage[index]}",
                          height: 30,
                          width: 30,
                          color: Main_Theme_textColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // child :  Container(
    //     width: 130,
    //     child: Stack(
    //       children: <Widget>[
    //         Container(
    //           width: double.infinity,
    //           height: double.infinity,
    //           margin: const EdgeInsets.only(
    //             top: 0, left: 0, right: 0, bottom: 0,
    //           ),
    //           decoration: BoxDecoration(
    //             boxShadow: <BoxShadow>[
    //               BoxShadow(
    //                   color: CustomButtonColor.withOpacity(0.5),
    //                   offset: const Offset(1.1, 4.0),
    //                   blurRadius: 8.0),
    //             ],
    //             gradient: LinearGradient(
    //               colors:  [
    //                 // HexColor("#738AE6"),
    //                 // HexColor("#5C5EDD"),
    //                 CustomButtonColor.withOpacity(0.5),
    //                 CustomButtonColor.withOpacity(0.9),
    //
    //               ],
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //             ),
    //             borderRadius:   BorderRadius.only(
    //               bottomRight: Radius.circular(8.0),
    //               bottomLeft: Radius.circular(8.0),
    //               topLeft: Radius.circular(8.0),
    //               topRight: Radius.circular(40.0),
    //             ),
    //           ),
    //           alignment: Alignment.bottomLeft,
    //           padding: EdgeInsets.only(left: 10,bottom: 10),
    //           child: Text(
    //             "${countList[index]}",
    //             textAlign: TextAlign.center,
    //             style: GoogleFonts.poppins(
    //               // fontFamily: "Roboto",
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               letterSpacing: 0.2,
    //               color: FitnessAppTheme.white,
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: - 5,
    //           right: -5,
    //           child: Container(
    //             width: 70,
    //             height: 70,
    //             decoration: BoxDecoration(
    //               color: Main_Theme_WhiteCollor.withOpacity(0.2),
    //               shape: BoxShape.circle,
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: 10,
    //           right: 10,
    //           child: Container(
    //             width: 50,
    //             height: 50,
    //             padding: EdgeInsets.all(5),
    //             child: Image.asset(listimage[index],color: Main_Theme_WhiteCollor,height: 40,width: 40,fit: BoxFit.fill,),
    //           ),
    //         ),
    //       ],
    //     ),
    //   )
    );
    },
    ),
    ),

      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: Column(
      //     children: [
      //       /// First part -----------------------------
      //       // CustomEmployeeProfile(image: "Assets/DrawerImage/testperson.png", id: "89899898", name: "Abdur Rahaman", designation: "Software Engineer",
      //       //   time: "30Y 6M", onTap1: () {
      //       //
      //       //   }, onTap2: () {
      //       //
      //       //   },
      //       //   onTap3: () {
      //       //
      //       //   },
      //       //   need_location: false,
      //       // ),
      //       /// Second part -----------------------------
      //
      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.all(10),
      //           child: GridView.builder(
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 10,
      //               crossAxisSpacing: 10,
      //               mainAxisExtent: 95
      //             ),
      //             scrollDirection: Axis.vertical,
      //             itemCount: countList.length,
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                 onTap: () {
      //                   if(index==0){
      //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileScreen(
      //                       areYouFromEmployee: "user",
      //                     ),));
      //                   }
      //                 else if(index==1){
      //                   Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
      //                   currentIndex: 1,
      //                   ),));
      //                   }
      //                   else if(index==2){
      //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
      //                       currentIndex: 1,
      //                     ),));
      //                    }
      //                   else if(index==3){
      //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
      //                       currentIndex: 1,
      //                     ),));
      //                    }
      //                   else if(index==4){
      //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfStationary()));
      //                    }
      //                   else if(index==5){
      //                   }
      //                   else if(index==6){
      //                   }
      //                   else if(index==7){
      //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfLoanScreen(),));
      //                   }
      //                   else if(index==8){
      //                   }
      //                   else if(index==9){
      //                   }
      //                   else{
      //
      //                   }
      //                   },
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //                    //   border: Border.all(color: CustomButtonColor,width: 1.5),
      //                       color: CustomButtonColor.withOpacity(1.0)
      //                   ),
      //                   child: Column(
      //                     children: [
      //                       SizedBox(height: 7),
      //                       Container(
      //                         padding: EdgeInsets.only(right: 10),
      //                           alignment: Alignment.centerRight,
      //                           child: CustomImageSction2(height: MediaQuery.of(context).size.height*0.05, width: MediaQuery.of(context).size.width*0.1, radius: 4, image: "${listimage[index]}", img_color: Main_Theme_WhiteCollor,)),
      //                       Expanded(
      //                           flex: 3,
      //                           child: Align(
      //                             alignment: Alignment.centerLeft,
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.only(
      //                                   topLeft: Radius.circular(5),
      //                                   bottomLeft: Radius.circular(5),
      //                                 ),
      //                               ),
      //                               padding: EdgeInsets.only(
      //                                   top: 10,bottom: 0,right: 5,left: 10
      //                               ),
      //                               child: ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "${countList[index]}", letterSpacing: 0.2, textColor: Main_Theme_WhiteCollor),
      //                             ),
      //                           ),
      //                        ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             },),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
