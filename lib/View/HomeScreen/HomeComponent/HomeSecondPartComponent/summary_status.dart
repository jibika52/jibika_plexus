import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeSecondPartComponent/summary_status_second_part.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';

class SecondhomePartScreen extends StatefulWidget {
  SecondhomePartScreen({
    Key? key,
    required this.presentTExt,
    required this.PersentCount,
    required this.AbsentCount,
    required this.LeaveCount,
    required this.HolidayCount,
    required this.ManpowerCount,

    /// --------------- Create Radius --------------------///
    required this.total_present,
    required this.total_absent,
    required this.total_leave,
    required this.total_holiday,
    required this.date_onTap,
    required this.date_text,
    required this.manpower,
  }) : super(key: key);

  /// --------------- Create All TExt Value --------------------///
  String presentTExt;
  String PersentCount;
  String AbsentCount;
  String LeaveCount;
  String HolidayCount;
  String ManpowerCount;

  /// --------------- Create Radius --------------------///
  double total_present;
  double total_absent;
  double total_leave;
  double total_holiday;

  VoidCallback date_onTap;
  String date_text;
  String manpower;

  @override
  State<SecondhomePartScreen> createState() => _SecondhomePartScreenState();
}

class _SecondhomePartScreenState extends State<SecondhomePartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                height: 150,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      // left: 23,
                      child: CircularPercentIndicator(
                        reverse: true,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ColorCustomText(
                              text: "${widget.presentTExt}%",
                              fontSize: fontTitle,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              textColor: presentsent_color,
                            ),
                            ColorCustomText(
                              text: "Present",
                              fontSize: font12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                              textColor: Main_Theme_textColor.withOpacity(0.5),
                            ),
                          ],
                        ),
                        radius: 37.0,
                        lineWidth: 1.0,
                        startAngle: 50,
                        percent: widget.total_holiday,
                        backgroundColor: Main_Theme_textColor,
                        progressColor: Main_Theme_textColor,
                      ),
                    ),

                    /// holiday-------------------------------------
                    Positioned(
                      // left: 23,
                      child: CircularPercentIndicator(
                        reverse: true,
                        radius: 60.0,
                        lineWidth: 16.0,
                        startAngle: 50,
                        percent: widget.total_holiday,
                        backgroundColor: Colors.grey.withOpacity(0),
                        progressColor: holiday_color,
                      ),
                    ),

                    /// Leave ---------------------------------------
                    Positioned(
                      //  left: 23,
                      child: CircularPercentIndicator(
                        reverse: true,
                        radius: 60.0,
                        lineWidth: 16.0,
                        startAngle: 50,

                        /// ------------------------- increase  holiday -----------------///
                        percent: widget.total_leave,
                        backgroundColor: Colors.grey.withOpacity(0),
                        progressColor: leave_color,
                      ),
                    ),

                    ///absent---------------------------------------
                    Positioned(
                      //   left: 23,
                      child: CircularPercentIndicator(
                        reverse: true,
                        radius: 60.0,
                        lineWidth: 16.0,
                        percent: widget.total_absent,
                        startAngle: 50,
                        backgroundColor: Colors.grey.withOpacity(0),
                        progressColor: absent_color,
                      ),
                    ),

                    ///present ---------------------------------
                    Positioned(
                      child: CircularPercentIndicator(
                        reverse: true,
                        rotateLinearGradient: true,
                        startAngle: 50,
                        radius: 63.5,
                        lineWidth: 23.0,
                        percent: widget.total_present,
                        //   percent:  0.95 ,
                        backgroundColor: Colors.grey.withOpacity(0),
                        progressColor: presentsent_color,
                      ),
                    ),
                  ],
                ),
              ),

              /// manpower----------------------------
              Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ColorCustomText(
                          fontSize: font13header,
                          fontWeight: FontWeight.w400,
                          text: "Manpower",
                          textColor: Main_Theme_textColor.withOpacity(0.5),
                          letterSpacing: 0.3),
                      SizedBox(
                        width: 5,
                      ),
                      ColorCustomText(
                          fontSize: font12,
                          fontWeight: FontWeight.w700,
                          text: "${widget.manpower}",
                          letterSpacing: 0.3,
                          textColor: absent_color),
                    ],
                  ))
            ],
          )),

          ///Second part start
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      color: Color(0xffFBFBFB).withOpacity(0.6),
                      //        color: Colors.redAccent,
                      border: Border.all(
                        width: 0.5,
                        style: BorderStyle.solid,
                        color: Main_Theme_textColor.withOpacity(0.2),
                      )),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///---------- Calender---------------  ///
                      Container(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 1.0, left: 10),
                              child: ColorCustomText(
                                text: "${widget.date_text}",
                                textColor:
                                    Main_Theme_textColor.withOpacity(0.6),
                                fontSize: font11,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Spacer(),

                            /// ---------- Custom Calender Part --------- ///
                            CustomCalender(
                              onTap: widget.date_onTap,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 3,
                        color: Main_Theme_textColor.withOpacity(0.2),
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 1,
                      ),

                      ///---------- Present---------------  ///
                      SummaryStatusSecondPart(
                        CapitalTExt: "P",
                        SmallTExt: "resent",
                        value: "${widget.PersentCount}",
                        backColor: Main_Theme_textColor.withOpacity(0.04),
                        CapitaltextColor: presentsent_color,
                      ),
                      SizedBox(
                        height: 1,
                      ),

                      ///---------- Absent---------------  ///
                      SummaryStatusSecondPart(
                        CapitalTExt: "A",
                        SmallTExt: "sent",
                        value: "${widget.AbsentCount}",
                        backColor: Main_Theme_WhiteCollor,
                        CapitaltextColor: absent_color,
                      ),
                      SizedBox(
                        height: 1,
                      ),

                      ///---------- Present---------------  ///
                      SummaryStatusSecondPart(
                        CapitalTExt: "L",
                        SmallTExt: "eave",
                        value: "${widget.LeaveCount}",
                        backColor: Main_Theme_textColor.withOpacity(0.04),
                        CapitaltextColor: leave_color,
                      ),
                      SizedBox(
                        height: 1,
                      ),

                      ///---------- Absent---------------  ///
                      SummaryStatusSecondPart(
                        CapitalTExt: "H",
                        SmallTExt: "olyday",
                        value: "${widget.HolidayCount}",
                        backColor: Main_Theme_WhiteCollor,
                        CapitaltextColor: holiday_color,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }

  int selected_index = 0;
  // String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();
}
