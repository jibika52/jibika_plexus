import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import '../../../CustomWidget/TermsAndCondition/terms_and_condition_part.dart';
import '../Auth/LoginScreen/login_screen_screen2.dart';
class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  Widget build(BuildContext context) {
    double c_h = MediaQuery.of(context).size.height;
    double c_w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          //  color: Main_3Theme_SplashScreenColor,
          color: Main_Theme_WhiteCollor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 69,),
                SizedBox(
                  height: c_h * 0.084,
                ),
                CustomImageSction(
                    height: 98,
                    width: 100,
                    radius: 11,
                    image: "Assets/Logo/jibikalogo.png"),
                SizedBox(
                  height: c_h * 0.025,
                ),
                // SizedBox(height: 20,),
                CustomText(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    text: "Auto Attendance Process",
                    letterSpacing: 0.1),
                SizedBox(
                  height: c_h * 0.025,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 400,
                      width: 500,
                      child: Container(
                          height: 400,
                          width: 500,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "Assets/SplashImage/splash_splash_sahdo.jpeg"),
                                  fit: BoxFit.fill)),
                          padding: EdgeInsets.all(60),
                          child: Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Image.asset(
                              "Assets/Gif/third_splashcsreen.gif",
                              height: 240,
                              width: 278,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          width: 369,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: CustomText(
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              text:
                                  "Mobile apps for small enterprises, web applications & mobile apps for large enterprises.",
                              letterSpacing: 0.2)),
                    ),
                  ],
                ),

                SizedBox(
                  height: 13,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    alignment: Alignment.center,
                    child: CustomSplashMenue(
                        image1: "Assets/circle_count1.png",
                        text1: "Location Tracking",
                        image2: "Assets/circle_count2.png",
                        text2: "Tracking Notification")),
                SizedBox(
                  height: 13,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    alignment: Alignment.center,
                    child: CustomSplashMenue(
                        image1: "Assets/circle_count3.png",
                        text1: "GEO Fence",
                        image2: "Assets/circle_count4.png",
                        text2: "Conveyance Tracking")),

                SizedBox(
                  height: c_h * 0.075,
                ),
                Container(
                  height: 32,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Align(
                    alignment: Alignment.center,
                    child:    Container(height: 20,width: 25,child: Image.asset("Assets/Gif/480px-Orange_animated_left_arrow.gif",fit: BoxFit.fill,),),
                  ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomImageSction(
                          height: 12,
                          width: 10,
                          radius: 1,
                          image: "Assets/Icons/count2.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 110,
                        child: CustomButton(
                            onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenSlide(),));
                            },
                            text: "Get Started",
                            button_text_fontSize: 13,
                            fontWeight: FontWeight.w500,
                            button_height: 55,
                            custom_button_collor: th3_CustomButtonColor,
                            button_text_color: CustomButtonColor,
                            borderRadius: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: c_h * 0.035,
                ),

                CustomTermsAndConditionPart(),
                SizedBox(
                  height: c_h * 0.035,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
