import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomTrackNowButton/custom_tracknow_button.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeConvinceTrackinScreen extends StatefulWidget {
  const EmployeeConvinceTrackinScreen({super.key});

  @override
  State<EmployeeConvinceTrackinScreen> createState() => _EmployeeConvinceTrackinScreenState();
}

class _EmployeeConvinceTrackinScreenState extends State<EmployeeConvinceTrackinScreen> {
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Convince")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part -----------------------------
            Stack(
              children: [
                CustomEmployeeProfile(
                  image: "Assets/DrawerImage/testperson.png", id: "89899898", name: "Abdur Rahaman", designation: "Software Engineer",
                    time: "30Y 6M", onTap1: () {

                    }, onTap2: () {

                    },
                onTap3: () {

                },
                  need_location: true,
                ),
                Positioned(
                    right: 15,
                    bottom: 8,
                    child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                        Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                        // Main_Theme_textColor_tir_Condition,
                      ]),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Main_Theme_WhiteCollor.withOpacity(0.7),
                      width: 1.5,
                    )
                  ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       Icon(Icons.location_on_outlined,size: 17,color: Main_Theme_WhiteCollor.withOpacity(0.7),),
                          //   Image.asset("Assets/DashBoardIcons/location.png",height: 18,width: 18,fit: BoxFit.fill,color: Main_Theme_WhiteCollor,),
                          ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Track Now", letterSpacing: 0.2,textColor: Main_Theme_WhiteCollor,),
                        ],
                      ),
                ))
              ],
            ),
            /// Second part -----------------------------

            InkWell(
              onTap: () {
                _select2Date(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                  ),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      right: 10
                  ),
                  //  child: Icon(Icons.calendar_month,size: 18,color: Main_Theme_textColor.withOpacity(0.4),)
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$selected2Datee", letterSpacing: 0.3),
                      SizedBox(width: 7,),
                      CustomImageSction(height: 30, width: 30, radius: 3, image: "Assets/DashBoardIcons/clender.png"),
                    ],
                  )
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                  color:  Main_Theme_WhiteCollor, 
                              ),
                              margin: EdgeInsets.only(
                              bottom: 7,
                          ),
                              padding: EdgeInsets.all( 10),
                              child: Column(
                                children: [
                                 Container(
                                   height: 52,
                                   width: double.infinity,
                                   color: Colors.white,

                                   child: Row(
                                     children: [
                                       Column(   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24,fit: BoxFit.fill,
                                               color: Main_Theme_textColor),
                                           SizedBox(height: 4,),
                                           ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Gulshan", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           SizedBox(height: 10,),
                                         ],
                                       ),
                                       Expanded(
                                         child: ListView.builder(
                                           scrollDirection: Axis.horizontal,
                                           physics: NeverScrollableScrollPhysics(),
                                           itemBuilder: (context, index) {
                                             return Container(
                                               margin: EdgeInsets.only(
                                                 top:14.5,
                                                 right: 2.5,
                                                 bottom: 36.8,
                                               ),
                                               width: 5,height:2,
                                               color:  Main_Theme_textColor_tir_Condition,
                                             );
                                           },),
                                       ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Image.asset("Assets/DashBoardIcons/convence.png",height: 27,width: 40,fit: BoxFit.fill,
                                               color: Main_Theme_textColor),
                                           ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "By Car", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           SizedBox(height: 10,),
                                         ],
                                       ),
                                       Expanded(
                                         child: ListView.builder(
                                           physics: NeverScrollableScrollPhysics(),
                                           scrollDirection: Axis.horizontal,
                                           itemBuilder: (context, index) {
                                             return Container(
                                               margin: EdgeInsets.only(
                                                 top:14.5,
                                                 left: 2.5,
                                                 bottom: 36.8,
                                               ),
                                               width: 5,height:2,
                                               color:  Main_Theme_textColor_tir_Condition,
                                             );
                                           },),
                                       ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24, fit: BoxFit.fill,
                                           color: Main_Theme_textColor),
                                           SizedBox(height: 4,),
                                          ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Gulshan", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           SizedBox(height: 10,),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),

                                  Divider(
                                    height: 3,
                                    color: Main_Theme_textColor.withOpacity(0.1),
                                  ),
                                  Container(
                                    height: 30,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "24-Apr-2023", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Total Amount : 48496", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Purpose: Meeting with Client.", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                  ),
                                ],)
                          );
                        },),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10
                      ),
                      color: Main_Theme_textColor_tir_Condition.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Total Conveyance", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                          ColorCustomText(fontSize: 14, fontWeight: FontWeight.w600, text: "505 BDT", letterSpacing: 0.2,
                              textColor: Main_Theme_textColor_tir_Condition),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
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
