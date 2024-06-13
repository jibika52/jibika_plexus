import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_five_part_body_section.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_header_partt.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_seven_part_body_section.dart';
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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{






  late AnimationController controller;

  late Animation logosize;





    final _key=GlobalKey<ScaffoldState>();
    int total_Amount=100000000;
    String value = "K";
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());

    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        drawer:CustomLeftDrawer(),
          key: _key,
          appBar: PreferredSize(preferredSize: Size.fromHeight(100),
            /// ------------ Custom Main AppBAr -------------///
            child: CustomMainAppBar(leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png", center_appbar_text: "Jibika Plexus", leading_ontab: () {
              _key.currentState!.openDrawer();
            }, is_need_trailing: true),
          ),
        body: Container(
          color: home_default_color,
          child:  SingleChildScrollView(
            child: Column(
              children: [
                /// ------------- First Part ---------------///
                Padding(
                  padding: const EdgeInsets.only(top :apps_div_margin-2, left: 10.0,right: 10),
                  child: HomeHederPart(
                    permission_list: [],
                  ),
                ),
                /// ------------- Second Part -------------///
                Container(
                 height: 180, padding: const EdgeInsets.only(top :7, left: 11.0,right: 11),
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
      
                  margin: EdgeInsets.symmetric(horizontal: 11,vertical: apps_div_margin),
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
      
                /// -----------------  Test Part -------------------///
               Container(
                 margin: EdgeInsets.only(left: 10,right: 10,top: apps_div_margin),
                 height: 200,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Main_Theme_WhiteCollor,
                   borderRadius: BorderRadius.circular(11),
                 ),
      
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
                /// ------------------- Five Part Start here ------------------------///
                SizedBox(height: apps_div_margin,),
                HomeFivePartBodyScetion(
                    image: "Assets/DashBoardIcons/man_picture.png",
                    name: "Hafizur Rahaman",
                    designation: "Manager, HR, Admin ,",
                    email: "jibikaapps@gmail.com ",
                    phone: "01889173335"
                ),
                /// ------------------- Six Part Start here ------------------------///
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: apps_div_margin),
                  height: 154,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 0,bottom: 0,left: 8,right: 8),
                        child: Row(
                          children: [
                            ColorCustomText(text: "20 ", fontSize: font12header, fontWeight: FontWeight.w500,textColor: absent_color, letterSpacing: 0.3,),
                            ColorCustomText(text: "Person on leave", fontSize: font12header, fontWeight: FontWeight.w500,textColor: Main_Theme_textColor.withOpacity(0.9), letterSpacing: 0.3,),
                            Spacer(),
                            Container(
                              height: 27,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ColorCustomText(
                                    text: "${selected2Datee}",
                                    textColor: Main_Theme_textColor.withOpacity(0.6),
                                    fontSize: font11,
                                    fontWeight: FontWeight.w700, letterSpacing: 0.3,),
                                  SizedBox(width: 15,),
                                  /// ---------- Custom Calender Part --------- ///
                                  CustomCalender(onTap: () {
                                    _select2Date(context);
                                  },),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 120,
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 8),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  leave_selected_index=index;

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 115,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(11),
                                          //  color: Color(0xedecf1ec),

                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  image: DecorationImage(image: AssetImage("Assets/DashBoardIcons/man_picture.png"),fit: BoxFit.fill)
                                              ),
                                            )),
                                            ColorCustomText(text: "66799", fontSize: 14, textColor: Main_Theme_textColor.withOpacity(0.6),fontWeight: FontWeight.w800,letterSpacing: 0.2,)
                                          ],
                                        )
                                    ),
                                    leave_selected_index==index? InkWell(
                                      onTap: () {
                                       setState(() {
                                         leave_selected_index=-1;
                                       });
                                      },
                                      child: Container(
                                          height: 110,
                                          width: logosize.value,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(11),
                                              bottomRight: Radius.circular(11),
                                            ),
                                            color: Color(0xffACC027).withOpacity(0.2),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 22,
                                                width: 95,
                                                color: Color(0xffACC027).withOpacity(0.6),
                                                child: CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "Abdur romel", letterSpacing: 0.1),
                                              ),
                                              SizedBox(height: 3,),
                                              Container(
                                                width: 95,
                                                alignment: Alignment.center,
                                                child: ColorCustomText(fontSize: font12header, fontWeight: FontWeight.bold, text: "Cl - 03", letterSpacing: 0.5,textColor: Main_Theme_textColor.withOpacity(0.9),),
                                              ),
                                              SizedBox(height: 3,),
                                              Container(
                                                width: 95,
                                                alignment: Alignment.center,
                                                child: ColorCustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "10 jul 2024", letterSpacing: 0.5,textColor: Main_Theme_textColor.withOpacity(0.9),),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 95,
                                                alignment: Alignment.center,
                                                child: ColorCustomText(fontSize: font11, fontWeight: FontWeight.w600, text: "To", letterSpacing: 0.5,textColor: Main_Theme_textColor.withOpacity(0.9),),
                                              ),
                                              Container(
                                                width: 95,
                                                alignment: Alignment.center,
                                                child: ColorCustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "10 jul 2024", letterSpacing: 0.5,textColor: Main_Theme_textColor.withOpacity(0.9),),
                                              ),
                                            ],
                                          )
                                      ),
                                    ):Container(),
                                  ],
                                ),
                              ),
                            );
                          },),
                      )
                    ],
                  ),
                ),
                /// ------------------- Seven Part Start here ------------------------///
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: apps_div_margin),
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/employee.png", Head_text: "455H", body_text: "Total Active", footer_text: "Employee", color: Color(0xffE5B336),),
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/male.png", Head_text: "455H", body_text: "Total Active", footer_text: "Male", color: Color(0xffCAAD18),),
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/femalee.png", Head_text: "455H", body_text: "Total Active", footer_text: "Female", color: Color(0xff26986B),),
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/join.png", Head_text: "455H", body_text: "This Month", footer_text: "Join", color: Color(0xff427C65),),
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/inactive.png", Head_text: "455H", body_text: "This Month", footer_text: "InActive", color: Color(0xff38745F),),
                          HomeSeventhPartBodySection(image: "Assets/DashBoardIcons/conformation.png", Head_text: "455H", body_text: "This Month", footer_text: "Confirmation", color: Color(0xff064F42),),
      
                        ],
                      ),
                    )
                ),
                SizedBox(height: 100,)
              ],
            ),
          )
        ),
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
int leave_selected_index=-1;
}

