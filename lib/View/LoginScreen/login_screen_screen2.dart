
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/View/LoginScreen/login_screen.dart';
import 'package:marquee/marquee.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Utils/constants.dart';

class LoginScreenSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenSlideState();
}

class LoginScreenSlideState extends State<LoginScreenSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds:2000 ));
        position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Main_Theme_SplashScreenColor,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginbackground.jpg"),fit:BoxFit.fill)
          ),
          alignment: Alignment.topCenter,
           child: SlideTransition(
           position: position,
             child: LoginScreen(),
           ),
        ),
          /// Splash Bootom Bar
          bottomNavigationBar:  CustomBootomSplashBar()
      ),
    );
  }
}
