
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomSelfWedget/MySelfCustomCalender/myself_custom_calender.dart';
import 'package:jibika_plexus/CustomSelfWedget/custom_wedget_myself_new_face.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/customize_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
 import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../Controller/HomeController/home_controller.dart';
import '../../../Controller/SelfDashboardController/self_dashboard_controller.dart';
import '../../../CustomWidget/CustomClockAnglebar/clock_angle_bar.dart';
import '../../../View/HomeScreen/HomeComponent/HomeFivePartComponent/home_five_part_body_section.dart';
import '../SelfBootomNavigationLeave/SelfMyLeaveSatusScreen/self_my_leave_satus_screen.dart';

class SelfBootomNavigatonBarHomeScreen extends StatefulWidget {
  const SelfBootomNavigatonBarHomeScreen({super.key});

  @override
  State<SelfBootomNavigatonBarHomeScreen> createState() => _SelfBootomNavigatonBarHomeScreenState();
}

class _SelfBootomNavigatonBarHomeScreenState extends State<SelfBootomNavigatonBarHomeScreen> {
  TextEditingController _descriptionController=TextEditingController();
  Position ? _currentPosition;

  late Position position;
  _getCurrentLocation() async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude,
          _currentPosition!.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        Provider.of<SelfDashboardController>(context,listen: false).dashboardSalaryComprisonListProvider(
            "${GetStorage().read("mobile_id")}",
            "${DateFormat('yyyyMMdd').format(DateTime.now())}",
            "${DateFormat('HHmmss').format(DateTime.now()).toString()}",
            "${GetStorage().read("RfIdCardNo")}",
            "${place.name}",
            "${place.locality}",
            "${place.administrativeArea}",
            "${place.postalCode}",
            "${place.subAdministrativeArea}",
            "${place.street.toString()}",
            "${_currentPosition!.latitude}",
            "${_currentPosition!.longitude}",
            int.parse("${"${GetStorage().read("Empcode")}"}"),
            "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
            "${_descriptionController.text}", context);
      });
    } catch (e) {
      print(e);
    }
  }

  int second=0;
  bool is_select_Comment=false;
  int i=0;
  @override
  void initState() { 
    Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        "${GetStorage().read("mobile_id")}",
        "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
        "${GetStorage().read("IdCardNo")}",
        "GENERAL",
        context
    );
    Provider.of<HomeProvider>(context,listen: false).dashboardTodaysBirthdayEmployeeInfoProvider("${GetStorage().read("mobile_id")}", "", context); // Todays birthday
    //    Provider.of<CounterProvider>(context,listen: false).setcountSecondfunction(); // Todays birthday
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     second=  DateTime.now().second;
    //     Now=  DateFormat('HH:mm:ss').format(DateTime.now()).toString();
    //   });
    // });
    functionx();
    // TODO: implement initState
    super.initState();
  }
   functionx(){
   Timer.periodic(Duration(seconds: 1), (timer) {
     Provider.of<CounterProvider>(context,listen: false).setcountSecondfunction(); //
   });
 }

