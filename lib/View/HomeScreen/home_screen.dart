import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_header_partt.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_third_pard_body_laft_side.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_third_part_progressbar.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_thired_part_header.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status.dart';
import 'package:intl/intl.dart';
import '../../CustomWidget/CustomText/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

    int total_Amount=100000000;
    String value = "K";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(100),
          /// ------------ Custom Main AppBAr -------------///
          child: CustomMainAppBar(leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png", center_appbar_text: "Jibika Plexus", leading_ontab: () {}, is_need_trailing: true),
        ),
      body: Container(
        color: home_default_color,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top :10, left: 10.0,right: 10),
                child: HomeHederPart(
                  permission_list: [],
                ),
              ),
              /// ------------- Second Part -------------///
              Container(
                margin: EdgeInsets.only(top: 5), height: 180, padding: const EdgeInsets.only(top :7, left: 11.0,right: 11),
                child:SecondhomePartScreen(
                    presentTExt: "93", PersentCount: "565", AbsentCount: "323", LeaveCount: "868", HolidayCount: "696", ManpowerCount: "255", total_present: 0.8, total_absent: 0.90, total_leave: 0.95, total_holiday: 1.0),
              ),
          
          
              ///---------------- Third Part --------------------///
              Container(
                height: 180,
                width: double.infinity,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white
                ),
                margin: EdgeInsets.symmetric(horizontal: 11,vertical: 15),
                child: Column(
                  children: [
                    ///----------- Bar chat Header Part -------///
                    HomeThiredPartHeader(
                      PayableMony: "150", DailyMony: "1500", CumulativeMony: "6966",
                    ),
                    Expanded(
                        child: Container(
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
                                  child:Scrollbar(
                                    child: ListView.builder(
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
                                    },),
                                  )
                                ),
                              )),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
          
              ///---------------- Fourth Part --------------------///
              Container(
                height: 180,
                width: double.infinity,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white
                ),
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    ///----------- Bar chat Header Part -------///
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "Salary Comparison Chart  Jan-2023", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.9),),
                    ),
                    Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              HomeThirdPartBodyLeftSide(
                                top1:total_Amount>10000? "1000M": "1000K",
                                top2: total_Amount>10000? "120M": "120K",
                                top3: total_Amount>10000? "60M": "600K",
                                top4: total_Amount>10000? "0M": "0K",
                                color:Main_Theme_textColor.withOpacity(0.6),
                              ),

                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.greenAccent.shade100.withOpacity(0.1),
                                child:  Container(
                                  height: 90,
                                  width: 500,
                                  child:Scrollbar(
                                    child: ListView.builder(
                                      itemCount: 12,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                      return  Container(
                                        height: 90,
                                          margin: EdgeInsets.only(right: 7),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  child: ThirdPartProgressBar( absenttheight:1, presentheight:index.isOdd? 50+double.parse("$index")+20  : 50+double.parse("$index")-20 , present_width: 15, Absent_width: 0.001, total_width: 21,)),
                                              SizedBox(height: 5,),
                                              Container(
                                                height: 27,
                                                width: 22,
                                                padding: EdgeInsets.only(right: 5),
                                                alignment: Alignment.center,
                                                child:RotatedBox(
                                                        quarterTurns: 1,
                                                        child: ColorCustomText(fontSize: font11, fontWeight: FontWeight.w400, text: "${monthList[index]}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.6),)
                                                        ),
                                              ),
                                              SizedBox(height: 10,),
                                            ],
                                          ));
                                    },),
                                  )
                                ),
                              )),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8.0),
                              //   child: HomeThirdPartBodyLeftSide(top1: "180K", top2: "165K", top3: "80K", top4: "60K", color: absent_color,
                              //   ),
                              // ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
          
              /// -----------------  Five Part -------------------///
             Container(
               height: 200,
               width: double.infinity,
               child: LineChart(
                 LineChartData(
                   minY: 0,
                   minX: 0,
                   maxX: 100,
                   maxY: 100,

                   lineBarsData: [
                     LineChartBarData(
                       spots: [
                         FlSpot(0, 10),
                         FlSpot(10, 70),
                         FlSpot(20, 20),
                         FlSpot(30, 50),
                         FlSpot(40, 30),
                         FlSpot(50, 50),
                         FlSpot(60, 40),
                         FlSpot(70, 70),
                         FlSpot(80, 10),
                         FlSpot(90, 50),
                         FlSpot(100, 10),
                       ], 
                       color: absent_color,
                       barWidth: 2
                     ),
                   ]

                 ),
               ),
             ),
              
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Color(0xffc7ded6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(text: "Today's Selection", fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.3,),
                    ),
                    Container(
                      height: 102,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 205,
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      top: -4,
                                      left: -4,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: 55,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9),
                                          color: Colors.red.shade300,
                                        ),

                                      ),),

                                    Positioned(child: Container(
                                      margin: EdgeInsets.all(10),
                                      width: 60,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9),
                                          image: DecorationImage(image: AssetImage(" "),fit: BoxFit.fill,)
                                      ),

                                    ),),
                                  ],
                                ),
                                Expanded(child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ColorCustomText(text: "Hafizur Rahaman", fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.9),)
                                      , Text(  "Dummy text of the printing  ", textAlign: TextAlign.justify ,maxLines: 4,style: GoogleFonts.poppins(
                                        fontSize: 12.2,fontWeight: FontWeight.w500,

                                      ),)
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ColorCustomText(text: "20 ", fontSize: 15, fontWeight: FontWeight.w600,textColor: Colors.red, letterSpacing: 0.3,),
                          ColorCustomText(text: "Person on leave", fontSize: 12, fontWeight: FontWeight.w600,textColor: Colors.grey, letterSpacing: 0.3,),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 100,
                              width: 80,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: Color(0xedecf1ec)
                              ),
                              child: Column(
                                children: [
                                  Expanded(child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(image: AssetImage(" "),fit: BoxFit.fill)
                                    ),
                                  )),
                                  ColorCustomText(text: "66799", fontSize: 14, textColor: Main_Theme_textColor.withOpacity(0.6),fontWeight: FontWeight.w800,letterSpacing: 0.2,)
                                ],
                              )
                          );
                        },),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 110,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          //  color: Colors.red,
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  image: DecorationImage(image: AssetImage("Assets/Icons/lock.png"),fit: BoxFit.fill)
                              ),
                            ),
                            SizedBox(height: 5,),
                            ColorCustomText(text: "455H", fontSize: 14, fontWeight: FontWeight.bold,letterSpacing: 0.2,textColor: Colors.white,  )
                            ,ColorCustomText(text: "Total Active", fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 0.2,textColor: Colors.white,)
                            ,ColorCustomText(text: "Employee", fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 0.2,textColor: Colors.white,)
                          ],
                        ),
                      );
                    },)
              ),
SizedBox(
  height: 50,
),

            ],
          ),
        )
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

 List monthList= [
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
 ];

}

