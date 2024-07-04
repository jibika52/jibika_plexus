

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';

import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class BootomNavBarItemsMainFloationHomeScreen extends StatefulWidget {
  const BootomNavBarItemsMainFloationHomeScreen({super.key});

  @override
  State<BootomNavBarItemsMainFloationHomeScreen> createState() => _BootomNavBarItemsMainFloationHomeScreenState();
}

class _BootomNavBarItemsMainFloationHomeScreenState extends State<BootomNavBarItemsMainFloationHomeScreen> {
  double animatedheight=0;
  double animatwidth=117;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  bool _is_tear_date=false;
  int selectedmonth=0;

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomDefaultAppBar(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(),));
        }, text: "Employee"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container (
              height: 55,
              width: w,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 39,
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
                    top: 0.9,
                      right: 0,
                      bottom: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 50,
                        width: animatwidth,

                        padding: EdgeInsets.only(left: 7,right: 7),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: Container(
                                  height: 55,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color:Color.fromRGBO(245, 245, 245, 1),
                                     border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _is_click_date=!_is_click_date;
                                            if(_is_click_date==true){
                                              if(w>530){
                                                animatwidth=530;
                                              }else{
                                                animatwidth=w-13;
                                              }
                                            }else{
                                              animatwidth=117.0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10,right: 10
                                          ),
                                          height: 16,width: 16 ,
                                          child: CustomImageSction(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10
                                        ),
                                        height: 12,
                                        width: 2,
                                        color: Main_Theme_textColor.withOpacity(0.1),
                                      ),
                                      Expanded(
                                        child: Container(
                                            child: TextFormField(
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(bottom: 14),
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Main_Theme_textColor.withOpacity(0.30)
                                                  ),
                                                  hintText: "Search Here"
                                              ),
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                )),

                            Container(
                              height: 55,
                              width: 40,
                              margin: EdgeInsets.only(
                                  left: 10,right: 0
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical:2.95
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color:Color.fromRGBO(245, 245, 245, 1),
                                  border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                              ),
                              child: CustomImageSction(height: 17, width: 15, radius: 1, image: "Assets/DrawerImage/search_filter.png"),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.deepOrangeAccent,))
          ],
        ),
      )
    );
  }
}
