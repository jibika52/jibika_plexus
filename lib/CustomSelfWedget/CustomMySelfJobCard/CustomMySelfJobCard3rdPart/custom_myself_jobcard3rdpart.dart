import 'package:flutter/material.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';
import '../../myself_leave_status.dart';

class CustomMySelfJobCard3rdPart extends StatelessWidget {
  const CustomMySelfJobCard3rdPart({super.key});

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
          child: MySelfLeaveStatus2(text1: "0:12:08",  width_height: 3.5,text2: "Late",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
          child: MySelfLeaveStatus2(text1: "07:28:45",  width_height: 3.5,text2: "Duration",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
          child: MySelfLeaveStatus2(text1: "04:55:55",  width_height: 3.5,text2: "OT",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
          child: MySelfLeaveStatus2(text1: "General",  width_height: 3.5,text2: "Shift Plane",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
  });
  bool selectedindex;
  int  index;
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
              MySelfLeaveStatus2(text1: "${index+1}", width_height: 0,text2: "Sat",fontWeight1:FontWeight.w600 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor_tir_Condition, fontSize1: 16, fontSize2: 12, is_row: false, textColor2: Main_Theme_textColor,),
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
          child: MySelfLeaveStatus2(text1: "00:00:00",  width_height: 3.5,text2: "In Time",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
          child: MySelfLeaveStatus2(text1: "00:00:00",  width_height: 3.5,text2: "Out Time",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

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
          child: MySelfLeaveStatus2(text1: "AB",  width_height: 3.5,text2: "Status",fontWeight1:FontWeight.w400 ,fontWeight2: FontWeight.w400 ,textColor: Main_Theme_textColor, fontSize1: 12, fontSize2: 12, is_row: false,textColor2: Main_Theme_textColor.withOpacity(0.5)),

        ),
        Spacer(),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        Container(
          width: 80,
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.location_on_outlined,size: 16,color: Main_Theme_textColor.withOpacity(0.6),),
              Padding(
                padding: const EdgeInsets.only(left:5.0,),
                child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w300,maxLines: 1 ,text: "Gulsha ndshf sdf sdf  ", overflow: TextOverflow.ellipsis,letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          height: 25,
          width: 1,
          color: Main_Theme_textColor.withOpacity(0.1),
        ),
        Spacer(),
        ///----------------- Third Part ------------------------------///
        selectedindex?Container(
            child: Icon(Icons.keyboard_arrow_up,size: 17,)) : Icon(Icons.keyboard_arrow_down,size: 17)

      ],
    );
  }

}