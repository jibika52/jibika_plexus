import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeFirstPartComponent/HomeFirstPartComponentAttendence/home_first_part_component_attendence.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeFirstPartComponent/HomeFirstPartComponentLeave/home_first_part_component_leave.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';

class HomeHederPart extends StatefulWidget {
   HomeHederPart({Key? key,required this.permission_list}) : super(key: key);
  List permission_list;
  @override
  State<HomeHederPart> createState() => _HomeHederPartState();
}

class _HomeHederPartState extends State<HomeHederPart> {
  int selected_index=0;
  List countList=[
    "Join ",
    "Atten.",
    "Leave",
    "Promo.",
    "Loan",
    "conv.",
    "Stat.",
    "Comp.",
  ];
  List listimage=[
    "Assets/DashBoardIcons/employee_icon.png",
    "Assets/DashBoardIcons/finger_scan.png",
    "Assets/DashBoardIcons/aireplane_leave.png",
    "Assets/DashBoardIcons/promotion.png",
    "Assets/DashBoardIcons/loan.png",
    "Assets/DashBoardIcons/convence.png",
    "Assets/DashBoardIcons/requistion.png",
    "Assets/DashBoardIcons/complain.png",
  ];
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 2,
      child: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
           color: Main_Theme_WhiteCollor,

        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:countList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selected_index=index;
                });
                if(selected_index==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeFirstPartComponentAttendance(),));
                }
                if(selected_index==2){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeFirstPartComponentLeave(
                    tag: "dash",
                  ),));
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 5),
                width: 70,
                decoration: BoxDecoration(
              color: Main_Theme_WhiteCollor,

                  border: Border(
                    bottom: BorderSide(width: 3, color:selected_index==index?Main_Theme_textColor.withOpacity(0.3) :Main_Theme_WhiteCollor,style: BorderStyle.solid),
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(1.0),
                              child: Image.asset("${listimage[index]}",fit: BoxFit.fill,color: CustomAppbarColor,height: 70,),
                            )),
                        ColorCustomText(text: "${countList[index]}", fontSize: 12, fontWeight: FontWeight.w600,letterSpacing: 0.4, textColor: CustomButtonColor.withOpacity(0.8)),
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right:5,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Main_Theme_textColor.withOpacity(0.1),
                          child: ColorCustomText(text: "20", fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.5,textColor:  notification_color, ),
                        ))
                  ],
                ),
              ),
            );
          },),
      ),
    );
  }
}