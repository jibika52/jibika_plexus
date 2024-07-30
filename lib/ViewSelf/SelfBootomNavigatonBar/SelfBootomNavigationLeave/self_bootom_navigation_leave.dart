import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/SelfMyLeaveSatusScreen/self_my_leave_satus_screen.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';

class SelfBootomNavigationLeave extends StatefulWidget {
  const SelfBootomNavigationLeave({super.key});

  @override
  State<SelfBootomNavigationLeave> createState() =>
      _SelfBootomNavigationLeaveState();
}

class _SelfBootomNavigationLeaveState extends State<SelfBootomNavigationLeave> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: home_default_color,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              SelfProfileSummaryPart(),
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
                    rows: lista.map<DataRow>((e) {
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
              SizedBox(height: apps_div_margin,),
              Container(
                color: Main_Theme_WhiteCollor,
                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShareMessagePdfPart(width: 120, is_share: true, onTap: () {

                    }, is_messsage: true, onTap2message: () {

                    }, is_pdf: true, onTap3pdf: () {

                    },),

                    InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SelfMyLeaveSatusScreen(),));
                        },
                        child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Leave History >>", letterSpacing: 0.3, textColor: Main_Theme_textColor_tir_Condition,)),


                  ],
                ),
              ),
            ]
            ),
        ),);
  }
  List lista=[
    "1",
    "1",
    "1",
    "1",
  ];
}
