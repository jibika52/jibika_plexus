import 'package:flutter/material.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomText/custom_text.dart';
import 'package:jibica_pleuxs/Utils/constants.dart';

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
                    height: 500,
                      width: 400,
                      alignment: Alignment.center,
                      child: Image.asset("Assets/Gif/second_splashcsreen.gif",height: 300,width: 400,fit: BoxFit.fill,)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            alignment: Alignment.center,
                            child: CustomSplashMenue(
                                image1: "Assets/circle_count1.png",
                                text1: "Auto Data Pulling",
                                image2: "Assets/circle_count2.png",
                                text2: "Auto Roster")),
                        SizedBox(height: 10,),
                        Container(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                      children: [
                    //     CustomImageSction(height: height, width: width, radius: radius, image: image)
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: c_h * 0.035,
              ),
              Container(
                  height: 30,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 30),
                    child: Center(
                        child: CustomImageSction(
                            height: 25,
                            width: double.infinity,
                            radius: 1,
                            image:
                                "Assets/buttonIcon/second_direction_splash_button.png")),
                  )),
              SizedBox(
                height: c_h * 0.035,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: CustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    text: "By proceeding further you are agreeing with our",
                    letterSpacing: 0.2),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorCustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    text: "Terms & Conditions",
                    letterSpacing: 0.2,
                    textColor: Main_Theme_textColor_tir_Condition,
                  ),
                  CustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    text: " and ",
                    letterSpacing: 0.2,
                  ),
                  ColorCustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    text: "Privacy Policy",
                    letterSpacing: 0.2,
                    textColor: Main_Theme_textColor_tir_Condition,
                  ),
                ],
              ),
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
