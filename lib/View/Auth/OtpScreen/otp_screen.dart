import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
         body: Container(
           height: double.infinity,
           width: double.infinity,
           color: Colors.white,
           child: Column(
             children: [
               SizedBox(height: h*0.1,),
               /// Added Logo
               CustomImageSction(height: 100, width: 140, radius: 7, image: "Assets/Logo/jibikalogo.png"),
               SizedBox(height: h*0.1,),
               CustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "Please Enter The 4 Digit Code Sent to", letterSpacing: 0.3),
               CustomText(fontSize: 18, fontWeight: FontWeight.w700, text: "yourmail@gmail.com", letterSpacing: 0.4)

             ],
           ),
         ),
      /// Bootom Part
      bottomNavigationBar: CustomBootomSplashBar(),
    );
  }
}
