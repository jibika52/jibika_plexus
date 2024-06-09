import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_header_partt.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status.dart';

import '../../CustomWidget/CustomText/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: Container(
          color: CustomAppbarColor,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 35,left: 15,right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                   child: CustomImageSction(height: 33, width: 35, radius: 2, image: "Assets/DashBoardIcons/appbar_leadin_menu.png")),
              ColorCustomText(fontSize: 21, fontWeight: FontWeight.w600, text: "$appbar_text", letterSpacing: 1,textColor: Main_Theme_WhiteCollor.withOpacity(0.8), ),
              Container(
                height: 100,
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,top: 10),
                          child: CustomImageSction(height: 35, width: 35, radius: 1, image: "Assets/DashBoardIcons/notification_icon.png"),
                        ),
                        Positioned(
                            top: 0,
                            left: 10,
                            child: CircleAvatar(
                          radius: 10,
                              child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w700, text: "7", letterSpacing: 1, textColor: notification_color),
                        ))
                      ],
                    ),
                     Icon(Icons.more_vert,size: 30,color: Main_Theme_WhiteCollor.withOpacity(0.8) ,)
                  ],
                ),
              )

            ],
          ),
        )),
      body: Container(
        color: home_default_color,
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top :10, left: 10.0,right: 10),
              child: HomeHederPart(
                permission_list: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :10, left: 10.0,right: 10),
              child:SecondhomePartScreen(),
            ),

          ],
        )
      ),
    );
  }
}

