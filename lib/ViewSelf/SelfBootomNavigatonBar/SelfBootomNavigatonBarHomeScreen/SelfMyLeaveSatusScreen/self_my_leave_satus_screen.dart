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
         Container(
           margin: EdgeInsets.only(left: 10,right: 10,top: 10),
           padding: EdgeInsets.only(top: 10,left: 10,right: 10),
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                 color: Colors.black
               )
             ),
             borderRadius: BorderRadius.circular(7),
             color: Main_Theme_WhiteCollor
           ),
           child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: DataTable(
             horizontalMargin: 25,
             headingRowHeight: 20,
             dataRowHeight: 18,
             columnSpacing: 15,
             decoration: BoxDecoration(
               border: Border(
                 bottom: BorderSide(color: Main_Theme_textColor.withOpacity(0.05))
               )
             ),
             columns: <DataColumn>[
               DataColumn(
                 label: Text(
                   'Leave',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
               DataColumn(
                 label: Text(
                   'Entitle',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
               DataColumn(
                 label: Text(
                   'Availed',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
               DataColumn(
                 label: Text(
                   'Encashment',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
               DataColumn(
                 label: Text(
                   'Dues',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
               DataColumn(
                 label: Text(
                   '    Date',
                   style: GoogleFonts.poppins(
                       fontSize: 10,
                       fontWeight: FontWeight.w400,
                       ),
                 ),
               ),
             ],
             rows: snapShot.map<DataRow>((e) {
               return DataRow(
                 cells: <DataCell>[
                   DataCell(Center(
                     child: Padding(
                       padding: const EdgeInsets.all(3.0),
                       child: Text('Sl',  style: GoogleFonts.poppins(
                           fontSize: 9,
                           fontWeight: FontWeight.w400,
                           ),),
                     ),
                   )),
                   DataCell(Center(
                     child: Text('12',  style: GoogleFonts.poppins(
                         fontSize: 9,
                         fontWeight: FontWeight.w400,
                         ),),
                   )),
                   DataCell(Center(
                     child: Text('12',  style: GoogleFonts.poppins(
                         fontSize: 9,
                         fontWeight: FontWeight.w400,
                         ),),
                   )),
                   DataCell(Center(
                     child: Text('12',  style: GoogleFonts.poppins(
                         fontSize: 9,
                         fontWeight: FontWeight.w400,
                         ),),
                   )),
                   DataCell(
                       Center(
                         child: Text('12',  style: GoogleFonts.poppins(
                             fontSize: 9,
                             fontWeight: FontWeight.w400,
                             ),),
                       )),
                   DataCell(Center(
                     child: Text('13-jun-2024',  style: GoogleFonts.poppins(
                         fontSize: 9,
                         fontWeight: FontWeight.w400,
                         ),),
                   )),
                 ],
               );
             }).toList(),
           ),
                  ),
         ),
           // SizedBox(height: apps_div_margin ),
           // Container(
           //   decoration: BoxDecoration(
           //     borderRadius: BorderRadius.circular(7),
           //     color: Main_Theme_WhiteCollor,
           //   ),
           //   padding: EdgeInsets.all(5),
           //   margin: EdgeInsets.only(left: 9,right: 9),
           //   width: double.infinity,
           //   child: ListView.builder(
           //     shrinkWrap: true,
           //     scrollDirection: Axis.vertical,
           //     itemCount: 5,
           //     itemBuilder: (context, index) {
           //     return Container(
           //       padding: EdgeInsets.only(left: 5,right: 5,),
           //       margin: EdgeInsets.only(left: 9,right: 9,bottom: 5),
           //       decoration: BoxDecoration(
           //         border: Border(
           //           bottom: BorderSide(
           //             color: Main_Theme_textColor.withOpacity(0.2),
           //             width: 0.5,
           //           )
           //         )
           //       ),
           //       child: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           CustomText(text :index==0?"Leave":index==1?"SL": index==2?"SL": index==3?"LW":"OL", fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //          Spacer(),
           //           CustomText(text :index==0?"Entitle":"  9" ,fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //           Spacer(),
           //           CustomText(text :index==0?"Availed":"   20" ,fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //           Spacer(),
           //        CustomText(text :index==0?"Encashment":"  30" ,fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //           Spacer(),
           //           CustomText(text :index==0?"Dues":"  40" ,fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //           Spacer(),
           //        CustomText(text :index==0?"Date": "9-jun-2024", fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 0.2,),
           //         ],
           //       ),
           //     );
           //   },),
           // ),
           SizedBox(height: apps_div_margin ),
           Container(
             height: 39,
             width: double.infinity,
             padding: EdgeInsets.only(
                right: 9,left: 9
             ),
             child: Row(
               children: [
                 Expanded(
                     flex: 9,
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
                                 left: 9,right: 9
                             ),
                             height: 10,width: 10 ,
                             child: CustomImageSction(height: 10, width: 10, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                           ),
                           Container(
                             margin: EdgeInsets.only(right: 9
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
                                       contentPadding: EdgeInsets.only(bottom: 9),
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
                     ),
                 ),

                 Container(
                   height: 53,
                   width: 40,
                   margin: EdgeInsets.only(
                       left: 9,right: 9
                   ),
                   padding: EdgeInsets.symmetric(
                       horizontal: 9,
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
           Expanded(
               child: Container(
             child:ListView.builder(
                 itemCount: 7,
                 itemBuilder: (context, index) =>    Container(
                 width: double.infinity,
                 margin: EdgeInsets.only(left:  9,right: 9,bottom: 4),
                 padding: EdgeInsets.all(9),
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
             )
             ) ,
           ))
         ],
       ),
     ),
    );

  }
  List snapShot=[
    "1",
    "1",
    "1",
    "1",
  ];
}
