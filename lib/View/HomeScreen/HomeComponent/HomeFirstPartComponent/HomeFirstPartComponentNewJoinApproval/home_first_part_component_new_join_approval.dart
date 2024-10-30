import 'dart:math';
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/EmployeeProfile/employee_profile_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../Utils/constants.dart';

class HomeFirstPartComponentNewJoinApproval extends StatefulWidget {
  const HomeFirstPartComponentNewJoinApproval({super.key});

  @override
  State<HomeFirstPartComponentNewJoinApproval> createState() =>
      _HomeFirstPartComponentNewJoinApprovalState();
}

class _HomeFirstPartComponentNewJoinApprovalState
    extends State<HomeFirstPartComponentNewJoinApproval> {
  int _selectedIndex = 0;
  List nameList = [
    "Waiting",
    "Disapproved",
  ];
  bool isChekin = false;
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomDefaultAppBar(
              onTap: () => Navigator.pop(context), text: "NEW JOIN APPROVAL")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 6),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                        height: 48,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromRGBO(245, 245, 245, 1),
                            border: Border.all(
                                width: 2,
                                color: Main_Theme_textColor.withOpacity(0.1))),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 16,
                              width: 16,
                              child: CustomImageSction2(
                                height: 16,
                                width: 16,
                                radius: 1,
                                image: "Assets/DashBoardIcons/searchnormal.png",
                                img_color:
                                    Main_Theme_textColor.withOpacity(0.5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 12,
                              width: 2,
                              color: Main_Theme_textColor.withOpacity(0.1),
                            ),
                            Expanded(
                              child: Container(
                                  child: TextFormField(
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: font12,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 10),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: font12,
                                        color: Main_Theme_textColor.withOpacity(
                                            0.30)),
                                    hintText: "Search Here"),
                              )),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: 53,
                    width: 40,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7.95),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(245, 245, 245, 1),
                        border: Border.all(
                            width: 2,
                            color: Main_Theme_textColor.withOpacity(0.1))),
                    child: CustomImageSction(
                        height: 17,
                        width: 15,
                        radius: 1,
                        image: "Assets/DrawerImage/search_filter.png"),
                  ),
                ],
              ),
            ),
            Consumer<HomeProvider>(
                builder: (context, value, child) => value
                            .ThisMonthJoinEmployeeList ==
                        null
                    ? Center(child: Text(""))
                    : ColorCustomText(
                        textColor: presentsent_color,
                        fontSize: fontSubTitle - 2,
                        fontWeight: FontWeight.w500,
                        text:
                            "Waiting(${value.ThisMonthJoinEmployeeList.length})",
                        letterSpacing: 0.1)),
            Consumer<HomeProvider>(
              builder: (context, value, child) => value
                          .ThisMonthJoinEmployeeList ==
                      null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height < 900
                          ? MediaQuery.of(context).size.height -
                              75 -
                              55 -
                              13 -
                              45 -
                              15
                          : MediaQuery.of(context).size.height -
                              75 -
                              55 -
                              13 -
                              45,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: apps_div_margin - 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        itemCount: value.ThisMonthJoinEmployeeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => EmployeeProfileScreen(
                                        currentEmployeedataIndex: value
                                            .ThisMonthJoinEmployeeList[index]),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  //  color: Color(0xffF3FCFB)
                                  color: CheckOutColor.withOpacity(0.08),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: _selectedIndex == 0
                                              ? presentsent_color
                                              : absent_color))),
                              margin: EdgeInsets.only(bottom: 7),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 6, right: 10),
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(
                                            selectedindex == index ? 0 : 7),
                                        bottomRight: Radius.circular(
                                            selectedindex == index ? 0 : 7),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          //      backgroundImage:value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]!=""? NetworkImage("${GetStorage().read("APPS_IMG_BASEURL")}${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}"): NetworkImage("${custom_Avater}"),
                                          backgroundImage: AssetImage(
                                              "Assets/DrawerImage/testperson.png"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ColorCustomText(
                                                  fontSize: font12,
                                                  fontWeight: FontWeight.w500,
                                                  text:
                                                      "ID: ${value.ThisMonthJoinEmployeeList[index]["EMPCODE"]}",
                                                  letterSpacing: 0.3,
                                                  textColor: CustomButtonColor
                                                      .withOpacity(0.7),
                                                ),
                                                Text(
                                                  "${value.ThisMonthJoinEmployeeList[index]["EMPLOYEE_NAME_ENGLISH"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: font13header,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.3,
                                                  ),
                                                ),
                                                CustomText(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: font12,
                                                  fontWeight: FontWeight.w400,
                                                  text:
                                                      "${value.ThisMonthJoinEmployeeList[index]["DESIGNATION_ENGLISH"]}",
                                                  letterSpacing: 0.3,
                                                ),
                                                // CustomText(maxLines: 1,overflow: TextOverflow.ellipsis,fontSize: font11, fontWeight: FontWeight.w400, text: "${value.ThisMonthJoinEmployeeList[index]["DEPARTMENT_ENGLISH"]}", letterSpacing: 0.3,  ),
                                              ],
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 1.5,
                                          color:
                                              Main_Theme_textColor.withOpacity(
                                                  0.3),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                    fontSize: font13header,
                                                    fontWeight: FontWeight.w600,
                                                    text: "Gross Salary",
                                                    letterSpacing: 0.5),
                                                CustomText(
                                                    fontSize: font12,
                                                    fontWeight: FontWeight.w600,
                                                    text:
                                                        "${value.ThisMonthJoinEmployeeList[index]["GROSS"]}",
                                                    letterSpacing: 0.5),
                                              ],
                                            )),
                                      ],
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
    );
  }
}
