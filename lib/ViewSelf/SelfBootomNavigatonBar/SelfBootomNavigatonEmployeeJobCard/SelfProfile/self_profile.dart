import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';

import '../../../../CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import '../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class SelfProfileScreen extends StatefulWidget {
  const SelfProfileScreen({super.key});

  @override
  State<SelfProfileScreen> createState() => _SelfProfileScreenState();
}

class _SelfProfileScreenState extends State<SelfProfileScreen> {
  double container_Radius=50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75),
          child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
              text: "Uzzal Biswas")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part -----------------------------
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 237,
                  width: double.infinity,
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(container_Radius),
                     bottomRight: Radius.circular(container_Radius),
                   ) ,
                 ),
                 child: Column(
                   children: [
                     Container(
                       height: 214,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(container_Radius),
                           bottomRight: Radius.circular(container_Radius),
                         ) ,
                         color: Colors.amberAccent,
                         gradient: LinearGradient(colors: [
                           Main_Theme_textColor_tir_Condition,
                           Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                           Main_Theme_textColor_tir_Condition.withOpacity(0.7),
                           Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                           Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                           Main_Theme_textColor_tir_Condition.withOpacity(0.4),
                           Main_Theme_textColor_tir_Condition.withOpacity(0.3),
                         ])
                       ),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 16,top: 13),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomImageSction(height: 84, width: 84, radius: 100, image: "Assets/DrawerImage/testperson.png"),
                                 SizedBox(width: 23,),
                                 Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Container(
                                         alignment: Alignment.center,
                                         height: 23,
                                         width: 80,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(7),
                                           color: Color(0xffACC027).withOpacity(0.6),
                                         ),
                                         child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10387", letterSpacing: 0.5, textColor: Main_Theme_WhiteCollor,),
                                       ),
                                       SizedBox(height:2,),
                                       ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "Uzzal Biswas", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                                       ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "Assistant Programmer", letterSpacing: 0.5, textColor: Main_Theme_textColor,),

                                     ],
                                   ),
                                 ),
                                 Spacer(),
                                 CircleAvatar(
                                   backgroundColor:  Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                                   radius: 20,
                                   child: CustomImageSction2(height: 20, width: 20, radius: 5, image: "Assets/SelfIcon/edit_iconss.png", img_color: Colors.white),
                                 ),
                                 SizedBox(width: 10,)
                               ],
                             ),
                           ),
                           SizedBox(height: 5,),
                           Container(
                             height: 58,
                             margin: EdgeInsets.all(10),
                             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(7),
                               color:Main_Theme_WhiteCollor.withOpacity(0.2),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Dep : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text: "Software",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                     Spacer(),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Age : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text: "10Y 05M",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                   ],
                                 ),
Spacer(),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Deg : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text: "Software Engineer",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                     Spacer(),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "OT : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text: "100H",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                   ],
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                     SizedBox(height: 22,)
                   ],
                 ),
                ),
                Positioned(
                    bottom: 10,
                    child: Container(
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Main_Theme_WhiteCollor,
                  ),
                      child:  ShareMessagePdfPart(
                        width: 170,
                        is_share: true, onTap: () {

                      }, is_messsage: true, onTap2message: () {

                      }, is_pdf: true, onTap3pdf: () {

                      },


                      ),
                ))
              ],
            )

          ],
        ),
      ),
    );
  }
}
