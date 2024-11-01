import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'package:jibika_plexus/View/ChoosePackageScreen/choose_package_screen.dart';
import '../../../Utils/constants.dart';
import 'login_screen.dart';

class LoginScreenSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenSlideState();
}

class LoginScreenSlideState extends State<LoginScreenSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController logoanimathion;
  late Animation<Offset> position;
  late Animation position2;
  late Animation logosize;
  late Animation logoanimation;
  late Animation logoanimation_text;
  late Animation info_text;

  @override
  void initState() {
    GetStorage().write("val", "false");
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    position2 = Tween(begin: -110.0, end: 0.0)
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
      //    print("cccccccccccccccccccc ${logoanimation.value}");

      setState(() {
        //     print("DDDDDDDDDDDDDDDD  ${logosize.value}");
      });
    });
  }

  bool is_iconClick = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => Future(() => false),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Main_Theme_WhiteCollor,
            body: Container(
              decoration: BoxDecoration(
                  //  image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginbackground.jpg"),fit:BoxFit.fill)
                  //  image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/customizebackground.png"),fit:BoxFit.fill)
                  //  image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/customizebackground.png"),fit:BoxFit.fill)
                  ),
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  SlideTransition(
                    position: position,
                    child: LoginScreen(),
                  ),

                  Positioned(
                      top: d_height > 700
                          ? logoanimation.value - 15
                          : logoanimation.value - 60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'Assets/Logo/jibikalogo.png',
                          height: d_height > 700
                              ? logosize.value
                              : logosize.value - 40,
                          width: d_height > 700
                              ? logosize.value
                              : logosize.value - 40,
                        ),
                      )),
                  Positioned(
                      bottom: position2.value,
                      child: Stack(
                        children: [
                          Container(
                            //   height: 110,
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("Assets/Gif/leafmove.gif"),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                              // bottom: logoanimation.value-20.0,
                              top: -6,
                              left: 0,
                              right: 0,
                              child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChoosePackageScreen(),
                                            ));
                                      },
                                      child: ColorCustomText(
                                        fontSize: font15,
                                        fontWeight: FontWeight.w500,
                                        text: "Register as a Company",
                                        letterSpacing: 0.2,
                                        textColor: CustomButtonColor,
                                      )))),
                        ],
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
                  //                     fontWeight: FontWeight.w400,fontSize: font17,
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
                  //                     }, text: "Info", button_text_fontSize: font15, button_height: 35, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                  //                   ),
                  //                   SizedBox(width: 7,),
                  //                   Container(
                  //                     width: 120,
                  //                     child: CustomButton(onTap: () {
                  //
                  //                     }, text: "Contact Us", button_text_fontSize: font15, button_height: 35, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
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
                  //               child: CircleAvatar(radius: 18,backgroundColor: CustomButtonColor,backgroundImage: AssetImage("Assets/Icons/i_icon.png"),))
                  //         ],
                  //       ),
                  //     ),)
                ],
              ),
            ),

            /// Splash Bootom Bar
            bottomNavigationBar: CustomBootomSplashBar()),
      ),
    );
  }
}
