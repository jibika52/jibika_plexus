import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    List leave_status =
        Provider.of<SelfDashboardController>(context).selfLeaveAllocationList;
    dynamic selfAdminGetLeaveEarlyCountList =
        Provider.of<SelfDashboardController>(context)
            .selfAdminGetLeaveEarlyCountList;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomDefaultAppBar(
              onTap: () => Navigator.pop(context), text: "My Leave Status")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SelfProfileSummaryPart(),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border(
                      // bottom: BorderSide(
                      //     color: Colors.black
                      // )
                      ),
                  borderRadius: BorderRadius.circular(7),
                  color: Main_Theme_WhiteCollor),
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
                          bottom: BorderSide(
                              color: Main_Theme_textColor.withOpacity(0.05)))),
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
                            child: Text(
                              '${e["LeaveAbbre"]}',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            '${e["EntitleDays"]}',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            '${e["AvailDays"]}',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            '${e["EncashmentDays"]}',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            '${e["BalanceDays"]}',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                        DataCell(Center(
                          //    child: Text('${e["CreateDate"].substring(0,10)}',
                          child: Text(
                            '${DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse("${e["CreateDate"]}"))}',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: apps_div_margin,
            ),
            Expanded(
                child: Container(
              child: ListView.builder(
                itemCount: "${selfAdminGetLeaveEarlyCountList}" == "[]" ||
                        "${selfAdminGetLeaveEarlyCountList}" == "null"
                    ? 0
                    : selfAdminGetLeaveEarlyCountList.length,
                itemBuilder: (context, index) => Stack(
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
                      margin: EdgeInsets.only(left: 9, right: 9, bottom: 4),
                      padding: EdgeInsets.all(9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              text: "Date",
                              letterSpacing: 0.3),
                          SizedBox(
                            height: 2,
                          ),
                          CustomText(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              text: "${selfAdminGetLeaveEarlyCountList}" ==
                                          "[]" ||
                                      "${selfAdminGetLeaveEarlyCountList}" ==
                                          "null"
                                  ? ""
                                  : '${DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse("${selfAdminGetLeaveEarlyCountList[index]["FromDate"] ?? 0}"))} TO ${DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse("${selfAdminGetLeaveEarlyCountList[index]["ToDate"] ?? 0}"))}',
                              letterSpacing: 0.4),
                          Divider(
                              //height: 10,
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MySelfLeaveStatus2(
                                  text1: "Apply days",
                                  text2: "${selfAdminGetLeaveEarlyCountList}" ==
                                              "[]" ||
                                          "${selfAdminGetLeaveEarlyCountList}" ==
                                              "null"
                                      ? ""
                                      : "${selfAdminGetLeaveEarlyCountList[index]["LeaveDays"] ?? 0}",
                                  textColor:
                                      Main_Theme_textColor.withOpacity(0.7),
                                  textColor2: Main_Theme_textColor,
                                  fontSize1: 11,
                                  fontSize2: 13,
                                  is_row: false,
                                  width_height: 2),
                              MySelfLeaveStatus2(
                                  text1: "Leave type",
                                  text2: "${selfAdminGetLeaveEarlyCountList}" ==
                                              "[]" ||
                                          "${selfAdminGetLeaveEarlyCountList}" ==
                                              "null"
                                      ? ""
                                      : "${selfAdminGetLeaveEarlyCountList[index]["LeaveAbbreviation"] ?? ""}",
                                  textColor:
                                      Main_Theme_textColor.withOpacity(0.7),
                                  textColor2: Main_Theme_textColor,
                                  fontSize1: 11,
                                  fontSize2: 13,
                                  is_row: false,
                                  width_height: 2),
                              MySelfLeaveStatus2(
                                text1: "Approved by",
                                text2: "Admin",
                                textColor:
                                    Main_Theme_textColor.withOpacity(0.7),
                                textColor2: Main_Theme_textColor,
                                fontSize1: 11,
                                fontSize2: 13,
                                is_row: false,
                                width_height: 2,
                                fontWeight2: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 20,
                        top: 10,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            //  color: CustomButtonColor.withOpacity(0.1),
                            color: CustomAppbarColor,
                          ),
                          child: ColorCustomText(
                              textColor: Main_Theme_WhiteCollor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              text: "${selfAdminGetLeaveEarlyCountList}" ==
                                          "[]" ||
                                      "${selfAdminGetLeaveEarlyCountList}" ==
                                          "null"
                                  ? ""
                                  : "${selfAdminGetLeaveEarlyCountList[index]["LeaveStatus"] ?? "Pending"}",
                              letterSpacing: 0.3),
                        ))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  List snapShot = [
    "1",
    "1",
    "1",
    "1",
  ];
}
