
import 'dart:math';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
       body: Container(
         height:double.infinity,
         width: double.infinity,
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.all( 10 ),
               padding: EdgeInsets.all(10),
               height: 155,
               width: double.infinity,
               decoration: BoxDecoration(
                   color: Main_Theme_WhiteCollor,
                 borderRadius: BorderRadius.circular(7)
               ),
               child: Column(
                 children: [
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
                                         CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "14:40:40", letterSpacing: 0.3),
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
                       ],
                     ),
                     ),
                   ),
                   SizedBox(height: 5,),
                   Container(
                     height: 30,
                     width: double.infinity,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         CustomizeButton(text: "Check In", textColor: Main_Theme_textColor.withOpacity(0.5), presentsent_color: presentsent_color, fontSize: 15,
                           onTap: () {
                           showDialog(context: context, builder: (context) => AlertDialog(
                             title: CustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Type yours", letterSpacing: 0.3),
                             content: Container(
                                 height: 100,
                                 child: Column(
                                   children: [
                                     TextFormField(
                                       decoration: InputDecoration(
                                         labelText:"Description",
                                         contentPadding: EdgeInsets.all(2)
                                       ),
                                     ),
                                     SizedBox(height: 4,),
                                     ActionChip(label: Text("Confirm")),
                                   ],
                                 )),
                           ),);
                           },),
                         SizedBox(width: 10,),
                          CustomizeButton(text: "Check Out", textColor: Main_Theme_textColor.withOpacity(0.5), presentsent_color: presentsent_color, fontSize: 15,
                            onTap: () {  },)

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
