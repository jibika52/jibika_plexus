import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeFivePartComponent/home_five_part_body_section.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeSevenPartComponent/home_seven_part_body_section.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_pard_body_laft_side.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_part_progressbar.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeSecondPartComponent/summary_status.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Model/DashboardEmployeeLeaveListModel/dashboard_employee_leave_list_model.dart';
import 'HomeComponent/HomeFirstPartComponent/home_header_partt.dart';
import 'HomeComponent/HomeThirdPartComponent/home_thired_part_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<ScaffoldState>();
  late List<_ChartData> data = [];
  late TooltipBehavior _tooltip;
  double total_Amount = 20.0;
  String value = "K";
  double animated_leave = 0;
  double animated_height = 0;
  int PASummary_select = DateTime.now().day;
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardPieChartDataProvider(
            "${GetStorage().read("mobile_id")}", "$selected3Datee", context);
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardBarChartDataProvider(
            "${GetStorage().read("mobile_id")}",
            "${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}",
            "$selected3Datee",
            context);
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardOnleaveEmployeeListProvider(
            "${GetStorage().read("mobile_id")}",
            "$selected4Datee",
            context); //Person on leave
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardEmployeeInfoProvider(
            "${GetStorage().read("mobile_id")}",
            "${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}",
            context); //Dashboard Employee info
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardTodaysBirthdayEmployeeInfoProvider(
            "${GetStorage().read("mobile_id")}",
            "",
            context); // Todays birthday
    Provider.of<HomeProvider>(context, listen: false)
        .dashboardSalaryComprisonListProvider(
            "${GetStorage().read("mobile_id")}",
            "",
            context); // Salary Comprison list

    _tooltip = TooltipBehavior(enable: true);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "mobile_id====>${GetStorage().read("mobile_id")}---------------id_token====>${GetStorage().read("id_token")}------------------------refresh_token====>${GetStorage().read("refresh_token")}");

    final dashboardPieChartData =
        Provider.of<HomeProvider>(context).dashboardPieChartData;
    final dashboardBarChartData =
        Provider.of<HomeProvider>(context).dashboardBarChartData;
    final dashboardOnLeaveEmployeeData =
        Provider.of<HomeProvider>(context).dashboardOnleaveEmployeeList;
    final dashboardEmployeeInfo =
        Provider.of<HomeProvider>(context).dashboardEmployeeinfo;
    final dashboardtodaysBirthdayEmployeeinfo =
        Provider.of<HomeProvider>(context).dashboardtodaysBirthdayEmployeeinfo;
    final dashboardSalaryComparisanChartList =
        Provider.of<HomeProvider>(context).dashboardSalaryComparisanChartList;

    //   print("Get Data--------------------------------------------------- ${dashboardPieChartData}");

    double TP = double.parse(dashboardPieChartData == null
        ? "0"
        : "${dashboardPieChartData["plist"]}" == "[]"
            ? "0"
            : "${dashboardPieChartData["plist"][0] ?? 0}");
    double TA = double.parse(dashboardPieChartData == null
        ? "0"
        : "${dashboardPieChartData["plist"]}" == "[]"
            ? "0"
            : "${dashboardPieChartData["plist"][1] ?? 0}");
    double TL = double.parse(dashboardPieChartData == null
        ? "0"
        : "${dashboardPieChartData["plist"]}" == "[]"
            ? "0"
            : "${dashboardPieChartData["plist"][2] ?? 0}");
    double TH = double.parse(dashboardPieChartData == null
        ? "0"
        : "${dashboardPieChartData["plist"]}" == "[]"
            ? "0"
            : "${dashboardPieChartData["plist"][3] ?? 0}");
    double TH2 = double.parse(dashboardPieChartData == null
        ? "0"
        : "${dashboardPieChartData["plist"]}" == "[]"
            ? "0"
            : "${dashboardPieChartData["plist"][4] ?? 0}");

    int total_present_parsent = double.parse("${TP}").toInt();
    int total_absent_parsent = double.parse("${TA + TP}").toInt();
    int total_leave_parsent = double.parse("${TA + TP + TL}").toInt();
    int total_holiday_parsent = double.parse("${TA + TP + TL + TH}").toInt();
    int total_holiday_parsent2 =
        double.parse("${TA + TP + TL + TH + TH2}").toInt();

    if (dashboardSalaryComparisanChartList != null)
      for (int i = 0; i < 12; i++) {
        if (dashboardSalaryComparisanChartList.length < i + 1) {
          data.add(_ChartData("${i}", 0.0, 0.0));
        } else {
          data.add(_ChartData(
              "${dashboardSalaryComparisanChartList[i]["PayrollMonth"] ?? "$i"}",
              double.parse(
                  "${dashboardSalaryComparisanChartList[i]["TotalNetPay"] ?? 0.0}"),
              double.parse(
                  "${dashboardSalaryComparisanChartList[i]["TotalNetOt"] ?? 0.0}")));

          if (total_Amount <
              double.parse(
                  "${dashboardSalaryComparisanChartList[i]["TotalNetPay"]}")) {
            total_Amount = double.parse(
                "${dashboardSalaryComparisanChartList[i]["TotalNetPay"]}");
          }
        }
      }

    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        body: Container(
            color: home_default_color,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// ------------- First Part ---------------///
                  Padding(
                    padding: const EdgeInsets.only(
                        top: apps_div_margin - 2, left: 10.0, right: 10),
                    child: HomeHederPart(
                      permission_list: [],
                    ),
                  ),

                  /// ------------- Second Part -------------///
                  Container(
                    height: 180,
                    padding:
                        const EdgeInsets.only(top: 7, left: 11.0, right: 11),
                    child: SecondhomePartScreen(
                      presentTExt: "$total_present_parsent",
                      PersentCount: dashboardPieChartData != null &&
                              "${dashboardPieChartData["clist"]}" != "[]"
                          ? "${dashboardPieChartData["clist"][0] ?? 0}"
                          : "0",
                      AbsentCount: dashboardPieChartData != null &&
                              "${dashboardPieChartData["clist"]}" != "[]"
                          ? "${dashboardPieChartData["clist"][1] ?? 0}"
                          : '0',
                      LeaveCount: dashboardPieChartData != null &&
                              "${dashboardPieChartData["clist"]}" != "[]"
                          ? "${dashboardPieChartData["clist"][2] ?? 0}"
                          : '0',
                      HolidayCount: dashboardPieChartData != null &&
                              "${dashboardPieChartData["clist"]}" != "[]"
                          ? "${dashboardPieChartData["clist"][3] ?? 0}"
                          : '0',
                      ManpowerCount: "255",
                      //  total_present:"0.${int.parse("${dashboardPieChartData["plist"][0] ?? 0}")}",
                      total_present: double.parse(total_present_parsent == 100
                          ? "1.0"
                          : "0.$total_present_parsent"),
                      total_absent: double.parse(total_absent_parsent == 100
                          ? "1.0"
                          : "0.$total_absent_parsent"),
                      total_leave: double.parse(total_leave_parsent == 100
                          ? "1.0"
                          : "0.$total_leave_parsent"),
                      total_holiday: double.parse(total_holiday_parsent2 == 100
                          ? "1.0"
                          : "0.$total_holiday_parsent2"),
                      date_onTap: () {
                        _select3Date(context);
                      },
                      date_text: "${selected3Datee}",
                      manpower: "${dashboardEmployeeInfo}" == "null"
                          ? "0"
                          : "${dashboardEmployeeInfo["TotalEmployee"]}",
                    ),
                  ),

                  ///---------------- Third Part --------------------///
                  Container(
                    height: 187,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white),
                    margin: EdgeInsets.symmetric(
                        horizontal: 11, vertical: apps_div_margin),
                    child: Column(
                      children: [
                        ///----------- Bar chat Header Part -------///
                        HomeThiredPartHeader(
                          PayableMony: "150",
                          DailyMony: "1500",
                          CumulativeMony: "6966",
                        ),
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
                                color: Colors.greenAccent.shade100
                                    .withOpacity(0.1),
                                child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    height: 90,
                                    width: 500,
                                    child: ListView.builder(
                                      itemCount: dashboardBarChartData == null
                                          ? 0
                                          : "${dashboardBarChartData["tpls"]}" ==
                                                  "[]"
                                              ? 0
                                              : dashboardBarChartData["tpls"]
                                                  .length,
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
                                                    dashboardBarChartData ==
                                                            null
                                                        ? 0
                                                        : double.parse(
                                                            dashboardBarChartData[
                                                                            "tabls"]
                                                                        [
                                                                        index] ==
                                                                    0
                                                                ? dashboardBarChartData[
                                                                        "tabls"]
                                                                    [index]
                                                                : "${int.parse("${dashboardBarChartData["tabls"][index]}") * 100 / int.parse("${dashboardEmployeeInfo["TotalEmployee"]}")}",
                                                          ),
                                                presentheight:
                                                    dashboardBarChartData ==
                                                            null
                                                        ? 0
                                                        : double.parse(
                                                            dashboardBarChartData[
                                                                            "tpls"]
                                                                        [
                                                                        index] ==
                                                                    0
                                                                ? dashboardBarChartData[
                                                                        "tpls"]
                                                                    [index]
                                                                : "${int.parse("${dashboardBarChartData["tpls"][index]}") * 100 / int.parse("${dashboardEmployeeInfo["TotalEmployee"]}")}",
                                                          ),
                                                present_width: 10,
                                                Absent_width: 10,
                                                total_width: 21,
                                              )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    PASummary_select =
                                                        index + 1;
                                                    Provider.of<HomeProvider>(
                                                            context,
                                                            listen: false)
                                                        .dashboardPieChartDataProvider(
                                                            "${GetStorage().read("mobile_id")}",
                                                            "$PASummary_select-${DateFormat('MMM').format(DateTime.now())}-${DateFormat('yyyy').format(DateTime.now())}",
                                                            context);
                                                  });
                                                },
                                                child: Container(
                                                    height: 20,
                                                    width: 22,
                                                    decoration: BoxDecoration(
                                                        color: PASummary_select ==
                                                                index + 1
                                                            ? presentsent_color
                                                            : Main_Theme_textColor
                                                                .withOpacity(
                                                                    0.05),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                    alignment: Alignment.center,
                                                    child: CustomText(
                                                        fontSize: font10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        text: "${index + 1}",
                                                        letterSpacing: 0.2)),
                                              ),
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

                  ///---------------- Fourth Part ------Salary Comparison Chart-------------///
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white),
                    margin: EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      children: [
                        ///----------- Bar chat Header Part -------///
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ColorCustomText(
                            fontSize: font13header,
                            fontWeight: FontWeight.w500,
                            text: "Salary Comparison Chart  Jan-2023",
                            letterSpacing: 0.3,
                            textColor: Main_Theme_textColor.withOpacity(0.9),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              HomeThirdPartBodyLeftSide(
                                top1: total_Amount > 999999.0
                                    ? "${double.parse("${(total_Amount / 4 * 4) / 1000000}").toStringAsFixed(0)}M"
                                    : "${double.parse("${(total_Amount / 4 * 4) / 1000}").toStringAsFixed(0)}K",
                                top2: total_Amount > 999999.0
                                    ? "${double.parse("${(total_Amount / 4 * 3) / 1000000}").toStringAsFixed(0)}M"
                                    : "${double.parse("${(total_Amount / 4 * 3) / 1000}").toStringAsFixed(0)}K",
                                top3: total_Amount > 999999.0
                                    ? "${double.parse("${(total_Amount / 4 * 2) / 1000000}").toStringAsFixed(0)}M"
                                    : "${double.parse("${(total_Amount / 4 * 2) / 1000}").toStringAsFixed(0)}K",
                                top4: total_Amount > 999999.0
                                    ? "${double.parse("${(total_Amount / 4) / 1000000}").toStringAsFixed(0)}M"
                                    : "${double.parse("${(total_Amount / 4) / 1000}").toStringAsFixed(0)}K",
                                color: Main_Theme_textColor.withOpacity(0.6),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 200,
                                        //  width: 320,
                                        //  color: Colors.amber,
                                        child: SfCartesianChart(
                                            plotAreaBorderColor:
                                                Main_Theme_WhiteCollor,
                                            margin: EdgeInsets.only(
                                                left: 0, right: 0, bottom: 0),
                                            primaryXAxis: CategoryAxis(
                                              isVisible: false,
                                            ),
                                            primaryYAxis: NumericAxis(
                                              minimum: 0,
                                              maximum: total_Amount +
                                                  total_Amount / 4,
                                              interval: total_Amount / 5,
                                              isVisible: false,
                                            ),
                                            tooltipBehavior: _tooltip,
                                            series: <CartesianSeries<_ChartData,
                                                String>>[
                                              ColumnSeries<_ChartData, String>(
                                                width: 0.7,
                                                dataSource:
                                                    data == null ? [] : data,
                                                xValueMapper:
                                                    (_ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (_ChartData data, _) =>
                                                        data.y,
                                                color: Color(0xff4475a7),
                                              ),
                                              LineSeries<_ChartData, String>(
                                                  dataSource:
                                                      data == null ? [] : data,
                                                  width: 2.5,
                                                  enableTooltip: true,
                                                  initialIsVisible: true,
                                                  isVisibleInLegend: true,
                                                  markerSettings:
                                                      MarkerSettings(
                                                          isVisible: true,
                                                          width: 5.0,
                                                          height: 5.0,
                                                          color: Color(
                                                              0xff000080)),
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y1,
                                                  color: Color(0xff62c1e7))
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      height: 42,
                                      width: 400,
                                      padding:
                                          EdgeInsets.only(left: 4, bottom: 8),
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            dashboardSalaryComparisanChartList ==
                                                    null
                                                ? 0
                                                : dashboardSalaryComparisanChartList
                                                    .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 27,
                                            width: 19.5,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(right: 8),
                                            child: RotatedBox(
                                                quarterTurns: 1,
                                                child: ColorCustomText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: font11,
                                                  fontWeight: FontWeight.w400,
                                                  text:
                                                      "${dashboardSalaryComparisanChartList[index]["PayrollMonth"].split("-").elementAt(0)}",
                                                  letterSpacing: 0.2,
                                                  textColor:
                                                      Main_Theme_textColor
                                                          .withOpacity(0.6),
                                                )),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),

                  /// ------------------- Five Part Start here  birthday------------------------///
                  HomeFivePartBodyScetion(
                      todayselectionbirthdaylist:
                          "$dashboardtodaysBirthdayEmployeeinfo" == "null"
                              ? []
                              : dashboardtodaysBirthdayEmployeeinfo,
                      image: "Assets/DashBoardIcons/man_picture.png",
                      name: "Hafizur Rahaman",
                      designation: "Manager, HR, Admin ,",
                      email: "jibikaapps@gmail.com ",
                      phone: "01889173335"),

                  /// ------------------- Six Part Start here - Person on leave-----------------------///
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: apps_div_margin),
                    height: "$dashboardOnLeaveEmployeeData" == "null"
                        ? 35
                        : "$dashboardOnLeaveEmployeeData" == "[]"
                            ? 35
                            : 154,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, left: 8, right: 8),
                          child: Row(
                            children: [
                              ColorCustomText(
                                text: "$dashboardOnLeaveEmployeeData" == "null"
                                    ? "No "
                                    : "$dashboardOnLeaveEmployeeData" == "[]"
                                        ? "No "
                                        : "${dashboardOnLeaveEmployeeData.length} ",
                                fontSize: font13header,
                                fontWeight: FontWeight.w500,
                                textColor: absent_color,
                                letterSpacing: 0.3,
                              ),
                              ColorCustomText(
                                text: "Person on leave",
                                fontSize: font13header,
                                fontWeight: FontWeight.w500,
                                textColor:
                                    Main_Theme_textColor.withOpacity(0.9),
                                letterSpacing: 0.3,
                              ),
                              Spacer(),
                              Container(
                                height: 27,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ColorCustomText(
                                      text:
                                          "${DateFormat('E, ').format(DateTime.now())} ${selected4Datee}",
                                      textColor:
                                          Main_Theme_textColor.withOpacity(0.6),
                                      fontSize: font11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.3,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),

                                    /// ---------- Custom Calender Part --------- ///
                                    CustomCalender(
                                      onTap: () {
                                        _select4Date(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        "$dashboardOnLeaveEmployeeData" == "null"
                            ? Container()
                            : "$dashboardOnLeaveEmployeeData" == "[]"
                                ? Container()
                                : Container(
                                    height: 120,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: ListView.builder(
                                      itemCount:
                                          "$dashboardOnLeaveEmployeeData" ==
                                                  "null"
                                              ? 0
                                              : dashboardOnLeaveEmployeeData
                                                  .length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selected_indexnumber =
                                                  !selected_indexnumber;
                                            });

                                            if (selected_indexnumber == true) {
                                              setState(() {
                                                leave_selected_index = index;
                                              });
                                              Future.delayed(
                                                Duration(milliseconds: 200),
                                                () {
                                                  setState(() {
                                                    animated_leave = 95;
                                                  });
                                                },
                                              );

                                              Future.delayed(
                                                Duration(milliseconds: 500),
                                                () {
                                                  setState(() {
                                                    animated_height = 82;
                                                  });
                                                },
                                              );
                                            } else {
                                              Future.delayed(
                                                Duration(milliseconds: 500),
                                                () {
                                                  setState(() {
                                                    animated_leave = 0;
                                                  });
                                                },
                                              );

                                              Future.delayed(
                                                Duration(milliseconds: 200),
                                                () {
                                                  setState(() {
                                                    animated_height = 0;
                                                  });
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 115,
                                                    width: 85,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11),
                                                      //  color: Color(0xedecf1ec),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "${GetStorage().read("APPS_IMG_BASEURL")}${dashboardOnLeaveEmployeeData[index]["EmployeeImage"]}"),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                        )),
                                                        ColorCustomText(
                                                          text:
                                                              "${dashboardOnLeaveEmployeeData[index]["EmployeeCode"]}",
                                                          fontSize:
                                                              fontSubTitle,
                                                          textColor:
                                                              Main_Theme_textColor
                                                                  .withOpacity(
                                                                      0.6),
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          letterSpacing: 0.2,
                                                        )
                                                      ],
                                                    )),
                                                leave_selected_index == index
                                                    ? AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        height: 110,
                                                        width: animated_leave,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          11),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          11),
                                                                ),
                                                                color: Colors
                                                                    .white),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 22,
                                                              width:
                                                                  animated_leave,
                                                              color: Color(
                                                                      0xffACC027)
                                                                  .withOpacity(
                                                                      0.6),
                                                              child: CustomText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontSize:
                                                                      font13header,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  text:
                                                                      "${dashboardOnLeaveEmployeeData[index]["EmployeeName"]}",
                                                                  letterSpacing:
                                                                      0.1),
                                                            ),
                                                            AnimatedContainer(
                                                              duration:
                                                                  Duration(
                                                                milliseconds:
                                                                    300,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                ),
                                                                color: Color(
                                                                        0xffACC027)
                                                                    .withOpacity(
                                                                        0.3),
                                                              ),
                                                              height:
                                                                  animated_height,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          17,
                                                                      width:
                                                                          animated_leave,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          CustomText(
                                                                        fontSize:
                                                                            font13header,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        text:
                                                                            "${dashboardOnLeaveEmployeeData[index]["LeaveType"][0]}L - ${dashboardOnLeaveEmployeeData[index]["LeaveDays"]}",
                                                                        letterSpacing:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),

                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.only(left: 8.0,right: 8),
                                                                    //   child: Text("${dashboardOnLeaveEmployeeData[index]["LeaveDate"]}"),
                                                                    // ),
                                                                    Container(
                                                                      height:
                                                                          12,
                                                                      width:
                                                                          animated_leave,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          CustomText(
                                                                        fontSize:
                                                                            font11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        text:
                                                                            "${dashboardOnLeaveEmployeeData[index]["FromDate"]}",
                                                                        letterSpacing:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          20,
                                                                      width:
                                                                          animated_leave,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          CustomText(
                                                                        fontSize:
                                                                            font11,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        text:
                                                                            "     To",
                                                                        letterSpacing:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          20,
                                                                      width:
                                                                          animated_leave,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          CustomText(
                                                                        fontSize:
                                                                            font11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        text:
                                                                            "${dashboardOnLeaveEmployeeData[index]["ToDate"]}",
                                                                        letterSpacing:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                      ],
                    ),
                  ),

                  /// ------------------- Seven Part Start here ------------------------///
                  Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: apps_div_margin),
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/employee.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["TotalEmployee"]}",
                              body_text: "Total Active",
                              footer_text: "Employee",
                              color: Color(0xffE5B336),
                            ),
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/male.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["TotalMale"]}",
                              body_text: "Total Active",
                              footer_text: "Male",
                              color: Color(0xffCAAD18),
                            ),
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/femalee.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["TotalFemale"]}",
                              body_text: "Total Active",
                              footer_text: "Female",
                              color: Color(0xff26986B),
                            ),
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/join.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["ThisMonthJoin"]}",
                              body_text: "This Month",
                              footer_text: "Join",
                              color: Color(0xff427C65),
                            ),
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/inactive.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["ThisMonthInactive"]}",
                              body_text: "This Month",
                              footer_text: "InActive",
                              color: Color(0xff38745F),
                            ),
                            HomeSeventhPartBodySection(
                              image: "Assets/DashBoardIcons/conformation.png",
                              Head_text: "${dashboardEmployeeInfo}" == "null"
                                  ? "0"
                                  : "${dashboardEmployeeInfo["ThisMonthConfirmation"]}",
                              body_text: "This Month",
                              footer_text: "Confirmation",
                              color: Color(0xff064F42),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  int selected_index = 0;
  String selected2Datee =
      DateFormat('dd-MMMM-yyyy').format(DateTime.now()).toString();
  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat('dd-MMMM-yyyy');
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }

  int leave_selected_index = -1;
  bool selected_indexnumber = false;
  String selected3Datee =
      DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  Future<void> _select3Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected3Datee) {
      final df = new DateFormat('dd-MMM-yyyy');
      setState(() {
        selected3Datee = df.format(picked);
        Provider.of<HomeProvider>(context, listen: false)
            .dashboardPieChartDataProvider("${GetStorage().read("mobile_id")}",
                "$selected3Datee", context);
      });
    }
  }

  String selected4Datee =
      DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  Future<void> _select4Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected4Datee) {
      final df = new DateFormat('dd-MMM-yyyy');
      setState(() {
        selected4Datee = df.format(picked);
        Provider.of<HomeProvider>(context, listen: false)
            .dashboardOnleaveEmployeeListProvider(
                "${GetStorage().read("mobile_id")}",
                "$selected4Datee",
                context); //Person on leave
      });
    }
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}
