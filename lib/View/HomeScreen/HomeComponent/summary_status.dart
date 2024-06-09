import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';


class SecondhomePartScreen extends StatefulWidget {
  const SecondhomePartScreen({Key? key}) : super(key: key);

  @override
  State<SecondhomePartScreen> createState() => _SecondhomePartScreenState();
}

class _SecondhomePartScreenState extends State<SecondhomePartScreen> {
  Color presentsent_color=Color(0xff88DB2E);
  Color absent_color=Color(0xffEC4F4F);
  Color leave_color=Color(0xffDAAF04);
  Color holiday_color=Color(0xff2C928C);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: double.infinity,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11),
                            topLeft: Radius.circular(11),
                          ),
//    color: Colors.greenAccent
                        ),
                        child: Center(
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
                      ),
                      Positioned(
                        top: 13,
                        // left: 23,
                        child: CircularPercentIndicator(
                          radius: 67.0,
                          lineWidth: 16.0,
                          percent: 1,
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
                          percent: 0.95,
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
                          percent: 0.88,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: absent_color,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        //    left: 20,
                        child: CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 20.0,
                          percent: 0.8,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: presentsent_color,
                        ),
                      ),
                    ],
                  )),

              ///Second part start
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(11),
                          bottomRight: Radius.circular(11),
                        ),
// color: Colors.grey
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///---------- Calender---------------  ///
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: ColorCustomText(
                                      text: "${selected2Datee}",
                                      textColor: Main_Theme_textColor.withOpacity(0.6),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700, letterSpacing: 0.3,),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _select2Date(context);
                                    },
                                    icon: Icon(
                                      Icons.calendar_month,
                                      size: 18,
                                    )),
                              ],
                            ),
                          ),
                          ///---------- Present---------------  ///
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Main_Theme_textColor.withOpacity(0.03),

                            ),
                            padding: EdgeInsets.only(
                              bottom: 9,left: 5
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        ColorCustomText(
                                          text: "P",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: presentsent_color,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: ColorCustomText(
                                            text: "resent",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.7,
                                            textColor: Main_Theme_textColor.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 1.8,
                                          color: Main_Theme_textColor.withOpacity(0.3),
                                        ),
                                        Spacer(),
                                        ColorCustomText(
                                          text: "155",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: presentsent_color,
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 3,),
                          ///---------- Absent---------------  ///
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                             // color: Main_Theme_textColor.withOpacity(0.03),

                            ),
                            padding: EdgeInsets.only(
                              bottom: 9,left: 5
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        ColorCustomText(
                                          text: "A",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: absent_color,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: ColorCustomText(
                                            text: "sent",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.7,
                                            textColor: Main_Theme_textColor.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 1.8,
                                          color: Main_Theme_textColor.withOpacity(0.3),
                                        ),
                                        Spacer(),
                                        ColorCustomText(
                                          text: "155",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: absent_color,
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 3,),
                          ///---------- Present---------------  ///
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Main_Theme_textColor.withOpacity(0.03),

                            ),
                            padding: EdgeInsets.only(
                              bottom: 9,left: 5
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        ColorCustomText(
                                          text: "L",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: leave_color,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: ColorCustomText(
                                            text: "resent",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.7,
                                            textColor: Main_Theme_textColor.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 1.8,
                                          color: Main_Theme_textColor.withOpacity(0.3),
                                        ),
                                        Spacer(),
                                        ColorCustomText(
                                          text: "155",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: leave_color,
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 3,),
                          ///---------- Absent---------------  ///
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                             // color: Main_Theme_textColor.withOpacity(0.03),

                            ),
                            padding: EdgeInsets.only(
                              bottom: 9,left: 5
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        ColorCustomText(
                                          text: "H",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: holiday_color,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: ColorCustomText(
                                            text: "resent",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.7,
                                            textColor: Main_Theme_textColor.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 1.8,
                                          color: Main_Theme_textColor.withOpacity(0.3),
                                        ),
                                        Spacer(),
                                        ColorCustomText(
                                          text: "155",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          textColor: holiday_color,
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),

                        ],
                      ))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                ColorCustomText(
                  text: "Active Manpower   ",
                  fontSize: 16,
                  textColor: Colors.grey,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
                ColorCustomText( 
                  text: "8883",
                  fontSize: 18,
                  textColor: Colors.red.shade300,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ],
            ),
          )
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

