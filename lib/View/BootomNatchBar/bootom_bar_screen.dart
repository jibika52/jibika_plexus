
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import '../HomeScreen/home_screen.dart';
import 'BootomNavigationBarItemsScreen/BootomNavigationBarItemsTrackingScreen/bootombar_tracking_screen.dart';


class BootomNatchBarScreen extends StatefulWidget {
  const BootomNatchBarScreen({super.key});

  @override
  State<BootomNatchBarScreen> createState() => _BootomNatchBarScreenState();
}

class _BootomNatchBarScreenState extends State<BootomNatchBarScreen> {

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [
    HomeScreen(),
    Text(""),
    HomeScreen(),

    BootomNavigationBarItemsTrackingScreen(),



  ];
  final _key=GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () { return Future(() => false); },
      child: Scaffold(
        drawer:CustomLeftDrawer(),
        key: _key,
        appBar: PreferredSize(preferredSize: Size.fromHeight(100),
          /// ------------ Custom Main AppBAr -------------///
          child: CustomMainAppBar(
              leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png", center_appbar_text: "Jibika Plexus", leading_ontab: () {
            _key.currentState!.openDrawer();
          }, is_need_trailing: true),
        ),

      body: bottomBarPages[_currentIndex],

        extendBody: true,
        bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            color: CustomButtonColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=0;
                    });
                  },
                  child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png")),

              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=1;
                    });
                  },
                  child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_attendence.png")),
              Container(
                width: 35,
              ),

              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=2;
                    });
                  },
                  child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_payroll.png")),
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=3;
                    });
                  },
                  child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_tricker.png")),
            ],
          ),
        ),

        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: FloatingActionButton(
            isExtended: false,shape: CircleBorder(
            side: BorderSide(color: Main_Theme_WhiteCollor),
          ),
            foregroundColor: Main_Theme_WhiteCollor,
            backgroundColor: Main_Theme_WhiteCollor,
            onPressed: () {

            }, child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("Assets/Logo/leaff.png" ),
          ),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ),
    );
  }
}