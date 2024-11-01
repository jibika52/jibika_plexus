import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../CustomWidget/TermsAndCondition/terms_and_condition_part.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
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
          color: Main_Theme_WhiteCollor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 69,),
                SizedBox(
                  height: c_h < 700 ? c_h * 0.044 : c_h * 0.084,
                ),
                CustomImageSction(
                    height: c_h < 700 ? 73 : 98,
                    width: c_h < 700 ? 75 : 100,
                    radius: 11,
                    image: "Assets/Logo/jibikalogo.png"),
                SizedBox(
                  height: c_h * 0.025,
                ),
                // SizedBox(height: 20,),
                CustomText(
                    fontSize: fontTitle,
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
                      // height: 500,
                      // width: 500,
                      //     padding: EdgeInsets.only(right: 10), //  Edit for pixel perfect
                      height: c_h * 0.54, //  Edit for pixel perfect
                      width: c_w * 1, //  Edit for pixel perfect
                      alignment: Alignment.center,
                    ),
                    Positioned(
                        left: -10,
                        child: Image.asset(
                          "Assets/Gif/second_splashcsreen.gif",
                          // "Assets/Gif/first_splashcsreen.gif",
                          // height: 300,
                          // width: double.infinity,

                          height: c_h * 0.30, //  Edit for pixel perfect
                          width: c_w * 1, //  Edit for pixel perfect

                          fit: BoxFit.fill,
                        )),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              alignment: Alignment.center,
                              child: CustomSplashMenue(
                                  image1: "Assets/circle_count1.png",
                                  text1: "Auto Data Pulling",
                                  image2: "Assets/circle_count2.png",
                                  text2: "Auto Roster")),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              alignment: Alignment.center,
                              child: CustomSplashMenue(
                                  image1: "Assets/circle_count3.png",
                                  text1: "Auto Process",
                                  image2: "Assets/circle_count4.png",
                                  text2: "Auto Shift Change")),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                              children: [
                                CustomImageSction(
                                    height: 55,
                                    width: 80,
                                    radius: 7,
                                    image: "Assets/Icons/fingerprint.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                    fontSize: font12,
                                    fontWeight: FontWeight.w300,
                                    text: "Device",
                                    letterSpacing: 0.1)
                              ],
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Column(
                              children: [
                                CustomImageSction(
                                    height: 55,
                                    width: 80,
                                    radius: 7,
                                    image: "Assets/Icons/mobileselfe.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                    fontSize: font12,
                                    fontWeight: FontWeight.w300,
                                    text: "Mobile Selfie",
                                    letterSpacing: 0.1)
                              ],
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Column(
                              children: [
                                CustomImageSction(
                                    height: 55,
                                    width: 80,
                                    radius: 7,
                                    image: "Assets/Icons/wificonnect.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                    fontSize: font12,
                                    fontWeight: FontWeight.w300,
                                    text: "Wifi Connect",
                                    letterSpacing: 0.1)
                              ],
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Column(
                              children: [
                                CustomImageSction(
                                    height: 55,
                                    width: 80,
                                    radius: 7,
                                    image: "Assets/Icons/gprstrackng.png"),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                    fontSize: font12,
                                    fontWeight: FontWeight.w300,
                                    text: "GPS Track",
                                    letterSpacing: 0.1)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: c_h * 0.035,
                ),
                // Container(
                //   height: 30,
                //   width: double.infinity,
                //   alignment: Alignment.center,
                //   // child: Padding(
                //   //   padding: const EdgeInsets.only(left: 20.0, right: 30),
                //   //   child: Center(
                //   //       child: CustomImageSction(
                //   //           height: 25,
                //   //           width: double.infinity,
                //   //           radius: 1,
                //   //           image:
                //   //               "Assets/buttonIcon/second_direction_splash_button.png")),
                //   // )
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => SplashScreen1(),
                //                 ));
                //           },
                //           child: CustomImageSction(
                //               height: 27,
                //               width: 22,
                //               radius: 1,
                //               image: "Assets/Icons/arrowleft.png")),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       CustomImageSction(
                //           height: 12,
                //           width: 10,
                //           radius: 1,
                //           image: "Assets/Icons/count2.png"),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => SplashScreen3(),
                //                 ));
                //           },
                //           child: CustomImageSction(
                //               height: 27,
                //               width: 22,
                //               radius: 1,
                //               image: "Assets/Icons/arrowright.png")),
                //     ],
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 20,
                    width: 25,
                    child: Image.asset(
                      "Assets/Gif/Orange_animated_right_arrow.gif",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: c_h * 0.042,
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
