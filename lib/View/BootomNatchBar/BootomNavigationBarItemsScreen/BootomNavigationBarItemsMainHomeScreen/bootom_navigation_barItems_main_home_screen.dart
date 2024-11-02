import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/AdminEmployeeController/admin_employee_controller.dart';
import 'package:jibika_plexus/Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/CreateEmployeeScreen/create_employee.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/EmployeeProfile/employee_profile_screen.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/CounterProvider/counter_provider.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class BootomNavBarItemsEmployeeHomeScreen extends StatefulWidget {
  const BootomNavBarItemsEmployeeHomeScreen({super.key});

  @override
  State<BootomNavBarItemsEmployeeHomeScreen> createState() =>
      _BootomNavBarItemsEmployeeHomeScreenState();
}

class _BootomNavBarItemsEmployeeHomeScreenState
    extends State<BootomNavBarItemsEmployeeHomeScreen> {
  double animatwidth = 117;
  double lineWidth = 7.0;
  double C_height = 5;
  bool _is_click_date = false;
  int selectedmonth = 0;
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;
  int _selectedIndex = 0;
  List nameList = ['Active', 'Inactive'];
  @override
  void initState() {
    Provider.of<OnboardingEmployeeController>(context, listen: false)
        .GetShiftPlanNWeekendListProvider(
            "${GetStorage().read("mobile_id")}", context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    dynamic valcount = Provider.of<EmployeeAdminProvider>(context)
        .Admin_GetEmployeeListByStatus;
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(seconds: 1),
          () {
            Provider.of<EmployeeAdminProvider>(context, listen: false)
                .GetDailyAttendanceCounterListProvider(
                    "${GetStorage().read("mobile_id")}", "Active", 1, context);
          },
        );
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 55,
                width: double.infinity,
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 6),
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
                                  color:
                                      Main_Theme_textColor.withOpacity(0.1))),
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
                                  image:
                                      "Assets/DashBoardIcons/searchnormal.png",
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
                                      contentPadding:
                                          EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: font12,
                                          color:
                                              Main_Theme_textColor.withOpacity(
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Main_Theme_textColor_tir_Condition.withOpacity(0.0)),
                padding:
                    EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 0),
                child: AnimatedToggleSwitch<int>.size(
                    height: 35,
                    current: max(_selectedIndex, 0),
                    style: ToggleStyle(
                      backgroundColor: home_default_color,
                      indicatorColor: presentsent_color,
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                      indicatorBorderRadius: BorderRadius.circular(30),
                    ),
                    values: [0, 1],
                    iconOpacity: 1.0,
                    selectedIconScale: 1.0,
                    indicatorSize:
                        Size.fromWidth(MediaQuery.of(context).size.width / 2),
                    iconAnimationType: AnimationType.onHover,
                    styleAnimationType: AnimationType.onHover,
                    spacing: 2.0,
                    customSeparatorBuilder: (context, local, global) {
                      final opacity =
                          ((global.position - local.position).abs() - 0.5)
                              .clamp(0.0, 1.0);
                      return VerticalDivider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.white38.withOpacity(opacity));
                    },
                    customIconBuilder: (context, local, global) {
                      final text = nameList[local.index];
                      return Center(
                          child: Text(text,
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                  color: Color.lerp(Colors.black, Colors.white,
                                      local.animationValue))));
                    },
                    borderWidth: 1.0,
                    onChanged: (i) {
                      setState(() => _selectedIndex = i);
                      if (_selectedIndex == 1) {
                        Provider.of<EmployeeAdminProvider>(context,
                                listen: false)
                            .GetDailyAttendanceCounterListProvider(
                                "${GetStorage().read("mobile_id")}",
                                "Inactive",
                                1,
                                context);
                      } else {
                        Provider.of<EmployeeAdminProvider>(context,
                                listen: false)
                            .GetDailyAttendanceCounterListProvider(
                                "${GetStorage().read("mobile_id")}",
                                "Active",
                                1,
                                context);
                      }
                    }),
              ),
              SizedBox(
                height: 5,
              ),
              valcount != null
                  ? CustomText(
                      fontSize: fontSubTitle - 2,
                      fontWeight: FontWeight.w500,
                      text: _selectedIndex == 0
                          ? "Active(${valcount.length})"
                          : "Inactive(${valcount.length})",
                      letterSpacing: 0.1)
                  : CustomText(
                      fontSize: fontSubTitle,
                      fontWeight: FontWeight.w500,
                      text: "0",
                      letterSpacing: 0.1),
              Expanded(
                child: Consumer<EmployeeAdminProvider>(
                  builder: (context, value, child) {
                    print("${value.Admin_GetEmployeeListByStatus}");
                    return value.Admin_GetEmployeeListByStatus == null
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: CustomButtonColor,
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 7),
                            width: 400,
                            color: Main_Theme_WhiteCollor,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                                child: ListView.builder(
                              itemCount:
                                  value.Admin_GetEmployeeListByStatus.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeProfileScreen(
                                            currentEmployeedataIndex: value
                                                    .Admin_GetEmployeeListByStatus[
                                                index],
                                          ),
                                        ));
                                    Provider.of<CounterProvider>(context,
                                            listen: false)
                                        .selectedEmployeeforGetProfileFunction(
                                            index);
                                    Provider.of<OnboardingEmployeeController>(
                                            context,
                                            listen: false)
                                        .GetEmployeeByIdListProvider(
                                            "${value.Admin_GetEmployeeListByStatus[index]["IdCardNo"]}",
                                            "${GetStorage().read("mobile_id")}",
                                            context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: _isActive == false
                                            ? presentsent_color
                                                .withOpacity(0.05)
                                            : absent_color.withOpacity(0.1),
                                        border: Border(
                                            bottom: BorderSide(
                                          color: _isActive == false
                                              ? presentsent_color
                                              : absent_color,
                                        ))),
                                    margin: EdgeInsets.only(bottom: 7),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 0, top: 5, bottom: 5),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 27,
                                              backgroundImage:
                                                  value.Admin_GetEmployeeListByStatus[
                                                                  index][
                                                              "EmpPhotoPath"] !=
                                                          ""
                                                      ? NetworkImage(
                                                          "${GetStorage().read("APPS_IMG_BASEURL")}${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}")
                                                      : NetworkImage(
                                                          "${custom_Avater}"),
                                            ),
                                            CustomText(
                                                fontSize: font11,
                                                fontWeight: FontWeight.w500,
                                                text:
                                                    "${value.Admin_GetEmployeeListByStatus[index]["EmpCode"]}",
                                                letterSpacing: 0.1),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  value.Admin_GetEmployeeListByStatus[
                                                              index][
                                                          "EmployeeNameEnglish"] ??
                                                      "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: font13header,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.3,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomText(
                                                  maxLines: 1,
                                                  fontSize: font12,
                                                  fontWeight: FontWeight.w300,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text:
                                                      value.Admin_GetEmployeeListByStatus[
                                                                  index]
                                                              ["Designation"] ??
                                                          "",
                                                  letterSpacing: 0.3,
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomText(
                                                  fontSize: font12,
                                                  fontWeight: FontWeight.w300,
                                                  text:
                                                      value.Admin_GetEmployeeListByStatus[
                                                                  index]
                                                              ["Department"] ??
                                                          "",
                                                  letterSpacing: 0.3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomImageSction(
                                                  height: 15,
                                                  width: 15,
                                                  radius: 1,
                                                  image:
                                                      "Assets/DashBoardIcons/rating.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CustomImageSction(
                                                  height: 15,
                                                  width: 15,
                                                  radius: 1,
                                                  image:
                                                      "Assets/DashBoardIcons/rating.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CustomImageSction(
                                                  height: 15,
                                                  width: 15,
                                                  radius: 1,
                                                  image:
                                                      "Assets/DashBoardIcons/rating.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CustomImageSction(
                                                  height: 15,
                                                  width: 15,
                                                  radius: 1,
                                                  image:
                                                      "Assets/DashBoardIcons/rating.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              //    Icon(Icons.arrow_forward_ios_rounded,size: 22,color: Main_Theme_textColor,)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                          );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            // <= Change BeveledRectangleBorder to RoundedRectangularBorder
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          backgroundColor: CustomButtonColor,
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CreateNewEmployeeScreen(),
                ));
          },
          child: Image.asset(
            "Assets/DashBoardIcons/employee_management.png",
            height: 30,
            width: 30,
            fit: BoxFit.fill,
            color: Main_Theme_WhiteCollor,
          ),
        ),
      ),
    );
  }

  bool isActive = true;
  bool _isActive = false;
}
