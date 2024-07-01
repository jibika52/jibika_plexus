import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_pard_body_laft_side.dart';
import '../../../HomeScreen/HomeComponent/HomeThirdPartComponent/home_third_part_progressbar.dart';

class BootomNavigationBarItemsAttendenceScreen extends StatefulWidget {
  const BootomNavigationBarItemsAttendenceScreen({super.key});

  @override
  State<BootomNavigationBarItemsAttendenceScreen> createState() => _BootomNavigationBarItemsAttendenceScreenState();
}

class _BootomNavigationBarItemsAttendenceScreenState extends State<BootomNavigationBarItemsAttendenceScreen> {
  double animatedheight=0;
  double animatwidth=150;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  int selectedmonth=0;
  List MonthList=[
    "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
  ];
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
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
              height: 175,width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Main_Theme_WhiteCollor
              ),
              child:  Container(
                child: Row(
                  children: [
                    /// Home Third Part  Body Left Side
                    HomeThirdPartBodyLeftSide(top1: "100%", top2: "70%", top3: "30%", top4: "0%", color: Main_Theme_textColor.withOpacity(0.6),),
                    /// Home Third Part  Body Right Side
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.greenAccent.shade100.withOpacity(0.1),
                          child:  Container(
                              height: 90,
                              width: 500,
                              child:ListView.builder(
                                itemCount: 30,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return  Container(
                                      height: 90,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Column(
                                        children: [
                                          Expanded(child: ThirdPartProgressBar(  absenttheight: 30+double.parse("$index"), presentheight:70-double.parse("$index"), present_width: 10, Absent_width: 10, total_width: 21,)),
                                          SizedBox(height: 5,),
                                          Container(
                                              height: 20,
                                              width: 22,
                                              decoration: BoxDecoration(
                                                  color:DateTime.now().day==index? presentsent_color:Main_Theme_textColor.withOpacity(0.05),
                                                  borderRadius: BorderRadius.circular(2)
                                              ),
                                              alignment: Alignment.center,
                                              child: CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "${index+1}", letterSpacing: 0.2)
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      ));
                                },)
                          ),
                        )),
                  ],
                ),
              ),
            ),
            /// Second part Calender ----------------------
            Container (
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
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
                            width: 1.5
                        )
                    ),
                    padding: EdgeInsets.only(left: 7,right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/share2.png"),
                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/sms.png"),
                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/pdf.png"),

                        Container(
                          height: 20,
                          width: 1,
                          color: Main_Theme_textColor.withOpacity(0.3),
                        ),
                        Stack(
                          children: [
                            CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/DashBoardIcons/notification_attendence.png"),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor:absent_color,
                                child: ColorCustomText(fontSize: 7, fontWeight: FontWeight.w400, text: "22", letterSpacing: 0.1, textColor: Main_Theme_WhiteCollor),
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
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 32,
                        width: animatwidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Main_Theme_WhiteCollor,
                            border: Border.all(
                                color: Main_Theme_textColor.withOpacity(0.7),
                                width: 1
                            )
                        ),
                        padding: EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _is_click_date=!_is_click_date;
                              if(_is_click_date==true){
                                if(w>530){
                                  animatwidth=530;
                                }else{
                                  animatwidth=w*0.90;
                                }

                              }else{
                                animatwidth=100.0;
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _is_click_date==false?  ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "${monthList[selectedmonth]}", letterSpacing: 0.3,
                                  textColor: CustomButtonColor) :
                              Expanded(child: ListView.builder(
                                itemCount: MonthList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedmonth=index;
                                        _is_click_date=!_is_click_date;
                                        if(_is_click_date==true){
                                          animatwidth=w*0.95;
                                        }else{
                                          animatwidth=100.0;
                                        }
                                      },);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0,left: 5,top: 0),
                                      child: Text("${MonthList[index]}"),
                                    ),
                                  ) ;
                                },)),
                              Container(
                                height: 12,
                                width: 1,
                                color: Main_Theme_textColor,
                                margin: EdgeInsets.only(left: 5,right: 7),
                              ),
                              Container(
                                height: 42,
                                width: 60,
                              //  color: Colors.red,
                                child: DropdownButton(
                                  isExpanded: true,
isDense: false,
                                  enableFeedback: false,
                                  autofocus: false,
                                  hint: InkWell(
                                      onTap: () {},
                                      child: ColorCustomText(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          text: "${DateTime.now().year}",
                                          letterSpacing: 0.2,
                                          textColor:
                                          Main_Theme_textColor.withOpacity(0.4))),

                                  // Not necessary for Option 1

                                  value: busnessid,
                                  onChanged: (newValue) {
                                    setState(() {
                                      busnessid = newValue.toString();
                                    });
                                  },
                                  items: busnessidlist.map((location) {
                                    return DropdownMenuItem(
                                      child: CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "${location ?? ""}", letterSpacing: 0.2),
                                      value: "${location}",
                                    );
                                  }).toList(),
                                ),
                              ),
                           //   ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "2023", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            /// Third part-----------------------

            Expanded(child: Container(
              color:Main_Theme_WhiteCollor,
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
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
                    margin: EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                         //   color: Colo
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                top: 22,
                                // left: 23,
                                child: CircularPercentIndicator(
                                  radius: 21.0,
                                  lineWidth: 1.5,
                                  percent: 0.99999,
                                  backgroundColor: Colors.grey.withOpacity(0),
                                  progressColor: Main_Theme_textColor.withOpacity(0.7),
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                     ColorCustomText(fontSize: 15, fontWeight: FontWeight.w500, text: "01", letterSpacing: 0.1, textColor: Main_Theme_textColor),
                                     ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Sat", letterSpacing: 0.1, textColor: Main_Theme_textColor),
                                    ],
                                  ),

                                ),
                              ),
                              Positioned(
                                top: 13,
                                // left: 23,
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: lineWidth,
                                  percent: 0.99999,
                                  backgroundColor: Colors.grey.withOpacity(0),
                                  progressColor: presentsent_color,
                                ),
                              ),
                              Positioned(
                                top: 13,
                                //  left: 23,
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: lineWidth,
                                  /// ------------------------- increase  holiday -----------------///
                                  percent:0.30,
                                  backgroundColor: Colors.grey.withOpacity(0),
                                  progressColor: absent_color,
                                ),
                              ),
                              Positioned(
                                top: 13,
                                //   left: 23,
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: lineWidth,
                                  percent:0.20,
                                  backgroundColor: Colors.grey.withOpacity(0),
                                  progressColor: leave_color,
                                ),
                              ),
                              Positioned(
                                top: 13,
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: lineWidth,
                                  percent: 0.20,
                                  backgroundColor: Colors.grey.withOpacity(0),
                                  progressColor: holiday_color,
                                ),
                              ),


                            ],
                          ),
                        ),),
                          Container(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "8080", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.9)),
                              SizedBox(height: C_height,),
                              ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "Active", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.9)),



                            ],
                          ),
                        ),
                        SizedBox(width:20,),
                        Expanded(
                            flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "Present : ", letterSpacing: 0.3, textColor: presentsent_color),
                                   // SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "8989", letterSpacing: 0.3, textColor: presentsent_color),
                                  ],
                                ),
                                SizedBox(height: C_height,),
                                Row(
                                  children: [
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "Absent : ", letterSpacing: 0.3, textColor: absent_color.withOpacity(0.9)),
                                  //  SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "8989", letterSpacing: 0.3, textColor: absent_color.withOpacity(0.9)),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "Leave : ", letterSpacing: 0.3, textColor: leave_color.withOpacity(0.9)),
                                  //  SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "2020", letterSpacing: 0.3, textColor: leave_color.withOpacity(0.9)),
                                  ],
                                ),
                                SizedBox(height: C_height,),
                                Row(
                                  children: [
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400,  text: "Holiday : ", letterSpacing: 0.3, textColor: holiday_color),
                                 //   SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "8989", letterSpacing: 0.3, textColor: holiday_color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),),
            ))

          ],
        ),
      ),
    );
  }
  String? busnessid;
  List busnessidlist = ["2000", "2001", "2002","2003","2004", "2005", "2006","2007","2008", "2009", "2010","2011"];

}
