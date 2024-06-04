
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/View/LoginScreen/login_screen.dart';
import 'package:marquee/marquee.dart';

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
        AnimationController(vsync: this, duration: Duration(seconds: 2));
        position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Main_Theme_SplashScreenColor,
      body: Align(
        alignment: Alignment.topCenter,
         child: SlideTransition(
         position: position,
           child: LoginScreen(),
         ),
      ),
    );
  }
}
