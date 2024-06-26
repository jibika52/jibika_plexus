import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class HomeFivePartBodyScetion extends StatelessWidget {
  HomeFivePartBodyScetion({super.key,
  required this.image,
  required this.name,
  required this.designation,
  required this.email,
  required this.phone,
  });
  String name;
  String phone;
  String email;
  String designation;
  String image;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(left: 10,right: 10,top:apps_div_margin ),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        //   color: Color(0xffc7ded6),
        color: CustomButtonColor.withOpacity(0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorCustomText(text: "Today's Selection", fontSize: 14, fontWeight: FontWeight.w500, textColor: Main_Theme_textColor.withOpacity(0.9),letterSpacing: 0.3,),
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 98,
                  width: 220,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            top: -4,
                            left: -4,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 55,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: absent_color.withOpacity(0.4),
                              ),

                            ),),
                          Positioned(
                            child: Container(
                            margin: EdgeInsets.all(10),
                            width: 60,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill,)
                            ),

                          ),),
                        ],
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 3,),
                                ColorCustomText(text: "$name", fontSize: font12header, fontWeight: FontWeight.w500, letterSpacing: 0.4, textColor: Main_Theme_textColor )
                               , SizedBox(height: 3,),
                                 ColorCustomText(fontSize: font11, fontWeight: FontWeight.w400, text: "$designation", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.6))
                                , ColorCustomText(fontSize: font11, fontWeight: FontWeight.w400, text: "$email", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.6))
                                , ColorCustomText(fontSize: font11, fontWeight: FontWeight.w400, text: "$phone", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.6))
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}
