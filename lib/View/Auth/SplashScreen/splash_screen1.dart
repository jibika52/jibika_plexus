import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/CustomWidget/TermsAndCondition/terms_and_condition_part.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/SplashScreen/splash_screen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    double c_h = MediaQuery.of(context).size.height;
    double c_w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Main_Theme_SplashScreenColor,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  text: "Welcome to Jibika Plexus, HRM",
                  letterSpacing: 0.1),
              SizedBox(
                height: c_h * 0.024,
              ),
              Stack(
                children: [
                  CustomImageSction(
                      height: 390,
                      width: 400,
                      radius: 11,
                      image: "Assets/Gif/first_splashcsreen.gif"),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 80.0, right: 64),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              text: "Next Generation HR & Payroll",
                              letterSpacing: 0.1),
                          CustomText(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              text: "Software On your hand",
                              letterSpacing: 0.1),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.only(left:15, right: 15),
                        alignment: Alignment.center,
                        child: CustomSplashMenue(
                            image1: "Assets/circle_count1.png",
                            text1: "Employee Profile",
                            image2: "Assets/circle_count1.png",
                            text2: "Notice & Notifications")),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "Assets/circle_count3.png",
                      text1: "Leave & Holiday",
                      image2: "Assets/circle_count4.png",
                      text2: "Incentive & Payroll")),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "Assets/circle_count5.png",
                      text1: "Performance Appraisal",
                      image2: "Assets/circle_count6.png",
                      text2: "Promotion & Increment")),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "Assets/circle_count7.png",
                      text1: "Allowance & Deduction",
                      image2: "Assets/circle_count8.png",
                      text2: "Loan & Arrear")),

              SizedBox(
                height: c_h * 0.035,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2(),));
                },
                child: Container(
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 30),
                      child: Center(
                          child: CustomImageSction(
                              height: 25,
                              width: 93,
                              radius: 1,
                              image:
                                  "Assets/Gif/first_direction_splash_button.png")),
                    )),
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
    );
  }
}