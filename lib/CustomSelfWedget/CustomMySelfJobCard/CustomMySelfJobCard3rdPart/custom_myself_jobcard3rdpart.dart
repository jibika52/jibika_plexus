import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';
import '../../myself_leave_status.dart';

class CustomMySelfJobCard3rdPart extends StatelessWidget {
  CustomMySelfJobCard3rdPart({super.key,
    required this.late,
    required this.Duration,
    required this.OT,
    required this.Shift_Plane,
  });
  String ? late;
  String ? Duration;
  String ? OT;
  String ? Shift_Plane;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$late",  width_height: 3.5,text2: "Late",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 22,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$Duration",  width_height: 3.5,text2: "Duration",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 22,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$OT",  width_height: 3.5,text2: "OT",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 22,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$Shift_Plane",  width_height: 3.5,text2: "Shift Plane",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),

      ],
    );
  }
}


class CustomMySelfJobCard3rdPart1 extends StatelessWidget {
  CustomMySelfJobCard3rdPart1({super.key,
    required this.selectedindex,
    required this.index,
    required this.text2,
    required this.intime,
    required this.outTime,
    required this.status,
    required this.location,

    required this.IN_LATITUDE,
    required this.IN_LONGITUDE,
    required this.IN_LOCNAME,
    required this.IN_DISTRICT,
    required this.IN_STREET_NAME,
    required this.IN_DIVISION,
    required this.OUT_LATITUDE,
    required this.OUT_LONGITUDE,
    required this.OUT_LOCNAME,
    required this.OUT_DISTRICT,
    required this.OUT_STREET_NAME,
    required this.OUT_DIVISION,

  });
  bool selectedindex;
  String  index;
  String ? text2;
  String ? intime;
  String ? outTime;
  String ? status;
  String ? location;

  String? IN_LATITUDE ;
  String? IN_LONGITUDE ;
  String? IN_LOCNAME ;
  String? IN_DISTRICT ;
  String? IN_STREET_NAME ;
  String? IN_DIVISION ;
  String? OUT_LATITUDE ;
  String? OUT_LONGITUDE ;
  String? OUT_LOCNAME ;
  String? OUT_DISTRICT ;
  String? OUT_STREET_NAME ;
  String? OUT_DIVISION ;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Main_Theme_textColor_tir_Condition.withOpacity(0.1),
          ),
          padding: EdgeInsets.symmetric(vertical: 3 ),
          //  margin: EdgeInsets.only(right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MySelfLeaveStatus2(
                text1:
              "${index}",
                width_height: 0,
                text2: "$text2",
                fontWeight1:FontWeight.w600 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor.withOpacity(0.8), fontSize1: 16, fontSize2: 12, is_row: false, textColor2: Main_Theme_textColor,),

            ],
          ),
        ),
        SizedBox(width: 10,),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 62,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$intime",  width_height: 3.5,text2: "In Time",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 62,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$outTime",  width_height: 3.5,text2: "Out Time",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          height: 62,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: MySelfLeaveStatus2(text1: "$status",  width_height: 3.5,text2: "Status",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("Attendance Summary"),
              content: Container(
                height: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Stack(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                             alignment: Alignment.center,
                             height: 20,
                             width: double.infinity,
                             color: CustomButtonColor,
                             child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "In Punch Info", letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
                           ),
                           CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$IN_LOCNAME", letterSpacing: 0.3),
                           CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$IN_DIVISION", letterSpacing: 0.3),
                           CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$IN_DISTRICT", letterSpacing: 0.3),
                           CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$IN_STREET_NAME", letterSpacing: 0.3),
                         ],
                       ),
                       Positioned(
                           right: 5,
                           bottom: -5,
                           child: Container(
                         padding: EdgeInsets.symmetric(vertical: 7),
                         child:  Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                 color: CustomButtonColor),
                             ColorCustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3, textColor: CustomButtonColor,)
                           ],
                         ),
                       )),
                     ],
                   ),
                    Divider(),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: double.infinity,
                              color: CustomButtonColor,
                              child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Out Punch Info", letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
                            ),
                            CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$OUT_LOCNAME", letterSpacing: 0.3),
                            CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$OUT_DIVISION", letterSpacing: 0.3),
                            CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$OUT_DISTRICT", letterSpacing: 0.3),
                            CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "$OUT_STREET_NAME", letterSpacing: 0.3),
                          ],
                        ),
                        Positioned(
                            right: 5,
                            bottom: -5,
                            child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                  color: CustomButtonColor),
                              ColorCustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3, textColor: CustomButtonColor,)
                            ],
                          ),
                        )),
                      ],
                    )
                  ],
                )
              ),
            ),);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                    color: Main_Theme_textColor.withOpacity(0.6)),
                 CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
              ],
            ),
          ),
        ),
        Spacer(),
        // Container(
        //   height: 25,
        //   width: 1,
        //   color: Main_Theme_textColor.withOpacity(0.1),
        // ),
        // Spacer(),
        ///----------------- Third Part ------------------------------///
        // selectedindex?Container(
        //     child: Icon(Icons.keyboard_arrow_up,size: 17,)) : Icon(Icons.keyboard_arrow_down,size: 17)

      ],
    );
  }

}