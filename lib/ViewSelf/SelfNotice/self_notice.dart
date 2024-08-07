import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import '../../CustomWidget/CustomImage/custom_image.dart';

class SelfNoticeScreen extends StatefulWidget {
  const SelfNoticeScreen({super.key});

  @override
  State<SelfNoticeScreen> createState() => _SelfNoticeScreenState();
}

class _SelfNoticeScreenState extends State<SelfNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Announcement")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        color: home_default_color,
        child: ListView.builder(itemBuilder: (context, index) {
          return Container( 
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.only(bottom: 5,top: 5,left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: Main_Theme_WhiteCollor
            ),
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/DashBoardIcons/notification_icon.png"),
                          SizedBox(width: 7,),
                          CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "Notice for AGM 2023", letterSpacing: 0.3)
                        ],
                      ),
                      ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "20-apr-2024", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5))
                    ],
                  ),
                ),
                Stack(
                  children: [
                    CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$Loremtext", letterSpacing: 0.3,maxLines: 3,),
                   Positioned(
                       bottom: 0,right: 0,
                       child: Container(
                     height: 17,
                     width: 100,
                     color: Main_Theme_WhiteCollor,
                         child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w600, text: "...Read more", letterSpacing: 0.3,textColor: Main_Theme_textColor_tir_Condition,),
                   ))
                  ],
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageSction2(height: 13, width: 14, radius: 1, image: "Assets/SelfIcon/url_lin.png",img_color: Main_Theme_textColor.withOpacity(0.4),),
                          SizedBox(width: 7,),
                          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "image.jpg", letterSpacing: 0.3,textColor: Main_Theme_textColor.withOpacity(0.5),)
                        ],
                      ),
                      ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "20-apr-2024", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5))
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
      ),
    );
  }
}
