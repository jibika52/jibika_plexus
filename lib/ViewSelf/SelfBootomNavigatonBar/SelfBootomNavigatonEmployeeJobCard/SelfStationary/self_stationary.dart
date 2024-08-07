import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

import '../../../../Utils/constants.dart';

class SelfStationary extends StatefulWidget {
  const SelfStationary({super.key});

  @override
  State<SelfStationary> createState() => _SelfStationaryState();
}

class _SelfStationaryState extends State<SelfStationary> {


  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75),
          child: CustomDefaultAppBar(onTap: () {
            Navigator.pop(context);
          }, text: "Office Stationary"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: home_default_color,
        child: Column(
          children: [
            /// First part noch move b_color------------------
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
              child: AnimatedToggleSwitch<int>.size(
                height: 35,
                current: max(_selectedIndex, 0),
                style: ToggleStyle(
                  backgroundColor: home_default_color,
                  indicatorColor: presentsent_color,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  indicatorBorderRadius: BorderRadius.circular(30),

                ),
                values:  [0, 1, 2],
                iconOpacity: 1.0,
                selectedIconScale: 1.0,
                indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width/3),
                iconAnimationType: AnimationType.onHover,
                styleAnimationType: AnimationType.onHover,
                spacing: 2.0,
                customSeparatorBuilder: (context, local, global) {
                  final opacity =
                  ((global.position - local.position).abs() - 0.5)
                      .clamp(0.0, 1.0);
                  return VerticalDivider(
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Colors.white38.withOpacity(opacity));
                },
                customIconBuilder: (context, local, global) {
                  final text = nameList[local.index];
                  return Center(
                      child: Text(text,
                          style: GoogleFonts.poppins(
                              fontSize : 13,
                              fontWeight : FontWeight.w400,
                              letterSpacing :  0.3,
                              color: Color.lerp(Colors.black, Colors.white,
                                  local.animationValue))));
                },
                borderWidth: 1.0,
                onChanged: (i) => setState(() => _selectedIndex = i),
              ),
            ),
            SizedBox(height: apps_div_margin,),
            /// Second part Body------------------
            Expanded(child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10,right: 10),
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MySelfLeaveStatus2(text1: "Date : ", text2: "11-apr-1997", textColor: Main_Theme_textColor, textColor2: Main_Theme_textColor.withOpacity(0.6), fontSize1: 12, fontSize2: 11, is_row: true, width_height: 0),
                          MySelfLeaveStatus2(text1: "Approval Status : ", text2: "Approved", textColor: Main_Theme_textColor, textColor2:_selectedIndex==0? presentsent_color:_selectedIndex==1?pending_color:absent_color, fontSize1: 12, fontSize2: 11, is_row: true, width_height: 0),
                        ],
                      ),
                    ],
                  ),
                );
              },),
              ),
            ),
          ],
        ),
      ),
    );
  }
  List nameList=[
    "Using-10",
    "Pending-09",
    "Disapproved-01",
  ];
}
