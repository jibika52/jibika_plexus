
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsTrackingScreen/EmployeeConvinceTrackinScreen/employee_convince_tracking_screen.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeTrackinScreen extends StatefulWidget {
  const EmployeeTrackinScreen({super.key});

  @override
  State<EmployeeTrackinScreen> createState() => _EmployeeTrackinScreenState();
}

class _EmployeeTrackinScreenState extends State<EmployeeTrackinScreen> {
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Uzzal Biswas")),
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
                  need_location: false,
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
            /// Second part -----------------------------


            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10
                      ),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Main_Theme_WhiteCollor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Check In -08:45:01", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                  Text( "Gulshan Circle 01, Road No. 11, Plot No 8",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: Main_Theme_textColor,
                                  ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                      color: Main_Theme_textColor_tir_Condition),
                                  CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
                                ],
                              ),
                              SizedBox(width: 7,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: home_default_color,
                            ),
                            padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                            child: Text( "I am Uzzal biswas from mitpur I am Uzzal biswas from mitpur I am Uzzal biswas from mitpur", style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.all( Radius.circular(7)),
                                //  color:  CustomButtonColor.withOpacity(0.05),
                                  color:  home_default_color
                              ),
                              child: Row(
                                children: [
                                  /// left part
                                  Container(
                                    height: 89,
                                    width: 50,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                left: 24.5,
                                                right: 24.5,
                                                bottom: 2,
                                              ),
                                              width: 2,height: 5,
                                              color: Main_Theme_textColor_tir_Condition,
                                            );
                                          },),
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Main_Theme_textColor_tir_Condition.withOpacity(0.7),
                                          child:Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            // child: Image.asset("Assets/DashBoardIcons/location.png",color: Main_Theme_WhiteCollor,),
                                           child: Icon(Icons.location_on_outlined,color: Main_Theme_WhiteCollor,size: 22,),
                                          )
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  left: 24.5,
                                                  right: 24.5,
                                                  bottom: 2,
                                                ),
                                                width: 2,height: 5,
                                                color:  Main_Theme_textColor_tir_Condition,
                                              );
                                            },),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// Right part
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 10
                                      ),

                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Main_Theme_WhiteCollor
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "09-11-00",
                                                    letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                                Text( "Gulshan Circle 01, Road No. 11, Plot No 8",style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.2,
                                                    color: Main_Theme_textColor
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              Image.asset("Assets/DashBoardIcons/map_view.png",height: 25,width: 25,fit: BoxFit.fill,color: Main_Theme_textColor_tir_Condition,),
                                              CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],)
                          );
                        },),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10
                      ),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Main_Theme_WhiteCollor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Check Out -08:45:01", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                  Text( "Gulshan Circle 01, Road No.",style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: Main_Theme_textColor
                                  ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                //  Image.asset("Assets/DashBoardIcons/map_view.png",height: 25,width: 25,fit: BoxFit.fill,color: Main_Theme_textColor_tir_Condition,),
                                  Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                    color: Main_Theme_textColor_tir_Condition),
                                  CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
                                ],
                              ),
                              SizedBox(width: 7,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: home_default_color,
                            ),
                            padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                            child: Text( "I am Uzzal biswas from mitpur I am Uzzal biswas from mitpur I am Uzzal biswas from mitpur", style: GoogleFonts.poppins(
                              fontSize: 11, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0,right: 100,top: 10,bottom: 10),
                      child: CustomButton(onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => EmployeeConvinceTrackinScreen(),));
                      }, text: "View convince", button_text_fontSize: 15, button_height: 40, custom_button_collor: CustomButtonColor.withOpacity(0.8), button_text_color: Main_Theme_WhiteCollor, borderRadius: 20),
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
