import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsPayrollScreen/PayrollPrecess/payroll_process.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../Controller/HomeController/home_controller.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_pard_body_laft_side.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_part_progressbar.dart';

class BootomNavigationBarItemsPayrollScreen extends StatefulWidget {
  const BootomNavigationBarItemsPayrollScreen({super.key});

  @override
  State<BootomNavigationBarItemsPayrollScreen> createState() =>
      _BootomNavigationBarItemsPayrollScreenState();
}

class _BootomNavigationBarItemsPayrollScreenState
    extends State<BootomNavigationBarItemsPayrollScreen> {
  double animatedheight = 0;
  double animatwidth = 130;
  double lineWidth = 7.0;
  double C_height = 5;
  bool _is_click_date = false;
  late List<_ChartData> data = [];
  late TooltipBehavior _tooltip;
  int selectedmonth = 0;
  List MonthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  double total_Amount = 20.0;
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
  @override
  void initState() {
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
    final dashboardSalaryComparisanChartList =
        Provider.of<HomeProvider>(context).dashboardSalaryComparisanChartList;
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

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: home_default_color,
      //   appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context), text: "Attendance Calendar ")),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                /// Second part Calender ----------------------
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      ///----------- Bar chat Header Part -------///
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ColorCustomText(
                              fontSize: font12header,
                              fontWeight: FontWeight.w500,
                              text: "Salary Comparison Chart",
                              letterSpacing: 0.3,
                              textColor: Main_Theme_textColor.withOpacity(0.9),
                            ),
                            InkWell(
                              onTap: () {
                                _onPressed(context: context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 1, bottom: 1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: Main_Theme_textColor.withOpacity(
                                            0.3))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ColorCustomText(
                                      fontSize: font12header,
                                      fontWeight: FontWeight.w500,
                                      text: _selected_pick_month == null
                                          ? "${DateFormat("MMM-yyyy").format(DateTime.now())}"
                                          : "${DateFormat("MMM-yyyy").format(_selected_pick_month!)}",
                                      letterSpacing: 0.3,
                                      textColor:
                                          Main_Theme_textColor.withOpacity(0.9),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    CustomCalender(
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
                                      width: 320,
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
                                            maximum:
                                                total_Amount + total_Amount / 4,
                                            interval: total_Amount / 5,
                                            isVisible: false,
                                          ),
                                          tooltipBehavior: _tooltip,
                                          series: <CartesianSeries<_ChartData,
                                              String>>[
                                            ColumnSeries<_ChartData, String>(
                                              width: 0.5,
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
                                            // LineSeries<_ChartData, String>(
                                            //     dataSource:  data,
                                            //     width: 2.5,
                                            //     // enableTooltip: true,
                                            //     // initialIsVisible: true,
                                            //     // isVisibleInLegend: true,
                                            //     // markerSettings: MarkerSettings(
                                            //     //     isVisible: true,
                                            //     //     width: 5.0,
                                            //     //     height: 5.0,
                                            //     //     color: Color(0xff000080)
                                            //     // ),
                                            //     xValueMapper: (_ChartData data, _) => data.x,
                                            //     yValueMapper: (_ChartData data, _) => data.y1,
                                            //     color: Color(0xff62c1e7))
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    height: 42,
                                    width: 400,
                                    padding:
                                        EdgeInsets.only(left: 7, bottom: 8),
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
                                          padding: EdgeInsets.only(right: 0),
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 10.5),
                                          child: RotatedBox(
                                              quarterTurns: 1,
                                              child: ColorCustomText(
                                                fontSize: font11,
                                                fontWeight: FontWeight.w400,
                                                text:
                                                    "${dashboardSalaryComparisanChartList[index]["PayrollMonth"].split("-").elementAt(0)}",
                                                letterSpacing: 0.2,
                                                textColor: Main_Theme_textColor
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

                /// Third part-----------------------

                Expanded(
                    child: Consumer<HomeProvider>(
                  builder: (context, value, child) => value
                              .dashboardSalaryComparisanChartList ==
                          null
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: CustomButtonColor,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:
                                value.dashboardSalaryComparisanChartList.length,
                            itemBuilder: (context, index) => Container(
                              height: 74,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Main_Theme_WhiteCollor,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: presentsent_color,
                                    width: 1.5,
                                  ))),
                              margin: EdgeInsets.only(bottom: 4),
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 54,
                                    width: 53,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color:
                                          presentsent_color.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Column(
                                      children: [
                                        ColorCustomText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            text:
                                                "${value.dashboardSalaryComparisanChartList[index]["PayrollMonth"].split("-").elementAt(0)}",
                                            letterSpacing: 0.2,
                                            textColor: presentsent_color),
                                        ColorCustomText(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            text: "${DateTime.now().year}",
                                            letterSpacing: 0.2,
                                            textColor: Main_Theme_textColor),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ColorCustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${value.dashboardSalaryComparisanChartList[index]["TotalEmp"]}",
                                          letterSpacing: 0.2,
                                          textColor: Main_Theme_textColor),
                                      ColorCustomText(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          text: "Total Employee",
                                          letterSpacing: 0.2,
                                          textColor:
                                              Main_Theme_textColor.withOpacity(
                                                  0.5)),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 35,
                                    width: 2,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Main_Theme_textColor.withOpacity(
                                            0.1)),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ColorCustomText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${value.dashboardSalaryComparisanChartList[index]["TotalNetPay"]}",
                                          letterSpacing: 0.2,
                                          textColor: Main_Theme_textColor),
                                      ColorCustomText(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          text: "Net P. Amount",
                                          letterSpacing: 0.2,
                                          textColor:
                                              Main_Theme_textColor.withOpacity(
                                                  0.5)),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 22,
                                    color: Main_Theme_textColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ))
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 15,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PAyrollProcessScreen(),
                  )),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: CustomButtonColor,
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Main_Theme_WhiteCollor.withOpacity(0.95),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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
