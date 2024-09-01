import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';
import '../CustomText/custom_text.dart';

class CustomEmployeeProfile extends StatelessWidget {
    CustomEmployeeProfile({super.key,
      required this.image,
      required this.id,
      required this.name,
      required this.designation,
      required this.time,
      required this.onTap1,
      required this.onTap2,
      required this.onTap3,
      required this.need_location,
    });
  String image;
  String id;
  String name;
  String designation;
  String time;
  VoidCallback onTap1;
  VoidCallback onTap2;
  VoidCallback onTap3;
  bool need_location;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(colors: [
            Main_Theme_textColor_tir_Condition.withOpacity(0.2),
            Main_Theme_textColor_tir_Condition.withOpacity(0.4),
            Main_Theme_textColor_tir_Condition.withOpacity(0.6),
            Main_Theme_textColor_tir_Condition.withOpacity(0.8),
            Main_Theme_textColor_tir_Condition,
          ])
      ),
      child: Row(
        children: [
          CustomImageSctionNetwork(height: 94, width: 78, radius: 7, image: "$image"),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xffACC027).withOpacity(0.6),
                  ),
                  child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$id", letterSpacing: 0.5, textColor: Main_Theme_WhiteCollor,),
                ),
                SizedBox(height:2,),
                ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "$name", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "$designation", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "$time", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                SizedBox(height: 8,)
              ],
            ),
          )),
          Container(
            height: 114,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap:onTap1,
                    child: CustomImageSction(height: 30, width: 30, radius: 7, image: "Assets/DashBoardIcons/callfont.png")),
                InkWell(
                    onTap: onTap2,
                    child: CustomImageSction(height: 30, width: 30, radius: 7, image: "Assets/DashBoardIcons/messagetext.png")),

                 Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                // image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill),
              ),
            child: need_location==false?Container(): Image.asset("Assets/DashBoardIcons/location.png",fit: BoxFit.fill,color: Colors.white,),
            ) ,

                // InkWell(
                //     onTap: onTap3,
                //     child: Icon(Icons.location_on_outlined,color: Main_Theme_WhiteCollor.withOpacity(0.75),size: 30,)
                // ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
