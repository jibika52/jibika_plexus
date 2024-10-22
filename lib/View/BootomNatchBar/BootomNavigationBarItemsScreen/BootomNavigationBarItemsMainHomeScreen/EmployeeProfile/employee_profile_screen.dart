import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_main_employee_profile.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeDashboard/self_bootom_navigaton_employee_dashboard.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfProfile/self_profile.dart';
import 'package:jibika_plexus/main.dart';
import 'package:provider/provider.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';
import '../../../../../ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import '../../BootomNavigationBarItemsPayrollScreen/bootom_navigationar_Items_payroll_screen.dart';

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
    "Allowance",
    "Conveyance",
    "Loan",
    "Arrear.",

    "Documents",
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

    "Assets/DashBoardIcons/loan.png",
  ];
  // @override
  // void initState() {
  //   Provider.of<HomeProvider>(context,listen: false).selfORAdminShortDescriptionProvider("${GetStorage().read("mobile_id")}", "${widget.currentEmployeedataIndex["IdCardNo"]}", context);
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
     print("aaaaaaaaaaaaaaaaaaaaaa${MediaQuery.of(context).size.height}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${widget.currentEmployeedataIndex}");

     return Scaffold(

      appBar: PreferredSize(preferredSize: Size.fromHeight(68), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Activities")),
      body:   Container(
        height:MediaQuery.of(context).size.height ,
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     colors: [
          //       Main_Theme_textColor_tir_Condition,
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.8),
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.7),
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.6),
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.5),
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.4),
          //       Main_Theme_textColor_tir_Condition.withOpacity(0.3),
          //     ]
          // ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 35,
                      backgroundColor: presentsent_color,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomImageSctionNetwork(height: 84, width: 84, radius: 100, image:"${widget.currentEmployeedataIndex["EmpPhotoPath"]}"),
                      )
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Main_Theme_textColor.withOpacity(0.5),
                              ),
                              child:

                              ColorCustomText(fontSize: fontTitle, fontWeight: FontWeight.w700, text: "${widget.currentEmployeedataIndex["EmpCode"]}",
                                letterSpacing: 0.7, textColor: Main_Theme_WhiteCollor,),
                            ),
                            Spacer()
                          ],
                        ),

                        SizedBox(height:2,),
                        ColorCustomText(fontSize: fontTitle, maxLines: 1,overflow:TextOverflow.ellipsis,fontWeight: FontWeight.w500, text: "${widget.currentEmployeedataIndex["EmployeeNameEnglish"]}", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                        ColorCustomText(fontSize: fontSubTitle, fontWeight: FontWeight.w400, text: "${widget.currentEmployeedataIndex["Designation"]}", letterSpacing: 0.5, textColor: Main_Theme_textColor,),

                      ],
                    ),
                  ),
                ],
              ),
            ),




















            /// Body Part--------------------------------------------------------------
            Expanded(
              child: Padding(
                padding:   EdgeInsets.only(left: 17,right: 17,bottom: 10,top: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing:16,
                      mainAxisExtent: 120
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: countList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if(index==0){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(
                            areYouFromEmployee: "Employee",
                          ),));
                        }
                        else if(index==1){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => Scaffold(
                              appBar: PreferredSize(preferredSize: Size.fromHeight(68), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
                                  text: "Job Card")),
                              body: SelfBootomNavigatonEmployeeDashboard(
                                  are_you_user: "employee",
                                  IdCardNo: "${widget.currentEmployeedataIndex["IdCardNo"]}",
                                  userId_mobile: "${GetStorage().read("mobile_id")}",
                                  image: "${widget.currentEmployeedataIndex["EmpPhotoPath"]}",
                                  employeeCode: "${widget.currentEmployeedataIndex["IdCardNo"]}",
                                  employeeName: "${widget.currentEmployeedataIndex["EmployeeNameEnglish"]}",
                                  employeeDesignation: "${widget.currentEmployeedataIndex["Designation"]}",
                                  employeeDepartment: "${widget.currentEmployeedataIndex["Department"]}",
                                  birthday:  "${widget.currentEmployeedataIndex["BirthDate"]??""}"
                              )),));
                        }
                        else if(index==2){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => Scaffold(
                              appBar: PreferredSize(preferredSize: Size.fromHeight(68), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
                                  text: "Leave")),
                              body: SelfBootomNavigationLeave( )),));
                        }
                        else if(index==3){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => Scaffold(
                              appBar: PreferredSize(preferredSize: Size.fromHeight(68), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
                                  text: "Payroll")),
                              body: BootomNavigationBarItemsPayrollScreen( )),));
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
                          border: Border.all(color: Main_Theme_textColor.withOpacity(0.1))
                        ),
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


                            // Positioned(
                            //     top: 0,
                            //     left: 0,
                            //     child: Container(
                            //   height: 30,
                            //   width: 30,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.only(
                            //           bottomRight: Radius.circular(45)
                            //         ),
                            //         color: Main_Theme_textColor.withOpacity(0.1),
                            //       ),
                            // )),

                            Positioned(
                                bottom: -37,
                                right: 3,
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: new Matrix4.identity()
                                    ..rotateZ(50 * 3.1415927 / 180),
                                  child: Container(
                                                        height: 70,
                                                        width:  70,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(10)
                                       ),
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
                                       ])
                                     ),
                                                      ),
                                )),
                            Positioned(
                                top: -20,
                                left: 3,
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: new Matrix4.identity()
                                    ..rotateZ(50 * 3.1415927 / 180),
                                  child: Container(
                                                        height: 70,
                                                        width:  70,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         bottomRight: Radius.circular(10)
                                       ),
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
                                       ])
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
                                child: Image.asset("${listimage[index]}",height: 30,width: 30,color: Main_Theme_textColor.withOpacity(0.9),),
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
            ),
          ],
        ),
      ),
        );
  }
}
