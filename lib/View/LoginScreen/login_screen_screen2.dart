
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/View/LoginScreen/login_screen.dart';
import 'package:marquee/marquee.dart';

import '../../CustomWidget/CustomButton/custom_button.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Utils/constants.dart';

class LoginScreenSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenSlideState();
}

class LoginScreenSlideState extends State<LoginScreenSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController logoanimathion;
  late Animation<Offset> position;
  late Animation logosize;
  late Animation logoanimation;
  late Animation logoanimation_text;
  late Animation info_text;

  @override
  void initState() {
    GetStorage().write("val", "false");
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds:2000 ));
        position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

        logosize = Tween(begin: 0.0, end: 150.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));


       logoanimation_text = Tween(begin: 200.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

      info_text = Tween(begin: 600.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

       logoanimation = Tween(begin: 600.0, end: 120.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.forward();


     controller.addListener(() {
       print("cccccccccccccccccccc ${logoanimation.value}");

       setState(() {
         print("DDDDDDDDDDDDDDDD  ${logosize.value}");
       });
     });

  }
bool is_iconClick=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Main_Theme_WhiteCollor,
        body: Container(
          decoration: BoxDecoration(
            //  image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginbackground.jpg"),fit:BoxFit.fill)
              image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginpage1.jpg"),fit:BoxFit.fill)
          ),
          alignment: Alignment.topCenter,

           child: Stack(
             children: [
               SlideTransition(
               position: position,
                 child: LoginScreen(),
               ),

               Positioned(
                   top: logoanimation.value,
                   left: 0,
                   right: 0,
                   child: Center(
                     child: Image.asset(
                       'Assets/Logo/jibikalogo.png',
                       height: logosize.value,
                       width: logosize.value,
                     ),
                   )),

               // Positioned(
               //     top: 35,
               //     left: logoanimation_text.value,
               //     right: 0,
               //     child:  Container(
               //       margin: EdgeInsets.only(
               //         right: 10,
               //         left: 10,
               //       ),
               //       decoration: BoxDecoration(
               //         borderRadius: BorderRadius.all(
               //             Radius.circular(20)
               //         ),
               //         color:is_iconClick==false? Color(0xffE6E6E6):
               //         Main_Theme_WhiteCollor
               //         ,
               //       ),
               //
               //       width: double.infinity,
               //        height: 35,
               //       alignment: Alignment.center,
               //
               //       //    padding: EdgeInsets.only(top: 5),
               //       child: Row(
               //         children: [
               //           Expanded(
               //             child:is_iconClick==false? Padding(
               //               padding: const EdgeInsets.only(top:4.0),
               //               child: Marquee(
               //                 text: 'Revolutionize Your Workforce Management with Our Jibika payscale Mobile App',
               //                 style: GoogleFonts.poppins(
               //                     fontStyle: FontStyle.italic,
               //                     fontWeight: FontWeight.w400,fontSize: 17,
               //                     color: Main_Theme_textColor
               //                 ),
               //                 scrollAxis: Axis.horizontal,
               //                 crossAxisAlignment: CrossAxisAlignment.start,
               //                 blankSpace: 20.0,
               //                 velocity: 100.0,
               //                 pauseAfterRound: Duration(seconds: 1),
               //                 startPadding: 10.0,
               //                 accelerationDuration: Duration(seconds: 1),
               //                 accelerationCurve: Curves.linear,
               //                 decelerationDuration: Duration(milliseconds: 2),
               //                 decelerationCurve: Curves.easeOut,
               //               ),
               //             ) :
               //             Container(margin: EdgeInsets.symmetric(horizontal: 7),
               //               height: 35,
               //               width: double.infinity,
               //               child: Row(
               //                 mainAxisAlignment: MainAxisAlignment.end,
               //                 children: [
               //                   Container(
               //                     width: 100,
               //                     child: CustomButton(onTap: () {
               //
               //                     }, text: "Info", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtomColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
               //                   ),
               //                   SizedBox(width: 7,),
               //                   Container(
               //                     width: 120,
               //                     child: CustomButton(onTap: () {
               //
               //                     }, text: "Contact Us", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtomColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
               //                   )
               //
               //
               //                 ],
               //               ),
               //             )
               //             ,
               //           ),
               //           InkWell(
               //               onTap: () {
               //                 setState(() {
               //                   is_iconClick=!is_iconClick;
               //                 });
               //               },
               //               child: CircleAvatar(radius: 18,backgroundColor: CustomButtomColor,backgroundImage: AssetImage("Assets/Icons/i_icon.png"),))
               //         ],
               //       ),
               //     ),)
             ],
           ),
        ),
          /// Splash Bootom Bar
          bottomNavigationBar:  CustomBootomSplashBar()
      ),
    );
  }
}
