import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/CreateConvieyance/create_convieyance.dart';

import '../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';
class SelfBootomNavigationConvienceScreen extends StatefulWidget {
  const SelfBootomNavigationConvienceScreen({super.key});

  @override
  State<SelfBootomNavigationConvienceScreen> createState() => _SelfBootomNavigationConvienceScreenState();
}

class _SelfBootomNavigationConvienceScreenState extends State<SelfBootomNavigationConvienceScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// Second part -----------------------------
            // InkWell(
            //   onTap: () {
            //     _select2Date(context);
            //   },
            //   child: Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           color: Colors.white
            //       ),
            //       height: 40,
            //       width: double.infinity,
            //       alignment: Alignment.center,
            //       padding: EdgeInsets.only(
            //           right: 10
            //       ),
            //       //  child: Icon(Icons.calendar_month,size: 18,color: Main_Theme_textColor.withOpacity(0.4),)
            //       child:Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$selected2Datee", letterSpacing: 0.3),
            //           SizedBox(width: 7,),
            //           CustomImageSction(height: 30, width: 30, radius: 3, image: "Assets/DashBoardIcons/clender.png"),
            //         ],
            //       )
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:4,
                        itemBuilder: (context, index) =>   Container(
                          padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(
                            color: CustomAppbarColor.withOpacity(0.3),
                           borderRadius: BorderRadius.circular(11),
                          ),
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ColorCustomText(fontSize: 13,textColor: Main_Theme_textColor ,fontWeight: FontWeight.w600, text: "Tue 12-sep-2024", letterSpacing: 0.3),
                                      ColorCustomText(fontSize: 13,textColor: Main_Theme_textColor ,fontWeight: FontWeight.w600, text: "BDT : 58000", letterSpacing: 0.3),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 2,
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
                                                      // Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24,fit: BoxFit.fill,
                                                      //     color: Main_Theme_textColor),

                                                      Icon(Icons.location_on_outlined,size: 24,color: Main_Theme_textColor.withOpacity(0.7)),
                                                      SizedBox(height: 4,),
                                                      ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Gulshan", letterSpacing: 0.2,
                                                        textColor: Main_Theme_textColor.withOpacity(0.7),),
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
                                                      //  Image.asset("Assets/DashBoardIcons/convence.png",height: 27,width: 40,fit: BoxFit.fill,
                                                      Image.asset("Assets/SelfIcon/cng.png",height: 30,width: 40,fit: BoxFit.fill,
                                                          color: Main_Theme_textColor),
                                                      ColorCustomText(fontSize: 10, fontWeight: FontWeight.w500, text: "", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.7),),

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
                                                      // Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24, fit: BoxFit.fill,
                                                      //     color: Main_Theme_textColor),
                                                      Icon(Icons.location_on_outlined,size: 24,color: Main_Theme_textColor.withOpacity(0.7)),
                                                      SizedBox(height: 4,),
                                                      ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Gulshan", letterSpacing: 0.2,
                                                        textColor: Main_Theme_textColor.withOpacity(0.7),),
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
                                              height: 20,
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Distance : 07 KM", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                                  ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Total Amount : 48496", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Duration : 10H 30M", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                              width: double.infinity,
                                              child:
                                              ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Purpose: Meeting", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                            ),
                                          ],)
                                    );
                                  },),
                              ],
                            ),
                          ),
                        ), ),

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
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape:CircleBorder(),
        backgroundColor: CustomButtonColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateConveyanceScreen(

          ),));

      },child: Icon(Icons.add,size: 30,color: Main_Theme_WhiteCollor,),
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
