import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomSelfWedget/MySelfCustomCalender/myself_custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/AttendanceController/attendance_controller.dart';
import '../../../../Controller/HomeController/home_controller.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../HomeScreen/HomeComponent/HomeSecondPartComponent/summary_status_second_part.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_pard_body_laft_side.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_part_progressbar.dart';

class BootomNavigationBarItemsAttendenceScreen extends StatefulWidget {
  const BootomNavigationBarItemsAttendenceScreen({super.key});

  @override
  State<BootomNavigationBarItemsAttendenceScreen> createState() =>
      _BootomNavigationBarItemsAttendenceScreenState();
}

class _BootomNavigationBarItemsAttendenceScreenState
    extends State<BootomNavigationBarItemsAttendenceScreen> {
  double animatedheight = 0;
  double animatwidth = 130;
  double lineWidth = 7.0;
  double C_height = 5;
  int selectedmonth = 0;
  int PASummary_select = DateTime.now().day;
  int key = 0;
  @override
  Widget build(BuildContext context) {
    final dashboardEmployeeInfo =
        Provider.of<HomeProvider>(context).dashboardEmployeeinfo;
    final dashboardBarChartData =
        Provider.of<HomeProvider>(context).dashboardBarChartData;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: home_default_color,
      //   appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context), text: "Attendance Calendar ")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part-----------------------
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11), color: Colors.white),
              margin: EdgeInsets.symmetric(
                  horizontal: 11, vertical: apps_div_margin),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    child: Row(
                      children: [
                        /// Home Third Part  Body Left Side
                        HomeThirdPartBodyLeftSide(
                          top1: "100%",
                          top2: "70%",
                          top3: "30%",
                          top4: "0%",
                          color: Main_Theme_textColor.withOpacity(0.6),
                        ),

                        /// Home Third Part  Body Right Side
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.greenAccent.shade100.withOpacity(0.1),
                          child: Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 90,
                              width: 500,
                              child: ListView.builder(
                                itemCount: dashboardBarChartData == null
                                    ? 0
                                    : "${dashboardBarChartData["tpls"]}" == "[]"
                                        ? 0
                                        : dashboardBarChartData["tpls"].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  //  print("fffffffff ${index + 1} -------- tpls ---- ${ dashboardBarChartData["tpls"][index]}  -------- tabls ---- ${ dashboardBarChartData["tabls"][index]}");
                                  return Container(
                                    height: 90,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: ThirdPartProgressBar(
                                          absenttheight:
                                              dashboardBarChartData == null
                                                  ? 0
                                                  : double.parse(
                                                      dashboardBarChartData[
                                                                      "tabls"]
                                                                  [index] ==
                                                              0
                                                          ? dashboardBarChartData[
                                                              "tabls"][index]
                                                          : "${int.parse("${dashboardBarChartData["tabls"][index]}") * 100 / int.parse("${dashboardEmployeeInfo["TotalEmployee"]}")}",
                                                    ),
                                          presentheight:
                                              dashboardBarChartData == null
                                                  ? 0
                                                  : double.parse(
                                                      dashboardBarChartData[
                                                                      "tpls"]
                                                                  [index] ==
                                                              0
                                                          ? dashboardBarChartData[
                                                              "tpls"][index]
                                                          : "${int.parse("${dashboardBarChartData["tpls"][index]}") * 100 / int.parse("${dashboardEmployeeInfo["TotalEmployee"]}")}",
                                                    ),
                                          present_width: 10,
                                          Absent_width: 10,
                                          total_width: 21,
                                        )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            height: 20,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                color: PASummary_select ==
                                                        index + 1
                                                    ? presentsent_color
                                                    : Main_Theme_textColor
                                                        .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            alignment: Alignment.center,
                                            child: CustomText(
                                                fontSize: font10,
                                                fontWeight: FontWeight.w400,
                                                text: "${index + 1}",
                                                letterSpacing: 0.2)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        )),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            /// Second part Calender ----------------------
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 42,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // color: Colors.red,
                        border: Border.all(
                            color: Main_Theme_textColor.withOpacity(0.15),
                            width: 1.5)),
                    padding: EdgeInsets.only(left: 7, right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageSction(
                            height: 24,
                            width: 24,
                            radius: 1,
                            image: "Assets/Icons/share2.png"),
                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        CustomImageSction(
                            height: 24,
                            width: 24,
                            radius: 1,
                            image: "Assets/Icons/sms.png"),
                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        CustomImageSction(
                            height: 24,
                            width: 24,
                            radius: 1,
                            image: "Assets/Icons/pdf.png"),
                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        Stack(
                          children: [
                            CustomImageSction(
                                height: 24,
                                width: 24,
                                radius: 1,
                                image:
                                    "Assets/DashBoardIcons/notification_attendence.png"),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: absent_color,
                                child: ColorCustomText(
                                    fontSize: font9,
                                    fontWeight: FontWeight.w400,
                                    text: "22",
                                    letterSpacing: 0.1,
                                    textColor: Main_Theme_WhiteCollor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: MyselfCustomCalender(
                        onTap: () {
                          _onPressed(context: context);
                        },
                        datetext: _selected_pick_month != null
                            ? "${DateFormat("MMM-yyyy").format(_selected_pick_month!)}"
                            : "${DateFormat("MMM-yyyy").format(DateTime.now())}",
                        width: 100,
                        height: 30),
                  )
                ],
              ),
            ),

            /// Third part-----------------------

            Expanded(child:
                Consumer<AttendanceProvder>(builder: (context, value, child) {
              //   print("ssssssssssssssssssss ${value.GetDailyAttendanceCounter}");
              return value.GetDailyAttendanceCounter == null
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: presentsent_color,
                    ))
                  : Container(
                      color: Main_Theme_WhiteCollor,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 150,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.GetDailyAttendanceCounter.length,
                        itemBuilder: (context, index) => Card(
                          color: Color(0xfff2f2ff),
                          child: Container(
                            height: 75,
                            width: double.infinity,
                            //  color: Colors.green,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //  color: Color(0xffF2F2F2)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        child: Container(
                                          padding: const EdgeInsets.all(0),
                                          height: 75,
                                          width: 75,
                                          child: LayoutBuilder(
                                            builder: (_, constraints) {
                                              return PieChart(
                                                key: ValueKey(key),
                                                chartValuesOptions:
                                                    ChartValuesOptions(
                                                        showChartValueBackground:
                                                            false,
                                                        showChartValues: false),

                                                /// Customize Right Side Option ----------------------------------P L H A----------.
                                                legendOptions: LegendOptions(
                                                    showLegends: false,
                                                    legendTextStyle: TextStyle(
                                                      fontSize: font10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                dataMap: {
                                                  "P(${double.parse("${value.GetDailyAttendanceCounter[index]["total_p"]}")}) ":
                                                      double.parse(
                                                          "${value.GetDailyAttendanceCounter[index]["total_p"]}"),
                                                  "A(${double.parse("${value.GetDailyAttendanceCounter[index]["total_ab"]}")})":
                                                      double.parse(
                                                          "${value.GetDailyAttendanceCounter[index]["total_ab"]}"),
                                                  "L(${double.parse("${value.GetDailyAttendanceCounter[index]["total_l"]}")})":
                                                      double.parse(
                                                          "${value.GetDailyAttendanceCounter[index]["total_l"]}"),
                                                  "H (${double.parse("${value.GetDailyAttendanceCounter[index]["total_wh"]}") + double.parse("${value.GetDailyAttendanceCounter[index]["total_awh"]}")})":
                                                      double.parse(
                                                              "${value.GetDailyAttendanceCounter[index]["total_wh"]}") +
                                                          double.parse(
                                                              "${value.GetDailyAttendanceCounter[index]["total_awh"]}"),
                                                },
                                                animationDuration:
                                                    const Duration(
                                                        milliseconds: 800),
                                                chartLegendSpacing: 10,
                                                chartRadius: math.min(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3.2,
                                                    300),
                                                // radius komay baray
                                                colorList: [
                                                  presentsent_color
                                                      .withOpacity(0.75),
                                                  absent_color
                                                      .withOpacity(0.75),
                                                  leave_color.withOpacity(0.75),
                                                  holiday_color
                                                      .withOpacity(0.75)
                                                ],
                                                initialAngleInDegree: 0,
                                                ringStrokeWidth: -4,
                                                baseChartColor:
                                                    Colors.transparent,
                                                centerWidget: CircleAvatar(
                                                  radius: 21,
                                                  backgroundColor:
                                                      Main_Theme_WhiteCollor,
                                                  child: CircleAvatar(
                                                    radius: 19.5,
                                                    backgroundColor:
                                                        Main_Theme_textColor
                                                            .withOpacity(0.6),
                                                    child: CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor:
                                                          Main_Theme_WhiteCollor,
                                                      child: Column(
                                                        children: [
                                                          ColorCustomText(
                                                              fontSize:
                                                                  font13header,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              text:
                                                                  "${value.GetDailyAttendanceCounter[index]["duty_date"].toString().substring(0, 2)}",
                                                              letterSpacing:
                                                                  0.1,
                                                              textColor:
                                                                  Main_Theme_textColor),
                                                          ColorCustomText(
                                                              fontSize: font10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              text:
                                                                  "${DateFormat("E").format(DateFormat("dd-MMM-yyyy").parse("${value.GetDailyAttendanceCounter[index]["duty_date"]}"))}",
                                                              letterSpacing:
                                                                  0.1,
                                                              textColor:
                                                                  Main_Theme_textColor),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ColorCustomText(
                                          fontSize: fontSubTitle,
                                          fontWeight: FontWeight.w400,
                                          text:
                                              "${value.GetDailyAttendanceCounter[index]["total"]}",
                                          letterSpacing: 0.3,
                                          textColor:
                                              Main_Theme_textColor.withOpacity(
                                                  0.9)),
                                      SizedBox(
                                        height: C_height,
                                      ),
                                      ColorCustomText(
                                          fontSize: font13header,
                                          fontWeight: FontWeight.w400,
                                          text: "Active",
                                          letterSpacing: 0.3,
                                          textColor:
                                              Main_Theme_textColor.withOpacity(
                                                  0.9)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text: "Present : ",
                                                letterSpacing: 0.3,
                                                textColor: presentsent_color),
                                            // SizedBox(width: 7,),
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text:
                                                    "${value.GetDailyAttendanceCounter[index]["total_p"]}",
                                                letterSpacing: 0.3,
                                                textColor: presentsent_color),
                                          ],
                                        ),
                                        SizedBox(
                                          height: C_height,
                                        ),
                                        Row(
                                          children: [
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text: "Absent : ",
                                                letterSpacing: 0.3,
                                                textColor: absent_color
                                                    .withOpacity(0.9)),
                                            //  SizedBox(width: 7,),
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text:
                                                    "${value.GetDailyAttendanceCounter[index]["total_ab"]}",
                                                letterSpacing: 0.3,
                                                textColor: absent_color
                                                    .withOpacity(0.9)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text: "Leave : ",
                                                letterSpacing: 0.3,
                                                textColor: leave_color
                                                    .withOpacity(0.9)),
                                            //  SizedBox(width: 7,),
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text:
                                                    "${value.GetDailyAttendanceCounter[index]["total_l"]}",
                                                letterSpacing: 0.3,
                                                textColor: leave_color
                                                    .withOpacity(0.9)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: C_height,
                                        ),
                                        Row(
                                          children: [
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text: "Holiday : ",
                                                letterSpacing: 0.3,
                                                textColor: holiday_color),
                                            //   SizedBox(width: 7,),
                                            ColorCustomText(
                                                fontSize: font13header,
                                                fontWeight: FontWeight.w400,
                                                text:
                                                    "${int.parse("${value.GetDailyAttendanceCounter[index]["total_wh"]}") + int.parse("${value.GetDailyAttendanceCounter[index]["total_awh"]}")}",
                                                letterSpacing: 0.3,
                                                textColor: holiday_color),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            }))
          ],
        ),
      ),
    );
  }

  final List<String> items = [
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
  ];
  String? selectedValue;
  DateTime? _selected_pick_month;
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected_pick_month ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2130),
      locale: localeObj,
    );

    if (selected != null) {
      setState(() {
        _selected_pick_month = selected;
        Provider.of<HomeProvider>(context, listen: false)
            .dashboardBarChartDataProvider(
                "${GetStorage().read("mobile_id")}",
                "${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}",
                "${DateFormat('MMM-yyyy').format(_selected_pick_month!)}",
                context);
      });
    }
  }
}
