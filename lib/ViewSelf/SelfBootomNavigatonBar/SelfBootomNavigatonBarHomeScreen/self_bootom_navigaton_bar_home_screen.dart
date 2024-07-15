
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/customize_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/custom_text_form_field.dart';
 import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../CustomWidget/CustomClockAnglebar/clock_angle_bar.dart';
import '../../../CustomWidget/CustomTExtFormField/custom_text_formfield.dart';

class SelfBootomNavigatonBarHomeScreen extends StatefulWidget {
  const SelfBootomNavigatonBarHomeScreen({super.key});

  @override
  State<SelfBootomNavigatonBarHomeScreen> createState() => _SelfBootomNavigatonBarHomeScreenState();
}

class _SelfBootomNavigatonBarHomeScreenState extends State<SelfBootomNavigatonBarHomeScreen> {
  TextEditingController _descriptionController=TextEditingController();
  double animated_height=81;
  int second=0;
  bool is_select_Comment=false;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      second=  DateTime.now().second;
      print(second);
    });
    });
    // TODO: implement initState
    super.initState();
  }
  double Animatedwidth=170;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: home_default_color,
       body: Container(
         height:double.infinity,
         width: double.infinity,
         child: Column(
           children: [
             ///------------ First Part -----------------------------------
             Container(
               margin: EdgeInsets.all( 10 ),
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
                                 CustomText(fontSize: 15, fontWeight: FontWeight.w500, text: "  My Presence", letterSpacing: 0.3),
                                 ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "  28-Sep-2023", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
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
                               onTap: () {},),
                             SizedBox(width: 10,),
                              CustomizeButton(text: "Check Out", textColor: Main_Theme_textColor.withOpacity(0.5), presentsent_color: presentsent_color, fontSize: 12,
                                onTap: () {  },)

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

             /// Second Part--------------------------------------------------

             Container(
               height: animated_height,
               width: double.infinity,
               color: holiday_color.withOpacity(0.08),
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
                         CustomText(fontSize: 15, fontWeight: FontWeight.w500, text: "My Attendance", letterSpacing: 0.3),
                        Spacer(),
                          Icon(Icons.arrow_back_ios,size: 16, color: Main_Theme_textColor.withOpacity(0.8),),
                          CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Jan 2023", letterSpacing: 0.3),
                          Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Main_Theme_textColor.withOpacity(0.8)) ,
                         Spacer(),
                         Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Main_Theme_textColor.withOpacity(0.8)),
                       ],
                     ),
                   ),
                   Container(
                     height: 30,
                     width: double.infinity,
                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
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


           ],
         ),
       ),
    );
  }
}