///-----------------------------------------------------------------------
  Timer? timer;

  bool is_open_textbox=false;
  bool is_timer=false;
  ///-----------------------------------------------------------------------
  double Animatedwidth=100;
  double animated_height=0;
  bool is_clicked=false;
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider
        (
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          "${GetStorage().read("mobile_id")}",
          "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
          "${GetStorage().read("IdCardNo")}",
          "GENERAL", context);
    });
  }
  String ? checkin;
  String ? checkout;
  double increase_punch_progress_bar=0.0001;
  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    dynamic selfAdminGetLeaveEarlyCountList=Provider.of<SelfDashboardController>(context).selfAdminGetLeaveEarlyCountList ;
    double P_Count=0;
    double AB_Count=0;
    double L_Count=0;
    double HL_Count=0;
    checkin="";
    checkout="";

    bool is_clicked=false;
    final  dashboardtodaysBirthdayEmployeeinfo=  Provider.of<HomeProvider>(context).dashboardtodaysBirthdayEmployeeinfo;
      List<Updated_attendance_summary>   selfOneMonthAttendanceList =  Provider.of<SelfDashboardController>(context).selfOneMonthAttendanceList;
  //print("ccccccccccccccccccccccccccccccccccccccccccccc ${DateTime.now().day}");
    for(var i in selfOneMonthAttendanceList){
      if("${i.date}"=="${DateTime.now().day}"){
        checkin =i.iNTIME ;
        checkout =i.oUTTIME ;
      }
    }
    
    for(var i in selfOneMonthAttendanceList){

      if("${i.Status}"=="P"){
        P_Count++;
      }
      else if("${i.Status}"=="AB"){
        AB_Count++;
      }
      else if("${i.Status!.substring(i.Status!.length-1)}"=="L" ){
        L_Count++;
      }
      else if("${i.Status!.substring(i.Status!.length-1)}"=="H" ){
        HL_Count++;
      }
      else{
        //   HL_Count++;
      }
    }


    return Scaffold(
      backgroundColor: home_default_color,
       body: RefreshIndicator(
         onRefresh: _refreshData,
         child: InkWell(
           splashColor: Main_Theme_WhiteCollor.withOpacity(0.0),
           onTap: () {
             setState(() {
               is_open_textbox=false;
               animated_height=0;
               FocusManager.instance.primaryFocus?.unfocus();
               _descriptionController.text="";
             });
           },
           child: Container(
             height:double.infinity,
             width: double.infinity,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   ///------------ First Part -----------------------------------
                   Container(
                     margin: EdgeInsets.only(left:  10,right: 10,top: apps_div_margin),
                     padding: EdgeInsets.all(10),
                     height: 175,
                     width: double.infinity,
                     decoration: BoxDecoration(
                         color: Main_Theme_WhiteCollor,
                       borderRadius: BorderRadius.circular(7)
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
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
                                       CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "Today Presence  ", letterSpacing: 0.3),
                                       // ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                       //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: DateTime.now().second>9? "${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}": "${DateTime.now().hour}${DateTime.now().minute}0${DateTime.now().second}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset("Assets/SelfIcon/in_punch.png",height: 16,width: 16,fit: BoxFit.fill,color: Colors.grey,),
                                           SizedBox(width:5),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Check In : $checkin", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:10:10", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                      //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:selfOneMonthAttendanceList==null?"Processing":"${selfOneMonthAttendanceList[selfOneMonthAttendanceList.length-1]["IN_TIME"]}"==""?"": "${selfOneMonthAttendanceList.last["IN_TIME"].substring(selfOneMonthAttendanceList.last["IN_TIME"].length - 8)}", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),

                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset("Assets/SelfIcon/out_pumch.png",height: 16,width: 16,fit: BoxFit.fill,color: Colors.grey,),
                                           SizedBox(width:5),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Check Out : ${checkout}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:10:10", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),

                                         //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:selfOneMonthAttendanceList==null?"Processing":"${selfOneMonthAttendanceList[selfOneMonthAttendanceList.length-1]["OUT_TIME"]}"==""?"": "${selfOneMonthAttendanceList.last["OUT_TIME"].substring(selfOneMonthAttendanceList.last["OUT_TIME"].length - 8)}", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),

                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                          // Image.asset("Assets/SelfIcon/late_punch.png",height: 18,width: 18,fit: BoxFit.fill,color: Colors.grey,),
                                           Image.asset("Assets/SelfIcon/late.png",height: 18,width: 18,fit: BoxFit.fill,color: Main_Theme_textColor.withOpacity(0.4),),
                                           SizedBox(width:5),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "${selfOneMonthAttendanceList}"=="[]"?"Late :" :  "Late :${selfOneMonthAttendanceList[DateTime.now().day-1].lATE ??""}" , letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),

                                           //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:10:10", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),

                                         //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:selfOneMonthAttendanceList==null?"Processing":"${selfOneMonthAttendanceList[selfOneMonthAttendanceList.length-1]["OUT_TIME"]}"==""?"": "${selfOneMonthAttendanceList.last["OUT_TIME"].substring(selfOneMonthAttendanceList.last["OUT_TIME"].length - 8)}", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),

                                         ],
                                       ),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset("Assets/SelfIcon/working_duration.png",height: 18,width: 18,fit: BoxFit.fill,color: Colors.grey,),
                                           SizedBox(width:5),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "${selfOneMonthAttendanceList}"=="[]"?"Duration : " : "Duration : ${selfOneMonthAttendanceList[DateTime.now().day-1].aCTUALWORKDURATION ??""}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                           //      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "10:10:10", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                                         //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:selfOneMonthAttendanceList==null?"Processing":"${selfOneMonthAttendanceList[selfOneMonthAttendanceList.length-1]["OUT_TIME"]}"==""?"": "${selfOneMonthAttendanceList.last["OUT_TIME"].substring(selfOneMonthAttendanceList.last["OUT_TIME"].length - 8)}", letterSpacing: 0.3, textColor: Main_Theme_textColor ,),
                                         ],
                                       ),
                                     ],
                                   ),
                                ),
                               ),
                               Spacer(),
                               /// Attendance Part Right side -------------------------------------------------------------
                               GestureDetector(
                                 onLongPress: () => setState(() {
                                   timer = Timer.periodic(Duration(microseconds: 1), (timer) {
                                     setState(() {
                                       if(increase_punch_progress_bar>=0.9999999){
                                         increase_punch_progress_bar=0.0;
                                        _getCurrentLocation();
                                         ElegantNotification(
                                           borderRadius: BorderRadius.circular(11),
                                           width: 380,
                                           iconSize: 25,
                                           background: presentsent_color,
                                           progressIndicatorBackground: presentsent_color,
                                           progressIndicatorColor: absent_color,
                                           // position: Alignment.center,
                                           title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text:
                                           "Attendance successfully with GPS tracking",
                                               letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                           description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks from JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                           onDismiss: () {
                                             print('Message when the notification is dismissed');
                                           }, icon: Icon(Icons.info_outlined,color:Colors.black,),
                                         ).show(context);
                                         timer.cancel();
                                       }else{
                                         increase_punch_progress_bar=increase_punch_progress_bar+0.0001;
                                        }
                                      });
                                     }
                                   );
                                 }
                               ),
                                 onLongPressEnd: (_) => setState(() {
                                   increase_punch_progress_bar=0.0;
                                   timer?.cancel();
                                 }),
                                 child: Container(
                                   padding: const EdgeInsets.only(bottom: 0.0),
                                   child: Stack(
                                     alignment: Alignment.center,
                                     children: [
                                       Container(
                                         height: 100,
                                         width: 100,
                                         padding: EdgeInsets.all(25),
                                        // child: CustomImageSction2(height: 70, width: 70, radius: 50, image: "Assets/DashBoardIcons/b_bar_attendence.png", img_color: Main_Theme_textColor.withOpacity(0.5)),
                                       ),
                                       Container(
                                         alignment: Alignment.center, //  color: Colors.green,
                                         child: CircularPercentIndicator(
                                           radius: 60.0,
                                           lineWidth: 5.5,
                                       //    percent:0.7,
                                           percent:increase_punch_progress_bar,
                                        //   backgroundColor: Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                                           backgroundColor: Main_Theme_textColor.withOpacity(0.2),
                                           progressColor: presentsent_color,
                                           center: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               SizedBox(height: 7,),

                                               Consumer<CounterProvider>(
                                                   builder: (context, value, child) =>
                                                    CustomText(fontSize: 15, fontWeight: FontWeight.w400, text: "${value.setcountSecond}", letterSpacing: 0.3)),

                                               CustomImageSction2(height: 50, width: 50, radius: 50, image: "Assets/SelfIcon/test_fingerprint.png", img_color: Main_Theme_textColor.withOpacity(0.5)),
                                              //     CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${DateTime.now().hour}:${DateTime.now().minute}:${second}", letterSpacing: 0.3),
                                              // CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "5H  14M", letterSpacing: 0.3),
                                             ],
                                           ),
                                         ),
                                   ),
                                       Positioned(
                                           child: Container(
                                             width: 99,
                                             height: 99,
                                             child: Transform.rotate(
                                               angle: -pi / 3,
                                               child: CustomPaint(
                                                 painter: ClockPainter(),
                                               ),
                                             ),
                                           ) ,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(width: 20,)
                             ],
                           ),
                           ),
                         ),
                     //    SizedBox(height: 5,),
                         /// First Down Side Part---------------------Comments  Area ---------------------
                         is_open_textbox ==false ?
                         Container(
                           padding: EdgeInsets.only(right: 4,top: 4,bottom: 4,left: 1),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                             ),
                             child: Row(
                               children: [
                                 InkWell(
                                     onTap: () {
                                       setState(() {
                                         is_open_textbox=!is_open_textbox;
                                         Future.delayed(Duration(
                                           milliseconds: 100,
                                         ),
                                               () {
                                             setState(() {
                                               animated_height=0;
                                               Animatedwidth=MediaQuery.of(context).size.width*0.905;
                                               _descriptionController.text="${selfOneMonthAttendanceList[DateTime.now().day-1].aTTENDANCEREMARK}";
                                             });
                                           },
                                         );
                                       });
                                     },
                                     child: CustomImageSction2(height: 16, width: 16, radius: 0, image: "Assets/SelfIcon/comments.png", img_color: Main_Theme_textColor.withOpacity(0.4),)),
                                 SizedBox(width: 7  ,),
                                 Text("${selfOneMonthAttendanceList}"=="[]"?"" : "${selfOneMonthAttendanceList[DateTime.now().day-1].aTTENDANCEREMARK ??""}",style: TextStyle(
                                   overflow: TextOverflow.ellipsis,
                                 ),),
                               ],
                             ),)
                             :
                            Stack(
                           children: [
                             Container(
                               height: 25,
                               width: double.infinity,
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
                                   borderRadius: BorderRadius.circular(50),
                                   border:Border.all(
                                     width: 1,
                                     color: Main_Theme_textColor.withOpacity(0.5),
                                   ),
                                 ),
                                 child: Row(
                                   children: [
                                     Expanded(
                                         child: Container(
                                           margin: EdgeInsets.only(bottom: 0),
                                           height: 24,
                                           child: TextFormField(
                                             controller: _descriptionController,
                                             maxLines: 1,
                                             style: GoogleFonts.poppins(
                                               fontSize : 10,
                                               fontWeight :FontWeight.w400,
                                               color : Main_Theme_textColor.withOpacity(0.8),
                                             ),
                                             decoration: InputDecoration(
                                                 hintText:selfOneMonthAttendanceList==null?"Processing":"${selfOneMonthAttendanceList[selfOneMonthAttendanceList.length-1].aTTENDANCEREMARK}"==""?"Remarks here": "${selfOneMonthAttendanceList.last.aTTENDANCEREMARK}",
                                               contentPadding: EdgeInsets.only(top: -20,right: 10,left: 7),
                                               hintStyle: GoogleFonts.poppins(
                                                 fontSize : 10,
                                                 fontWeight :FontWeight.w400,
                                                 color : Main_Theme_textColor.withOpacity(0.5),
                                               ),
                                               border: InputBorder.none,
                                             ),
                                           ),
                                         )
                                     ),
                                     InkWell(
                                       onTap: () {
                                         if(_descriptionController.text.isNotEmpty){
                                           _getCurrentLocation();
                                           Future.delayed(Duration(milliseconds: 100),() {
                                             setState(() {
                                               Animatedwidth=0;
                                               is_open_textbox=false;

                                             });
                                           },);
                                         }

                                       },
                                       child: Container(
                                         // margin: EdgeInsets.symmetric(horizontal: 5),
                                         height: 24,
                                         width: 55,
                                         decoration: BoxDecoration(
                                             color: presentsent_color.withOpacity(0.7),
                                             borderRadius: BorderRadius.only(
                                                 bottomRight: Radius.circular(50),
                                                 topRight: Radius.circular(50)
                                             )
                                           //  image: DecorationImage(image: AssetImage("Assets/PrimaryInformation/chat2.png"),fit: BoxFit.fill)
                                         ),
                                         alignment: Alignment.center,
                                         child: Text("Remarks",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Main_Theme_textColor,),
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
                   InkWell(
                     onTap: () {
                       setState(() {
                         is_clicked=!is_clicked;
                         animated_height=is_clicked==true? 222:0;
                         Animatedwidth=0.0;
                         is_open_textbox=false;
                       });
                     },
                     child: Container(
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
                                 CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "My Presence", letterSpacing: 0.3),
                                Spacer(),
                                 MyselfCustomCalender(
                                     onTap: () {
                                       _onPressed(context: context);
                                     },
                                     datetext: _selected_pick_month!=null? "${DateFormat("MMM-yyyy").format(_selected_pick_month!)}" : "${DateFormat("MMM-yyyy").format(DateTime.now())}", width: 100, height: 30)

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
                                       bottom: BorderSide(width: 4,color: presentsent_color)
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "P", letterSpacing: 0.2,textColor: presentsent_color,),
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${double.parse("$P_Count").toStringAsFixed(0)}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                                   ],),
                                 ),
                                 Spacer(),

                                 Container(
                                   height: 24,
                                   width: 28,
                                   decoration: BoxDecoration(
                                     border: Border(
                                       bottom: BorderSide(width: 4,color: absent_color)
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "A", letterSpacing: 0.2,textColor: absent_color,),
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${double.parse("$AB_Count").toStringAsFixed(0)}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                                   ],),
                                 ),
                                 Spacer(),
                                 Container(
                                   height: 24,
                                   width: 28,
                                   decoration: BoxDecoration(
                                     border: Border(
                                       bottom: BorderSide(width: 4,color: leave_color)
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "L", letterSpacing: 0.2,textColor: leave_color,),
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${double.parse("$L_Count").toStringAsFixed(0)}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                                   ],),
                                 ),
                                 Spacer(),
                                 Container(
                                   height: 24,
                                   width: 28,
                                   decoration: BoxDecoration(
                                     border: Border(
                                       bottom: BorderSide(width: 4,color: holiday_color)
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "H", letterSpacing: 0.2,textColor: holiday_color,),

                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:"${double.parse("$HL_Count").toStringAsFixed(0)}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7), ),
                                   ],),
                                 ),
                                 Spacer(),
                                 Container(
                                   height: 24,
                                   width: 48,
                                   decoration: BoxDecoration(
                                     border: Border(
                                         bottom: BorderSide(width: 4,color: Main_Theme_textColor.withOpacity(0.5))
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
                           /// Day name ------------------------------------------------------------
                           Container(
                             margin: EdgeInsets.only(bottom: 10,top: 10),
                             height: 26,
                             width: double.infinity,
                             child: GridView.builder(
                               itemCount:31,
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
                                   text:
                                       //  index==0? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-01"))}"
                                       // :index==1?"${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-02"))}"
                                       // :index==2? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-03"))}"
                                       // :index==3? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-04"))}"
                                       // :index==4? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-05"))}"
                                       // :index==5? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-06"))}"
                                       // :"${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateTime.now().year}-${DateTime.now().month}-01"))}",
                                       //
                                        index==0? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-01"))}"
                                       :index==1?"${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-02"))}"
                                       :index==2? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-03"))}"
                                       :index==3? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-04"))}"
                                       :index==4? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-05"))}"
                                       :index==5? "${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-06"))}"
                                       :"${DateFormat("E").format(DateFormat("yyyy-MM-dd").parse("${DateFormat("yyyy").format(_selected_pick_month!)}-${DateFormat("MM").format(_selected_pick_month!)}-07"))}",

                                   letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                               );
                             },),
                           ),
                           Container(
                             height: 175,
                             width: double.infinity,
                             child: GridView.builder(
                               itemCount: selfOneMonthAttendanceList.length,

                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 7,
                                   mainAxisExtent: 26,
                                   crossAxisSpacing: 0,
                                   mainAxisSpacing: 10
                               ), itemBuilder: (context, index) {
                                return   CircleAvatar(
                                 radius: 26,
                                  backgroundColor:  CustomButtonColor.withOpacity(0.5) ,
                                 child: Padding(
                                   padding: const EdgeInsets.all(2.0),
                                   child: CircleAvatar(
                                     radius: 26,
                                     backgroundColor:
                                     selfOneMonthAttendanceList[index].Status =="" ? Main_Theme_textColor
                                         :
                                     selfOneMonthAttendanceList[index].Status =="P" ? presentsent_color
                                         :
                                     selfOneMonthAttendanceList[index].Status =="AB" ? absent_color
                                         :
                                     selfOneMonthAttendanceList[index].Status!.substring(selfOneMonthAttendanceList[index].Status!.length-1)=="H"   ? holiday_color
                                         :
                                     selfOneMonthAttendanceList[index].Status!.substring(selfOneMonthAttendanceList[index].Status!.length-1)=="L" ? leave_color
                                         :
                                     Main_Theme_WhiteCollor,

                                      child: ColorCustomText(
                                       fontSize: 12, fontWeight: FontWeight.w400,
                                        text: "${index+1}",
                                        // text:"${selfOneMonthAttendanceList[index].Status}"==""?"$index": "${selfOneMonthAttendanceList[index].Status}",
                                        letterSpacing: 0.3,
                                       textColor:selfOneMonthAttendanceList[index].Status =="AB" || selfOneMonthAttendanceList[index].Status =="P"|| selfOneMonthAttendanceList[index].Status!.substring(selfOneMonthAttendanceList[index].Status!.length-1)=="L"? Main_Theme_WhiteCollor: Main_Theme_textColor
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
                           decoration: BoxDecoration(
                               color: CustomAppbarColor,
                             borderRadius: BorderRadius.only(topRight: Radius.circular(7),topLeft: Radius.circular(7))
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               ColorCustomText(textColor: Main_Theme_WhiteCollor,fontSize: 13, fontWeight: FontWeight.w500, text: "My Leave Status", letterSpacing: 0.3),
                               InkWell(
                                   onTap: () {
                                     Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfMyLeaveSatusScreen(),));
                                   },
                                   child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "See All", letterSpacing: 0.3, textColor: presentsent_color,))
                             ],
                           )
                         ),

                         Stack(
                           children: [
                             Container(
                               width: double.infinity,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(11),
                                   color: Colors.white
                                 // gradient: LinearGradient(colors: [
                                 //   CustomButtonColor.withOpacity(0.2),
                                 //   CustomButtonColor.withOpacity(0.1),
                                 //
                                 // ]),
                               ),
                               margin: EdgeInsets.only(left:  9,right: 9,bottom: 4),
                               padding: EdgeInsets.all(9),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Date", letterSpacing: 0.3),
                                   SizedBox(height: 2,),
                                   CustomText(fontSize: 12, fontWeight: FontWeight.w500, text:"${selfAdminGetLeaveEarlyCountList}"=="[]" || "${selfAdminGetLeaveEarlyCountList}"=="null"?"":'${DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse("${selfAdminGetLeaveEarlyCountList[0]["FromDate"]??0}") )} TO ${DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse("${selfAdminGetLeaveEarlyCountList[0]["ToDate"]??0}") )}', letterSpacing: 0.4),
                                   Divider(
                                     //height: 10,
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       MySelfLeaveStatus2(text1: "Apply days", text2:"${selfAdminGetLeaveEarlyCountList}"=="[]" || "${selfAdminGetLeaveEarlyCountList}"=="null"?"": "${selfAdminGetLeaveEarlyCountList[0]["LeaveDays"]??0}", textColor: Main_Theme_textColor.withOpacity(0.7),
                                           textColor2:  Main_Theme_textColor, fontSize1: 11, fontSize2: 13, is_row: false,
                                           width_height: 2),
                                       MySelfLeaveStatus2(text1: "Leave type", text2: "${selfAdminGetLeaveEarlyCountList}"=="[]" || "${selfAdminGetLeaveEarlyCountList}"=="null"?"": "${selfAdminGetLeaveEarlyCountList[0]["LeaveAbbreviation"]??""}", textColor: Main_Theme_textColor.withOpacity(0.7),
                                           textColor2:  Main_Theme_textColor, fontSize1: 11, fontSize2: 13, is_row: false,
                                           width_height: 2),
                                       MySelfLeaveStatus2(text1: "Approved by", text2: "Admin", textColor: Main_Theme_textColor.withOpacity(0.7),
                                         textColor2:  Main_Theme_textColor, fontSize1: 11, fontSize2: 13, is_row: false,
                                         width_height: 2,fontWeight2: FontWeight.w400,),
                                     ],
                                   )
                                 ],
                               ),
                             ),
                             Positioned(
                                 right: 20,
                                 top: 10,
                                 child: Container(
                                   padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                     //  color: CustomButtonColor.withOpacity(0.1),
                                     color: CustomAppbarColor,
                                   ),
                                   child: ColorCustomText(textColor: Main_Theme_WhiteCollor,fontSize: 11, fontWeight: FontWeight.w400, text: "${selfAdminGetLeaveEarlyCountList}"=="[]" || "${selfAdminGetLeaveEarlyCountList}"=="null"?"": "${selfAdminGetLeaveEarlyCountList[0]["LeaveStatus"]??"Pending"}", letterSpacing: 0.3),
                                 ))
                           ],
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
         ),
       ),
    );
  }

  DateTime? _selected_pick_month=DateTime.now()  ;
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected_pick_month ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2130),
      locale: localeObj,

    );

    if (selected != null) {
      setState(() {
        _selected_pick_month = selected;
        Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider
          (
            int.parse(DateFormat('yyyy').format(_selected_pick_month!)),
            int.parse(DateFormat('MM').format(_selected_pick_month!)),
            int.parse(DateFormat('dd').format(_selected_pick_month!)),
            "${GetStorage().read("mobile_id")}",
            "${DateFormat('dd-MMM-yyyy').format(_selected_pick_month!)}",
            "${GetStorage().read("IdCardNo")}",
            "GENERAL", context);
      });
    }
  }

}


class Updated_attendance_summary{
String? date;
String? Status;
String? iNTIME;
String? oUTTIME;
String? lATE;
String? aCTUALWORKDURATION;
String? oT;
String? sHIFTPLAN;
String? aTTENDANCEREMARK;
String? mOVEMENTPUNCH  ;

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
}