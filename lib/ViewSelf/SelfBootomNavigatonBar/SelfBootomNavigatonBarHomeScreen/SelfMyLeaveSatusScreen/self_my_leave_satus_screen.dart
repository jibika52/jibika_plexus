import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../../CustomSelfWedget/myself_leave_status.dart';
import '../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';

class SelfMyLeaveSatusScreen extends StatefulWidget {
  const SelfMyLeaveSatusScreen({super.key});

  @override
  State<SelfMyLeaveSatusScreen> createState() => _SelfMyLeaveSatusScreenState();
}

class _SelfMyLeaveSatusScreenState extends State<SelfMyLeaveSatusScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double C_height=8;
    double Cwidth=10;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75),
          child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "My Leave Status")),
     body: Container(
       height: double.infinity,
       width: double.infinity,
       child: Column(
         children: [
           SizedBox(height: apps_div_margin ),
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(7),
               color: Main_Theme_WhiteCollor,
             ),
             padding: EdgeInsets.all(5),
             margin: EdgeInsets.only(left: 10,right: 10),
             width: double.infinity,
             child: ListView.builder(
               shrinkWrap: true,
               scrollDirection: Axis.vertical,
               itemCount: 5,
               itemBuilder: (context, index) {
               return Container(
                 padding: EdgeInsets.only(left: 5,right: 5,),
                 margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
                 decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       color: Main_Theme_textColor.withOpacity(0.2),
                       width: 0.5,
                     )
                   )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CustomText(text :index==0?"Leave":index==1?"SL": index==2?"SL": index==3?"LW":"OL", fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                    Spacer(),
                     CustomText(text :index==0?"Entitle":"  10" ,fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                     Spacer(),
                     CustomText(text :index==0?"Availed":"   20" ,fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                     Spacer(),
                  CustomText(text :index==0?"Encashment":"  30" ,fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                     Spacer(),
                     CustomText(text :index==0?"Dues":"  40" ,fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                     Spacer(),
                  CustomText(text :index==0?"Date": "10-jun-2024", fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: 0.2,),
                   ],
                 ),
               );
             },),
           ),
           SizedBox(height: apps_div_margin ),
           Container(
             height: 39,
             width: double.infinity,
             padding: EdgeInsets.only(
                right: 10,left: 10
             ),
             child: Row(
               children: [
                 Expanded(
                     flex: 10,
                     child: Container(
                       height: 48,
                       width: 300,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(7),
                           color:Color.fromRGBO(245, 245, 245, 1),
                           border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                       ),
                       child: Row(
                         children: [
                           Container(
                             margin: EdgeInsets.only(
                                 left: 10,right: 10
                             ),
                             height: 16,width: 16 ,
                             child: CustomImageSction(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                           ),
                           Container(
                             margin: EdgeInsets.only(right: 10
                             ),
                             height: 12,
                             width: 2,
                             color: Main_Theme_textColor.withOpacity(0.1),
                           ),
                           Expanded(
                             child: Container(
                                 child: TextFormField(
                                   style: GoogleFonts.poppins(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 12,
                                   ),
                                   decoration: InputDecoration(
                                       contentPadding: EdgeInsets.only(bottom: 10),
                                       border: InputBorder.none,
                                       hintStyle: TextStyle(
                                           fontWeight: FontWeight.w400,
                                           fontSize: 12,
                                           color: Main_Theme_textColor.withOpacity(0.30)
                                       ),
                                       hintText: "Search Here"
                                   ),
                                 )
                             ),
                           )
                         ],
                       ),
                     )),

                 Container(
                   height: 53,
                   width: 40,
                   margin: EdgeInsets.only(
                       left: 10,right: 10
                   ),
                   padding: EdgeInsets.symmetric(
                       horizontal: 10,
                       vertical: 7.95
                   ),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(7),
                       color:Color.fromRGBO(245, 245, 245, 1),
                       border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                   ),
                   child: CustomImageSction(height: 17, width: 15, radius: 1, image: "Assets/DrawerImage/search_filter.png"),
                 ),
               ],
             ),
           ),
           SizedBox(height: apps_div_margin,),
           Expanded(child: Container(
             child:ListView.builder(
                 itemCount: 7,
                 itemBuilder: (context, index) =>    Container(
                 width: double.infinity,
                 margin: EdgeInsets.only(left:  10,right: 10,bottom: 4),
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                   color: Main_Theme_WhiteCollor,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     MySelfLeaveStatus(text1: "2 Days", text2: "Sick Leave", textColor: Main_Theme_textColor,),
                     MySelfLeaveStatus(text1: "13-Sep-2023", text2: "13-Sep-2023", textColor: Main_Theme_textColor,),
                     MySelfLeaveStatus(text1: "Pending", text2: "Status", textColor: presentsent_color,),
                   ],
                 )
             )
             ) ,
           ))
         ],
       ),
     ),
    );

  }
}
