import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/SelfDashboardController/self_dashboard_controller.dart';
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
    List leave_status=Provider.of<SelfDashboardController>(context).selfLeaveAllocationList ;
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
           SelfProfileSummaryPart(),
           Container(
             margin: EdgeInsets.only(left: 10,right: 10,top: 10),
             padding: EdgeInsets.only(top: 10,left: 10,right: 10),
             decoration: BoxDecoration(
                 border: Border(
                   // bottom: BorderSide(
                   //     color: Colors.black
                   // )
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
                 //  border: TableBorder.all(width: 1,color:  Main_Theme_textColor.withOpacity(0.05)),
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
                 rows: leave_status.map<DataRow>((e) {
                   return DataRow(
                     cells: <DataCell>[
                       DataCell(Center(
                         child: Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Text('${e["LeaveAbbre"]}',  style: GoogleFonts.poppins(
                             fontSize: 9,
                             fontWeight: FontWeight.w400,
                           ),),
                         ),
                       )),
                       DataCell(Center(
                         child: Text('${e["EntitleDays"]}',  style: GoogleFonts.poppins(
                           fontSize: 9,
                           fontWeight: FontWeight.w400,
                         ),),
                       )),
                       DataCell(Center(
                         child: Text('${e["AvailDays"]}',  style: GoogleFonts.poppins(
                           fontSize: 9,
                           fontWeight: FontWeight.w400,
                         ),),
                       )),
                       DataCell(Center(
                         child: Text('${e["EncashmentDays"]}',  style: GoogleFonts.poppins(
                           fontSize: 9,
                           fontWeight: FontWeight.w400,
                         ),),
                       )),
                       DataCell(
                           Center(
                             child: Text('${e["BalanceDays"]}',  style: GoogleFonts.poppins(
                               fontSize: 9,
                               fontWeight: FontWeight.w400,
                             ),),
                           )),
                       DataCell(Center(
                         child: Text('${e["CreateDate"]}',
                           style: GoogleFonts.poppins(
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
