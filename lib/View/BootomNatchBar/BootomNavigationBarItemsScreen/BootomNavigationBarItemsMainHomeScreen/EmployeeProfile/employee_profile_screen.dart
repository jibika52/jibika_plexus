import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    "Allowance.",
    "Conveyance",
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
  // @override
  // void initState() {
  //   Provider.of<HomeProvider>(context,listen: false).selfORAdminShortDescriptionProvider("${GetStorage().read("mobile_id")}", "${widget.currentEmployeedataIndex["IdCardNo"]}", context);
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
      //     text: "Uzzal Biswas")),
      body: Stack(
alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                /// First part -----------------------------

                customMainEmployeeProfile(
                    is_need_edit_button_on_short_profile: "false",
                    image: "${widget.currentEmployeedataIndex["EmpPhotoPath"]}",
                    employeeCode: "${widget.currentEmployeedataIndex["IdCardNo"]}",
                    employeeName: "${widget.currentEmployeedataIndex["EmployeeNameEnglish"]}",
                    employeeDesignation: "${widget.currentEmployeedataIndex["Designation"]}",
                    employeeDepartment: "${widget.currentEmployeedataIndex["Department"]}",
                    birthday:  "${widget.currentEmployeedataIndex["BirthDate"]??""}"
                ),
                /// Second part -----------------------------

                 Expanded(
                  child: Container(
                    padding:   EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 130
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: countList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if(index==0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(
                                areYouFromEmployee: "Employee",
                              ),));
                            }
                            else if(index==1){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => SafeArea(child: SelfBootomNavigatonEmployeeDashboard(
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
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => SafeArea(child: SelfBootomNavigationLeave( )),));
                            }
                            else if(index==3){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => SafeArea(child: BootomNavigationBarItemsPayrollScreen( )),));
                            }
                            
                          },
                          child: Container(
                            width: 130,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 0, left: 0, right: 0, bottom: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: CustomButtonColor.withOpacity(0.5),
                                          offset: const Offset(1.1, 4.0),
                                          blurRadius: 8.0),
                                    ],
                                    gradient: LinearGradient(
                                      colors:  [
                                        // HexColor("#738AE6"),
                                        // HexColor("#5C5EDD"),
                                        CustomButtonColor.withOpacity(0.5),
                                        CustomButtonColor.withOpacity(0.9),

                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius:   BorderRadius.only(
                                      bottomRight: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(40.0),
                                    ),
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  padding: EdgeInsets.only(left: 10,bottom: 10),
                                  child: Text(
                                    "${countList[index]}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      // fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      letterSpacing: 0.2,
                                      color: FitnessAppTheme.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: - 10,
                                  right: -5,
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Main_Theme_WhiteCollor.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(listimage[index],color: Main_Theme_WhiteCollor,height: 40,width: 40,fit: BoxFit.fill,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )




              ],
            ),
          ),
          Positioned(
            top: 250-35,
            child: Container(
              height: 45,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              //  color: Main_Theme_WhiteCollor,
                color: home_default_color,
              ),
              child:  ShareMessagePdfPart(
                width: 170,
                is_share: true, onTap: () {
              }, is_messsage: true, onTap2message: () {
              }, is_pdf: true, onTap3pdf: () {
              },
              ),
            ),
          )
        ],
      ),
        );
  }
}
