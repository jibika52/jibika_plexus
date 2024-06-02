import 'package:flutter/material.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:jibica_pleuxs/Model/CustomWidget/CustomText/custom_text.dart';
import 'package:jibica_pleuxs/Utils/constants.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    double c_h=MediaQuery.of(context).size.height;
    double c_w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Main_Theme_SplashScreenColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 69,),
            CustomImageSction(height: 98, width: 100, radius: 11, image: "Assets/Logo/jibikalogo.png"),

            SizedBox(height: 20,),
            CustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "Welcome to Jibika Plexus, HRM", letterSpacing: 0.1),

           Stack(
           children: [
             CustomImageSction(height: 340, width: 935, radius: 11, image: "Assets/Gif/112.gif"),
             Positioned(
               top:25, child: Container(
               padding: const EdgeInsets.only(left: 80.0,right: 64),
               alignment: Alignment.center,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomText(fontSize: 16, fontWeight: FontWeight.w400,textAlign: TextAlign.center, text: "Next Generation HR & Payroll", letterSpacing: 0.1),
                   CustomText(fontSize: 16, fontWeight: FontWeight.w400,textAlign: TextAlign.center, text: "Software On your hand", letterSpacing: 0.1),
                 ],
               ),
             ), ),

             Positioned(
               bottom:0,left: 0,right: 0, child: Container(
               padding: const EdgeInsets.only(left: 20.0,right: 20),
               alignment: Alignment.center,
               child: CustomSplashMenue(image1: "Assets/Frame 34613.png", text1: "Employee Profile", image2: "Assets/Frame 34613 (1).png", text2: "Notice & Notifications")
             ), ),
           ],
         ),
            SizedBox(height: 15,),
            Container(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                alignment: Alignment.center,
                child: CustomSplashMenue(image1: "Assets/Frame 34613 (2).png", text1: "Leave & Holiday", image2: "Assets/Frame 34613 (3).png", text2: "Incentive & Payroll")

            ),
            SizedBox(height: 15,),
            Container(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                alignment: Alignment.center,
                child: CustomSplashMenue(image1: "Assets/Frame 34613 (4).png", text1: "Performance Appraisal", image2: "Assets/Frame 34613 (5).png", text2: "Promotion & Increment")

            ),
            SizedBox(height: 15,),
            Container(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                alignment: Alignment.center,
                child: CustomSplashMenue(image1: "Assets/Frame 34613 (6).png", text1: "Allowance & Deduction", image2: "Assets/Frame 34613 (7).png", text2: "Loan & Arrear")
            ),
          ],
        ),
      ),
    );
  }
}
