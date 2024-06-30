import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

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
  double animatwidth=100;
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
            Container (
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                color: leave_approval_button_color,
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
                            color: leave_approval_button_color,
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
                              ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "2023", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.green,
                  margin: EdgeInsets.only(bottom: 10),
                ),
              ),),
            ))

          ],
        ),
      ),
    );
  }
}
