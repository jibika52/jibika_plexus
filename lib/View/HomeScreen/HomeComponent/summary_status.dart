import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status_second_part.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';


class SecondhomePartScreen extends StatefulWidget {
  SecondhomePartScreen({Key? key,
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
      child:Row(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(11),
                              topLeft: Radius.circular(11),
                            ),
                            //    color: Colors.greenAccent
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 30),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: Main_Theme_textColor,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Main_Theme_WhiteCollor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ColorCustomText(
                                    text: "${widget.presentTExt}%",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing:1,
                                    textColor: presentsent_color,
                                  ),
                                  ColorCustomText(
                                    text: "Present",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3,
                                    textColor: Main_Theme_textColor.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 13,
                          // left: 23,
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 16.0,
                            percent: widget.total_holiday,
                            backgroundColor: Colors.grey.withOpacity(0),
                            progressColor: holiday_color,
                          ),
                        ),
                        Positioned(
                          top: 13,
                          //  left: 23,
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 16.0,
                            /// ------------------------- increase  holiday -----------------///
                            percent:widget.total_leave,
                            backgroundColor: Colors.grey.withOpacity(0),
                            progressColor: leave_color,
                          ),
                        ),
                        Positioned(
                          top: 13,
                          //   left: 23,
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 16.0,
                            percent:widget.total_absent,
                            backgroundColor: Colors.grey.withOpacity(0),
                            progressColor: absent_color,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: CircularPercentIndicator(
                            radius: 62.0,
                            lineWidth: 20.0,
                            percent: widget.total_present,
                            backgroundColor: Colors.grey.withOpacity(0),
                            progressColor: presentsent_color,
                          ),
                        ),


                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 7,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Active Manpower", textColor: Main_Theme_textColor.withOpacity(0.5),letterSpacing: 0.3),
                          SizedBox(width: 5,),
                          ColorCustomText(fontSize: 13, fontWeight: FontWeight.w600, text: "2555", letterSpacing: 0.3,textColor: absent_color),
                        ],
                      ))
                ],
              )

          ),
          ///Second part start
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(right: 10,top:5,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    color: Color(0xffFBFBFB).withOpacity(0.6),
                      //        color: Colors.redAccent,
                      border: Border.all(
                        width: 0.5,
                        style: BorderStyle.solid,
                        color: Main_Theme_textColor.withOpacity(0.2),
                      )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///---------- Calender---------------  ///
                      Container(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0,left: 10),
                              child: ColorCustomText(
                                text: "${selected2Datee}",
                                textColor: Main_Theme_textColor.withOpacity(0.6),
                                fontSize: 11,
                                fontWeight: FontWeight.w700, letterSpacing: 0.3,),
                            ),

                            /// ---------- Custom Calender Part --------- ///
                            CustomCalender(onTap: () {
                              _select2Date(context);
                            },),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Divider(
                        height: 3,
                        color: Main_Theme_textColor.withOpacity(0.2),
                        thickness: 0.5,
                      ),
                      SizedBox(height: 1,),
                      ///---------- Present---------------  ///
                      SummaryStatusSecondPart(CapitalTExt: "P", SmallTExt: "resent", value: "${widget.PersentCount}", backColor: Main_Theme_textColor.withOpacity(0.04), CapitaltextColor: presentsent_color,),
                      SizedBox(height: 1,),
                      ///---------- Absent---------------  ///
                      SummaryStatusSecondPart(CapitalTExt: "A", SmallTExt: "sent", value: "${widget.AbsentCount}", backColor: Main_Theme_WhiteCollor, CapitaltextColor: absent_color,),
                      SizedBox(height: 1,),
                      ///---------- Present---------------  ///
                      SummaryStatusSecondPart(CapitalTExt: "L", SmallTExt: "eave", value: "${widget.LeaveCount}", backColor: Main_Theme_textColor.withOpacity(0.04), CapitaltextColor: leave_color,),
                      SizedBox(height: 1,),
                      ///---------- Absent---------------  ///
                      SummaryStatusSecondPart(CapitalTExt: "H", SmallTExt: "olyday", value: "${widget.HolidayCount}", backColor: Main_Theme_WhiteCollor, CapitaltextColor: holiday_color,),
                      SizedBox(height: 1,),



                    ],
                  ))),

        ],
      ),
    );
  }

  int selected_index = 0;
  String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMEd();
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }
}

