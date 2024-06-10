import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status_second_part.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';


class SecondhomePartScreen extends StatefulWidget {
  const SecondhomePartScreen({Key? key}) : super(key: key);

  @override
  State<SecondhomePartScreen> createState() => _SecondhomePartScreenState();
}

class _SecondhomePartScreenState extends State<SecondhomePartScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 182,
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
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor:Main_Theme_WhiteCollor,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Main_Theme_WhiteCollor,
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Main_Theme_textColor,
                                    child: CircleAvatar(
                                      radius: 43,
                                      backgroundColor: Main_Theme_WhiteCollor,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ColorCustomText(
                                            text: "93%",
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing:1,
                                            textColor: presentsent_color,
                                          ),
                                          ColorCustomText(
                                            text: "Present",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3,
                                            textColor: Main_Theme_textColor.withOpacity(0.7),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 13,
                              // left: 23,
                              child: CircularPercentIndicator(
                                radius: 67.0,
                                lineWidth: 16.0,
                                percent: total_holiday,
                                backgroundColor: Colors.grey.withOpacity(0),
                                progressColor: holiday_color,
                              ),
                            ),
                            Positioned(
                              top: 13,
                              //  left: 23,
                              child: CircularPercentIndicator(
                                radius: 67.0,
                                lineWidth: 16.0,
                                /// ------------------------- increase  holiday -----------------///
                                percent:total_leave,
                                backgroundColor: Colors.grey.withOpacity(0),
                                progressColor: leave_color,
                              ),
                            ),
                            Positioned(
                              top: 13,
                              //   left: 23,
                              child: CircularPercentIndicator(
                                radius: 67.0,
                                lineWidth: 16.0,
                                percent:total_absent,
                                backgroundColor: Colors.grey.withOpacity(0),
                                progressColor: absent_color,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 20.0,
                                percent: total_present,
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
                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w600, text: "2555", letterSpacing: 0.3,textColor: absent_color),
                            ],
                          ))
                    ],
                  )

              ),
              ///Second part start
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                       color: Color(0xffFBFBFB).withOpacity(0.6),
                          //   color: Colors.redAccent,
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: ColorCustomText(
                                    text: "${selected2Datee}",
                                    textColor: Main_Theme_textColor.withOpacity(0.6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700, letterSpacing: 0.3,),
                                ),
                                SizedBox(width: 7,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: CustomImageSction(height: 20, width: 20, radius: 2, image: "Assets/DashBoardIcons/clender.png"),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 3,
                            color: Main_Theme_textColor.withOpacity(0.2),
                            thickness: 0.5,
                          ),
                          SizedBox(height: 10,),
                          ///---------- Present---------------  ///
                          SummaryStatusSecondPart(CapitalTExt: "P", SmallTExt: "resent", value: "565", backColor: Main_Theme_textColor.withOpacity(0.04), CapitaltextColor: presentsent_color,),
                          SizedBox(height: 4,),
                          ///---------- Absent---------------  ///
                          SummaryStatusSecondPart(CapitalTExt: "A", SmallTExt: "sent", value: "565", backColor: Main_Theme_WhiteCollor, CapitaltextColor: absent_color,),
                          SizedBox(height: 4,),
                          ///---------- Present---------------  ///
                          SummaryStatusSecondPart(CapitalTExt: "L", SmallTExt: "eave", value: "565", backColor: Main_Theme_textColor.withOpacity(0.04), CapitaltextColor: leave_color,),
                          SizedBox(height: 4,),
                          ///---------- Absent---------------  ///
                          SummaryStatusSecondPart(CapitalTExt: "H", SmallTExt: "olyday", value: "565", backColor: Main_Theme_WhiteCollor, CapitaltextColor: holiday_color,),
                          SizedBox(height: 3,),



                        ],
                      ))),

            ],
          ),


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

