import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomDropDown/custom_dropdown.dart';
import 'package:jibika_plexus/CustomSelfWedget/MySelfCustomCalender/myself_custom_calender.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/SelfMyLeaveSatusScreen/self_my_leave_satus_screen.dart';
import 'package:provider/provider.dart';

import '../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Model/EmpoyeeLeaveStatusModelClass/employee_leave_model_class.dart';
import '../../../Utils/constants.dart';

class SelfBootomNavigationLeave extends StatefulWidget {
  const SelfBootomNavigationLeave({super.key});

  @override
  State<SelfBootomNavigationLeave> createState() =>
      _SelfBootomNavigationLeaveState();
}

class _SelfBootomNavigationLeaveState extends State<SelfBootomNavigationLeave> {
  TextEditingController _commentsController=TextEditingController();
  @override
  void initState() {
    Provider.of<SelfDashboardController>(context,listen: false).selfLeaveAllocationProvider("${GetStorage().read("mobile_id")}", "${GetStorage().read("Empcode")}", context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List leave_status=Provider.of<SelfDashboardController>(context).selfLeaveAllocationList ;
    return Scaffold(
        backgroundColor: home_default_color,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: [
                /// first Self part------------------------------------------------------------
                SelfProfileSummaryPart(),
                /// Second Self part------------------------------------------------------------
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
                /// Third Self part------------------------------------------------------------
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
                SizedBox(height: apps_div_margin,),
                /// Four Self part------------------------------------------------------------
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 10,right: 10,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Main_Theme_WhiteCollor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(fontSize: font12header, fontWeight: FontWeight.w600, text: "Leave Entry", letterSpacing: 0.3),
                      Divider(color: Main_Theme_textColor.withOpacity(0.1),),
                      Container(
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          children: [
                            CustomText(fontSize: font12header, fontWeight: FontWeight.w300, text: "Leave Entry", letterSpacing: 0.3),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                  height: 30,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 10,right: 10
                                  ),
                                  decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                       color: Main_Theme_textColor.withOpacity(0.2),
                                    )
                                  ),
                                  child: CustomDropDown(list: yearslist, titletext: "Select Leave Type", height: 120, width: MediaQuery.of(context).size.width-120, offset: Offset(-12,  0))),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 10,right: 10,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: home_default_color,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                width: double.infinity,
                                  padding: EdgeInsets.only(bottom: 7,top: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "From Date", letterSpacing: 0.3),
                                      MyselfCustomCalender(datetext: "${selectedformDatee}", width: double.infinity, height: 30,onTap: () {
                                        _selectformDate(context);
                                      },)
                                    ],
                                  ),
                             ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 7,top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "To Date", letterSpacing: 0.3),
                                    MyselfCustomCalender(datetext: "${selectedtoDatee}", width: double.infinity, height: 30,onTap: () {
                                      _selecttoDate(context);
                                    },)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child: Container(
                                width: double.infinity,
                                  padding: EdgeInsets.only(bottom: 7,top: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "Days", letterSpacing: 0.3),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Main_Theme_textColor.withOpacity(0.1),
                                        ),
                                        alignment: Alignment.center,
                                        child: CustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "0", letterSpacing: 0.3),
                                      )
                                    ],
                                  ),
                             ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: apps_div_margin-5,),
                      JibikaCustomTextFromField(
                          controller: _commentsController,
                          height: 50,
                          img: "Assets/DrawerImage/chat.png",
                          hinttext: "Comments here",
                          keyboardType: TextInputType.text,
                          obscureText: false),
                      SizedBox(height: apps_div_margin-5,),
                      Container(
                        height: 139,
                        width: 139,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "Documents", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                            Container(
                              height: 80,
                              width: 146,
                              margin: EdgeInsets.only(top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: presentsent_color.withOpacity(0.4)),
                                // color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("Assets/PrimaryInformation/email.png",height: 31,width: 45,fit: BoxFit.fill,),
                                  ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Browse file", letterSpacing: 0.1, textColor: presentsent_color),
                                ],
                              ),
                            ),
                            ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Accepted File Types: .jpeg and .png", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

                          ],
                        ),
                      ),
                      SizedBox(height: apps_div_margin-5,),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 110,
                          child: CustomButton(onTap: () {
                          }, text: "Apply", fontWeight: FontWeight.w400,button_text_fontSize: 14, button_height: 40, custom_button_collor: CustomButtonColor.withOpacity(0.3), button_text_color: CustomButtonColor, borderRadius: 50),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100,),
              ]
              ),
            ),
        ),);

  }
  List lista=[
    "1",
    "1",
    "1",
    "1",
  ];

  /// From Date-----------------------------------------------------------------------------------------
  String selectedformDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  Future<void> _selectformDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedformDatee) {
      final df = new DateFormat('dd-MMM-yyyy');
      setState(() {
        selectedformDatee = df.format(picked);
      });
    }
  }

  /// To Date-----------------------------------------------------------------------------------------
  String selectedtoDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedtoDatee) {
      final df = new DateFormat('dd-MMM-yyyy');
      setState(() {
        selectedtoDatee = df.format(picked);
      });
    }
  }
}
