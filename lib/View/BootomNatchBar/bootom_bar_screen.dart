
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../HomeScreen/home_screen.dart';


class BootomNatchBarScreen extends StatefulWidget {
  const BootomNatchBarScreen({super.key});

  @override
  State<BootomNatchBarScreen> createState() => _BootomNatchBarScreenState();
}

class _BootomNatchBarScreenState extends State<BootomNatchBarScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:2);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [

    Text(""),
    Text(""),
    HomeScreen(),
    Text(""),
    Text(""),



  ];
final _scaffoldkey=GlobalKey<ScaffoldState>();

int Select_index=0;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () { return Future(() => false); },
      child: Scaffold(
        key: _scaffoldkey,
        drawer: Drawer(
          backgroundColor:  Colors.white,
          child: Column(
            children: [
              DrawerHeader(child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(image: AssetImage("asset/gprojukti.png"),fit: BoxFit.fill)
                ),
              ))
            ],
          ),
        ),

        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
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
           CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png"),
           CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_attendence.png"),
           Container(
             width: 35,
           ),

           CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_payroll.png"),
           CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_tricker.png"),
            ],
          ),
        ),

        floatingActionButton: CircleAvatar(
          radius: 35,
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
