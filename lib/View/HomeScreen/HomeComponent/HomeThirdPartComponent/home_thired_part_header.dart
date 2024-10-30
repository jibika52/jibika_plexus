import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import '../../../../Controller/HomeController/home_controller.dart';
import '../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';
import 'barchat_heder_part.dart';
import 'package:intl/intl.dart';

class HomeThiredPartHeader extends StatefulWidget {
  HomeThiredPartHeader(
      {super.key,
      required this.PayableMony,
      required this.DailyMony,
      required this.CumulativeMony});
  String PayableMony;
  String DailyMony;
  String CumulativeMony;
  @override
  State<HomeThiredPartHeader> createState() => _HomeThiredPartHeaderState();
}

class _HomeThiredPartHeaderState extends State<HomeThiredPartHeader> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: 68,
      width: double.infinity,
      child: Row(
        children: [
          BarchatHeaderPart(
            name: "Today",
            money: '${widget.PayableMony}',
            parpose: "Manpower",
          ),
          Container(
            height: 50,
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ),
          BarchatHeaderPart(
            name: "Today",
            money: '${widget.DailyMony}',
            parpose: "Salary",
          ),
          Container(
            height: 50,
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ),
          BarchatHeaderPart(
            name: "Cumulative",
            money: '${widget.CumulativeMony}',
            parpose: "Salary",
          ),
          Container(
            height: 50,
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ),
          SizedBox(
            width: 7,
          ),
          InkWell(
            onTap: () {
              _onPressed(context: context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    topLeft: Radius.circular(11)),
                //  color: Main_Theme_textColor_tir_Condition.withOpacity(0.1),
                //   color: Colors.red,
              ),
              padding: EdgeInsets.only(top: 2, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageSction(
                      height: 20,
                      width: 20,
                      radius: 3,
                      image: "Assets/DashBoardIcons/clender.png"),
                  SizedBox(
                    height: 2,
                  ),
                  ColorCustomText(
                    text: _selected_pick_month == null
                        ? "${DateFormat("MMM").format(DateTime.now())}"
                        : "${DateFormat('MMM').format(_selected_pick_month!)}",
                    fontSize: fontSubTitle,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    textColor: Main_Theme_textColor.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  ColorCustomText(
                    text: _selected_pick_month == null
                        ? "${DateFormat("yyyy").format(DateTime.now())}"
                        : "${DateFormat('yyyy').format(_selected_pick_month!)}",
                    fontSize: font11,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    textColor: Main_Theme_textColor.withOpacity(0.6),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  int selected_index = 0;

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
  double animatedheight = 0;
  double lineWidth = 7.0;
  double C_height = 5;
  bool _is_click_date = false;
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
    "Dec",
    "",
    "",
    ""
  ];
  invalidfunction() {}
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
