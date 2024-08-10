
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomSelfWedget/custom_wedget_myself_new_face.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/customize_button.dart';
 import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/SelfMyLeaveSatusScreen/self_my_leave_satus_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../Controller/HomeController/home_controller.dart';
import '../../../Controller/SelfDashboardController/self_dashboard_controller.dart';
import '../../../CustomWidget/CustomClockAnglebar/clock_angle_bar.dart';
import '../../../View/HomeScreen/HomeComponent/HomeFivePartComponent/home_five_part_body_section.dart';

class SelfBootomNavigatonBarHomeScreen extends StatefulWidget {
  const SelfBootomNavigatonBarHomeScreen({super.key});

  @override
  State<SelfBootomNavigatonBarHomeScreen> createState() => _SelfBootomNavigatonBarHomeScreenState();
}

class _SelfBootomNavigatonBarHomeScreenState extends State<SelfBootomNavigatonBarHomeScreen> {
  TextEditingController _descriptionController=TextEditingController();

  int second=0;
  bool is_select_Comment=false;
  @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).dashboardTodaysBirthdayEmployeeInfoProvider("${GetStorage().read("mobile_id")}", "", context); // Todays birthday
    Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      second=  DateTime.now().second;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  double Animatedwidth=170;
  double animated_height=0;
  bool is_clicked=false; 
  @override
  Widget build(BuildContext context) {
    final  dashboardtodaysBirthdayEmployeeinfo=  Provider.of<HomeProvider>(context).dashboardtodaysBirthdayEmployeeinfo;
    return Scaffold(
      backgroundColor: home_default_color,
       body: Container(
         height:double.infinity,
         width: double.infinity,
         child: SingleChildScrollView(
           child: Column(
             children: [
               ///------------ First Part -----------------------------------
               Container(
                 margin: EdgeInsets.only(left:  10,right: 10,top: apps_div_margin),
                 padding: EdgeInsets.all(10),
                 height: 150,
                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: Main_Theme_WhiteCollor,
                   borderRadius: BorderRadius.circular(7)
                 ),
                 child: Column(
                   children: [
                     /// First Top Part------------------------------------------
                     Expanded(
                       child: Container(
                       child: Row(
                         children: [
                           Expanded(
                               flex:3,
                               child: Container( 
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "  My Presence", letterSpacing: 0.3),
                                   // ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                   //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: DateTime.now().second>9? "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}": "${DateTime.now().hour}${DateTime.now().minute}0${DateTime.now().second}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                  ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: " ${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       SizedBox(width: 3,),
                                       Image.asset("Assets/DashBoardIcons/b_bar_attendence.png",height: 18,width: 18,fit: BoxFit.fill,color: Colors.grey,),
                                       ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "   Check In : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                       ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:08:36", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),
           
                                     ],
                                   ),
           
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24,fit: BoxFit.fill,color: Colors.grey,),
                                       ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "  Check Out : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                       ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:08:36", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),
           
                                     ],
                                   ),
                                 ],
                               ),
                               ),
                           ),
                           Expanded(
                               flex: 2,
                               child: Stack(
                                 alignment: Alignment.center,
                                 children: [
                                   Container(
                                     alignment: Alignment.center, //  color: Colors.green,
                                     child: CircularPercentIndicator(
                                       radius: 45.0,
                                       lineWidth: 5.5,
                                       percent:0.7,
                                       backgroundColor: home_default_color,
                                       progressColor: presentsent_color,
                                       center: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${DateTime.now().hour}:${DateTime.now().minute}:${second}", letterSpacing: 0.3),
                                           CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "5H  14M", letterSpacing: 0.3),
                                         ],
                                       ),
                                     ),
                               ),
                                   Positioned(
                                       child: Container(
                                         width: 72,
                                         height: 72,
                                         child: Transform.rotate(
                                           angle: -pi / 2,
                                           child: CustomPaint(
                                             painter: ClockPainter(),
                                           ),
                                         ),
                                       ) ,
                                   ),
           
                                 
                                 ],
                               )),
                           SizedBox(width: 20,)
                         ],
                       ),
                       ),
                     ),
                 //    SizedBox(height: 5,),
                     /// First Down Side Part------------------------------------------
                     Stack(
                       children: [
                         Container(
                           height: 25,
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               CustomizeButton(text: "Check In", textColor: Main_Theme_textColor.withOpacity(0.5), presentsent_color: presentsent_color, fontSize: 12,
                                 onTap: () {
                                   Provider.of<SelfDashboardController>(context,listen: false).dashboardSalaryComprisonListProvider("${GetStorage().read("RfIdCardNo")}", "${DateFormat('yyyyMMdd').format(DateTime.now())}",DateTime.now().second>9? "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}": "${DateTime.now().hour}${DateTime.now().minute}0${DateTime.now().second}", "${GetStorage().read("RfIdCardNo")}", "Dhaka", "Dhaka", "Dhaka", "1229", "Dhaka", "38 no road", "2.5415455", "3.2541556", int.parse("${"${GetStorage().read("Empcode")}"}"), context);
                                 },),
                               SizedBox(width: 10,),
                                CustomizeButton(text: "Check Out", textColor: Main_Theme_textColor.withOpacity(0.5), presentsent_color: presentsent_color, fontSize: 12,
                                  onTap: () {
                                    Provider.of<SelfDashboardController>(context,listen: false).dashboardSalaryComprisonListProvider("${GetStorage().read("RfIdCardNo")}", "${DateFormat('yyyyMMdd').format(DateTime.now())}",DateTime.now().second>9? "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}": "${DateTime.now().hour}${DateTime.now().minute}0${DateTime.now().second}", "${GetStorage().read("RfIdCardNo")}", "Dhaka", "Dhaka", "Dhaka", "1229", "Dhaka", "38 no road", "2.5415455", "3.2541556", int.parse("${"${GetStorage().read("Empcode")}"}"), context);
                                  },)
           
                             ],
                           ),
                         ),
                         Positioned(
                           top: 0,
                             left: 0,
                             child: AnimatedContainer(
                               duration: Duration(milliseconds: 800),
                               height: 25,
                              // width: MediaQuery.of(context).size.width*0.42,
                               width: Animatedwidth,
                               decoration: BoxDecoration(
                                 color: Main_Theme_WhiteCollor,
                                 borderRadius: BorderRadius.circular(6),
                                 border:Border.all(
                                   width: 1,
                                   color: Main_Theme_textColor.withOpacity(0.5),
                                 ),
                               ),
                               child: Row(
                                 children: [
                                   // InkWell(
                                   //   onTap: () {
                                   //     Future.delayed(Duration(milliseconds: 100),() {
                                   //       setState(() {
                                   //         Animatedwidth=MediaQuery.of(context).size.width*0.45;
                                   //       });
                                   //     },);
                                   //   },
                                   //   child: Container(
                                   //    // margin: EdgeInsets.symmetric(horizontal: 5),
                                   //     height: 24,
                                   //     width: 36,
                                   //     decoration: BoxDecoration(
                                   //       color: Colors.green,
                                   //       //  image: DecorationImage(image: AssetImage("Assets/PrimaryInformation/chat2.png"),fit: BoxFit.fill)
                                   //     ),
                                   //     alignment: Alignment.center,
                                   //     child: Text("send",style: TextStyle(fontSize: 11),),
                                   //   ),
                                   // ),
                                   Expanded(
                                       child: Container(
                                         margin: EdgeInsets.only(bottom: 0),
                                         height: 24,
                                         child: TextFormField(
                                           onTap: () {
                                               Future.delayed(Duration(
                                                 milliseconds: 100,
                                               ),
                                               () {
                                                 setState(() {
                                                   Animatedwidth=MediaQuery.of(context).size.width*0.896;
                                                 });
                                               },
                                               );
           
                                           },
                                           maxLines: 1,
                                           style: GoogleFonts.poppins(
                                             fontSize : 10,
                                             fontWeight :FontWeight.w400,
                                             color : Main_Theme_textColor.withOpacity(0.8),
                                           ),
                                           decoration: InputDecoration(
                                             hintText: "Comments here",
                                             contentPadding: EdgeInsets.only(top: -20,right: 10,left: 7),
                                             hintStyle: GoogleFonts.poppins(
                                               fontSize : 10,
                                               fontWeight :FontWeight.w400,
                                               color : Main_Theme_textColor.withOpacity(0.5),
                                             ),
                                             border: InputBorder.none,
                                           ),
                                         ),
                                       )),
                                   InkWell(
                                     onTap: () {
                                       Future.delayed(Duration(milliseconds: 100),() {
                                         setState(() {
                                           Animatedwidth=MediaQuery.of(context).size.width*0.43;
                                         });
                                       },);
                                     },
                                     child: Container(
                                       // margin: EdgeInsets.symmetric(horizontal: 5),
                                       height: 24,
                                       width: 36,
                                       decoration: BoxDecoration(
                                         color: presentsent_color,
                                         //  image: DecorationImage(image: AssetImage("Assets/PrimaryInformation/chat2.png"),fit: BoxFit.fill)
                                       ),
                                       alignment: Alignment.center,
                                       child: Text("send",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w300,color: Colors.black,),
                                     ),
                                   ),
                                   ),
                                 ],
                               ),
                             ),
                         )
                       ],
                     ),
                     /// First Down Side Part------------------------------------------
           
                   ],
                 ),
               ),
               /// Second Part---------------------My attendance-----------------------------
               Container(
               //  height: animated_height,
                 width: double.infinity,
             //  color: holiday_color.withOpacity(0.08),
                 padding: EdgeInsets.only(bottom: 10),
                 margin: EdgeInsets.only(left: 10,right: 10,top: apps_div_margin ),
                 //    color: holiday_color ,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                   color: Main_Theme_WhiteCollor,
                 ),
                 child: Column(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: 5),
                       height: 30,
                       width: double.infinity,
                       padding: EdgeInsets.only(
                         left: 10,right: 10,top: 5
                       ),
                       child: Row(
                         children: [
                           CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "My Attendance", letterSpacing: 0.3),
                          Spacer(),
                            Icon(Icons.arrow_back_ios,size: 16, color: Main_Theme_textColor.withOpacity(0.8),),
                            CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Jan 2023", letterSpacing: 0.3),
                            Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Main_Theme_textColor.withOpacity(0.8)) ,
                           Spacer(),
                           IconButton(
                             icon: Icon(is_clicked==false?Icons.arrow_forward_ios_rounded : Icons.keyboard_arrow_down , size: 16,color: Main_Theme_textColor.withOpacity(0.8)) ,
                            onPressed: () {
                             setState(() {
                               is_clicked=!is_clicked;
                               animated_height=is_clicked==true? 222:0;
                             });
                           },),
                         ],
                       ),
                     ),
                     Container(
                       height: 30,
                       width: double.infinity,
                       padding: EdgeInsets.only(left: 10,right: 10,top: 1),
                       alignment: Alignment.center,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                             height: 24,
                             width: 28,
                             decoration: BoxDecoration(
                               border: Border(
                                 bottom: BorderSide(width: 2,color: presentsent_color)
                               ),
                             ),
                             child: Row(children: [
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "P", letterSpacing: 0.2,textColor: presentsent_color,),
                               Spacer(),
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "69", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                             ],),
                           ),
                           Spacer(),
                           Container(
                             height: 24,
                             width: 28,
                             decoration: BoxDecoration(
                               border: Border(
                                 bottom: BorderSide(width: 2,color: absent_color)
                               ),
                             ),
                             child: Row(children: [
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "A", letterSpacing: 0.2,textColor: absent_color,),
                               Spacer(),
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "69", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                             ],),
                           ),
                           Spacer(),
                           Container(
                             height: 24,
                             width: 28,
                             decoration: BoxDecoration(
                               border: Border(
                                 bottom: BorderSide(width: 2,color: leave_color)
                               ),
                             ),
                             child: Row(children: [
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "L", letterSpacing: 0.2,textColor: leave_color,),
                               Spacer(),
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "69", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                             ],),
                           ),
                           Spacer(),
                           Container(
                             height: 24,
                             width: 28,
                             decoration: BoxDecoration(
                               border: Border(
                                 bottom: BorderSide(width: 2,color: holiday_color)
                               ),
                             ),
                             child: Row(children: [
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "H", letterSpacing: 0.2,textColor: holiday_color,),
                               Spacer(),
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "69", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                             ],),
                           ),
                           Spacer(),
                           Container(
                             height: 24,
                             width: 48,
                             decoration: BoxDecoration(
                               border: Border(
                                   bottom: BorderSide(width: 2,color: Main_Theme_textColor.withOpacity(0.5))
                               ),
                             ),
                             child: Row(children: [
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "OT", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.5),),
                               Spacer(),
                               ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "699", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                             ],),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
                /// Animated Calender /...........Calender....................................
               AnimatedContainer(
                 margin: EdgeInsets.only(left: 10,right: 10, top:is_clicked==false?0: apps_div_margin),
                 //   height: 0,
                 height: animated_height,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                   color: Main_Theme_WhiteCollor,
                 ),
                 duration: Duration(milliseconds: 500),
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(bottom: 10,top: 10),
                         height: 26,
                         width: double.infinity,
                         child: GridView.builder(
                           itemCount: 31,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 7,
                               mainAxisExtent: 26,
                               crossAxisSpacing: 0,
                               mainAxisSpacing: 10
                           ), itemBuilder: (context, index) {
                           return Container(
                             height: 26,
                             width: 26,
                             alignment: Alignment.center,
                             child: ColorCustomText(
                               fontSize: 14, fontWeight: FontWeight.w400,
                               text:index==0? "Mo":index==1? "Tu":index==2? "We":index==3? "Th":index==4? "Fr":index==5? "Sa":"Su",
                               letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                           );
                         },),
                       ),
                       Container(
                         height: 175,
                         width: double.infinity,
                         child: GridView.builder(
                           itemCount: 31,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 7,
                               mainAxisExtent: 26,
                               crossAxisSpacing: 0,
                               mainAxisSpacing: 10
                           ), itemBuilder: (context, index) {
                           return CircleAvatar(
                             radius: 26,
                             backgroundColor: CustomButtonColor,
                             child: Padding(
                               padding: const EdgeInsets.all(2.0),
                               child: CircleAvatar(
                                 radius: 26,
                                 backgroundColor:index>10?presentsent_color: Colors.white ,
                                 child: ColorCustomText(
                                   fontSize: 12, fontWeight: FontWeight.w400,
                                   text: "${index+1}", letterSpacing: 0.3,
                                   textColor: index>10? Main_Theme_WhiteCollor : Main_Theme_textColor
                                   ,),
                               ),
                             ),
                           );
                         },
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
                /// 3rd part---------My leave status--------------------------------------------------------
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                 color: Main_Theme_WhiteCollor,
                   //   color: CustomButtonColor.withOpacity(0.15),
                 ),
                 margin: EdgeInsets.only(left: 10,right: 10 ,top: apps_div_margin),
                 child: Column(
                   children: [
                     Container(
                       height: 30,
                       width: double.infinity,
                         padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "My Leave Status", letterSpacing: 0.3),
                           InkWell(
                               onTap: () {
                                 Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfMyLeaveSatusScreen(),));
                               },
                               child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "See All", letterSpacing: 0.3, textColor: presentsent_color,))
                         ],
                       )
                     ),

                     Container(
                         width: double.infinity,
                         margin: EdgeInsets.only(left:  10,right: 10,bottom: 10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(7),
                           color: Main_Theme_WhiteCollor,
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Card(
                               elevation: 0.7,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(7)
                               ),
                               child: Container(
                                 height: 35,
                                 width: 35,
                                 // decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.circular(5),
                                 //   // color: Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                                 // ),
                                 alignment: Alignment.center,
                                 child: ColorCustomText(fontSize: 15, fontWeight: FontWeight.w400, text: "CL", letterSpacing: 0.3,textColor: leave_color,),
                               ),
                             ),
                             MySelfLeaveStatus(text2: "2", text1: "Days", textColor: Main_Theme_textColor,),
                             MySelfLeaveStatus(text1: "Form Date", text2: "13-Sep-2023", textColor: Main_Theme_textColor,),
                             MySelfLeaveStatus(text1: "To Date", text2: "13-Sep-2023", textColor: Main_Theme_textColor,),
                             //    CustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "13-Sep-2023 To 13-Sep-2023", letterSpacing: 0.3),
                             MySelfLeaveStatus(text2: "Pending", text1: "Status", textColor: presentsent_color,),
                           ],
                         )
                     ),
                   ],
                 ),
               ),
               /// 4th part Todays birth day-----------------------------------------------------------------
                 HomeFivePartBodyScetion(
                   todayselectionbirthdaylist:"$dashboardtodaysBirthdayEmployeeinfo"=="null"?
                   []
                       :
                   dashboardtodaysBirthdayEmployeeinfo,
                   image: "Assets/DashBoardIcons/man_picture.png",
                   name: "Hafizur Rahaman",
                   designation: "Manager, HR, Admin ,",
                   email: "jibikaapps@gmail.com ",
                   phone: "01889173335"
               ),
               /// 5th part New face-----------------------------------------------------------------
               MyselfNewFaceScreen(),
               SizedBox(height: 40,),
             ],
           ),
         ),
       ),
    );
  }

  String selected3Datee = DateFormat('dd-MMMM-yyyy').format(DateTime.now()).toString();
  // Future<void> _select3Date(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selected3Datee) {
  //     final df = new DateFormat('dd-MMMM-yyyy');
  //     setState(() {
  //       selected3Datee = df.format(picked);
  //       Provider.of<HomeProvider>(context,listen: false).dashboardPieChartDataProvider("${GetStorage().read("mobile_id")}", "$selected3Datee", context);
  //     });
  //   }
  // }

}
