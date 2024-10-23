import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'package:jibika_plexus/CustomSelfWedget/MySelfCustomCalender/myself_custom_calender.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_main_employee_profile.dart';
 import 'package:provider/provider.dart';

import '../../../Controller/HomeController/home_controller.dart';
import '../../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Model/EmpoyeeLeaveStatusModelClass/employee_leave_model_class.dart';
import '../../../Utils/constants.dart';
import 'SelfMyLeaveSatusScreen/self_my_leave_satus_screen.dart';

class SelfBootomNavigationLeave extends StatefulWidget {
  const SelfBootomNavigationLeave({super.key});

  @override
  State<SelfBootomNavigationLeave> createState() =>
      _SelfBootomNavigationLeaveState();
}

class _SelfBootomNavigationLeaveState extends State<SelfBootomNavigationLeave> {
  TextEditingController _commentsController=TextEditingController();
  TextEditingController _dutycaridbyController=TextEditingController();
  @override
  void initState() {
    Provider.of<SelfDashboardController>(context,listen: false).selfLeaveAllocationProvider("${GetStorage().read("mobile_id")}", "${GetStorage().read("Empcode")}", context);
    Provider.of<SelfDashboardController>(context,listen: false).selfAdminGetLeaveEarlyCountProvider("${GetStorage().read("mobile_id")}", "${GetStorage().read("Empcode")}", context);
    // TODO: implement initState
    super.initState();
  }
  int selected_index=-1;
  int Leave_type_selected_index=0;
  int selest_leave=0;
  dynamic get_status;
  final _key=GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    dynamic leave_status=Provider.of<SelfDashboardController>(context).selfLeaveAllocationList ;
    final selfORAdminShortInformationdata=Provider.of<HomeProvider>(context).selfORAdminShortInformationdata;

    return Scaffold(
        backgroundColor: home_default_color,

      body: Container(
        height: MediaQuery.of(context).size.height ,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: apps_div_margin,),
              /// Four Self part------------------------------------------------------------
              leave_status==null?Center(child: CircularProgressIndicator(),):     Container(
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
                              Container(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border.all(
                                    color: Main_Theme_textColor.withOpacity(0.1),
                                  )
                                ),
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
                    SizedBox(height: 10,),
                    /// Shift Are--------------------------------------------------------------
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Select Leave", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
                    SizedBox(height: apps_div_margin+2,),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount:leave_status==null?0: leave_status.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              selest_leave=index;
                              get_status=leave_status[index]["LeaveTypeCode"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              //  color:selest_leave==index?CustomButtonColor.withOpacity(1.0):home_default_color,
                              color:selest_leave==index?Main_Theme_textColor_tir_Condition.withOpacity(0.8):home_default_color,
                            ),
                            margin: EdgeInsets.only(right: 10),
                            height: 30,
                            width: 70,
                            //  padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ColorCustomText(fontSize:selest_leave==index? 18 :16, fontWeight:selest_leave==index? FontWeight.w600 : FontWeight.w500, text: "${leave_status[index]["LeaveAbbre"]}", letterSpacing: 0.3, textColor: selest_leave==index?Main_Theme_WhiteCollor:Main_Theme_textColor),
                                ColorCustomText(fontSize:selest_leave==index? 16 :14, fontWeight:selest_leave==index? FontWeight.w500 : FontWeight.w400, text: "${leave_status[index]["BalanceDays"]}", letterSpacing: 0.3, textColor: selest_leave==index?Main_Theme_WhiteCollor:Main_Theme_textColor),
                              ],
                            ),
                          ),
                        ),),
                    ),

                    SizedBox(height: apps_div_margin+5,),
                    /// Shift Are--------------------------------------------------------------
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Select Leave Type", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
                    SizedBox(height: 7,),
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    Leave_type_selected_index=index;
                                  });
                                },
                                child:  Container(
                                  width: MediaQuery.of(context).size.width/3.5,
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 8,
                                            backgroundColor: Main_Theme_textColor_tir_Condition,
                                          ),
                                          Positioned(child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Leave_type_selected_index==index?Colors.grey : Colors.white,
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width:2,),
                                      CustomText(fontSize:MediaQuery.of(context).size.width<380?11: 14, fontWeight: FontWeight.w400, text: index==0?"Full day" :index==1?"First half" :"Second half", letterSpacing: 0.3),
                                    ],
                                  ),
                                )
                            ),),
                    ),

                    /// Frm Date --------------- To Date Select -------Area ------------------
                    Container(
                      //  margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        //   color: home_default_color,
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
                                  //  MyselfCustomCalender(datetext: datetext, width: width, height: height)
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
                          Container(
                            width: 70,
                            padding: EdgeInsets.only(bottom: 7,top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "Day(s)", letterSpacing: 0.3),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Main_Theme_textColor_tir_Condition.withOpacity(0.7)
                                    //   border: Border.all(
                                    //     color: Main_Theme_textColor.withOpacity(0.7),
                                    //   )
                                  ),
                                  alignment: Alignment.center,
                                  child: CustomText(fontSize: font12header, fontWeight: FontWeight.w600, text: "${totalDate}", letterSpacing: 0.3),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Form(
                      key: _formkey,
                        child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Main_Theme_textColor.withOpacity(0.3),
                                      width: 1
                                  )
                              )
                          ),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: Main_Theme_textColor,
                                fontSize: 15,fontWeight: FontWeight.w500
                                ,letterSpacing: 0.2

                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter  numbers only";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //  label:CustomText(fontSize: 10, fontWeight: FontWeight.w500, text: '$hinttext', letterSpacing: 0.2),
                              labelStyle: GoogleFonts.poppins(
                                  color: Main_Theme_textColor.withOpacity(0.7),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5
                              ),
                              errorStyle: TextStyle(
                                fontSize: 0.1,
                              ),
                              labelText: 'Duty carried by',
                              contentPadding: EdgeInsets.only(
                                  bottom: 10, top: 0,left: 0),
                              /// prefix icon ///
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Main_Theme_textColor.withOpacity(0.3),
                                      width: 1
                                  )
                              )
                          ),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: Main_Theme_textColor,
                                fontSize: 15,fontWeight: FontWeight.w500
                                ,letterSpacing: 0.2

                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter  numbers only";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //  label:CustomText(fontSize: 10, fontWeight: FontWeight.w500, text: '$hinttext', letterSpacing: 0.2),
                              labelStyle: GoogleFonts.poppins(
                                  color: Main_Theme_textColor.withOpacity(0.7),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5
                              ),
                              errorStyle: TextStyle(
                                fontSize: 0.1,
                              ),
                              labelText: 'Comments here',
                              contentPadding: EdgeInsets.only(
                                  bottom: 10, top: 0,left: 0),
                              /// prefix icon ///
                            ),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: apps_div_margin+5,),
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
                          ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "File Types: .jpg / .png", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

                        ],
                      ),
                    ),
                    SizedBox(height: apps_div_margin-5,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: CustomButton(onTap: () {


                          if(totalDate.isNegative){
                            customNotification(context, "Your formDate must less from to Date", "Please try again");
                            selectedformDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
                            selectedtoDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
                            totalDate=1;
                          } else{
                            Provider.of<SelfDashboardController>(context,listen: false).selfAdminSaveLeaveRegisterProvider(
                                "${get_status}",
                                "$totalDate",
                                "${DateFormat("dd-MMM-yyyy").format(DateFormat("dd-MMM-yyyy").parse("$selectedformDatee"))}",
                                "${DateFormat("dd-MMM-yyyy").format(DateFormat("dd-MMM-yyyy").parse("$selectedtoDatee"))}",
                                "${DateFormat("dd-MMM-yyyy").format(DateTime.now())}",
                                "N",
                                "0",
                                "N",
                                //  "${get_status[0]["LeaveAbbre"]}",
                                "${_commentsController.text}",
                                "",
                                "1001",
                                "${GetStorage().read("mobile_id")}",
                                "${selfORAdminShortInformationdata["StaffCategory"]}",
                                "${GetStorage().read("user_type_id")}",
                                context);
                          }

                        }, text: "Apply", fontWeight: FontWeight.w600, button_text_fontSize: fontTitle, button_height: 40,
                            custom_button_collor: CustomButtonColor.withOpacity(0.3), button_text_color: CustomButtonColor, borderRadius: 50),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );

  }
  List lista=[
    "1",
    "1",
    "1",
    "1",
  ];
  /// From Date-----------------------------------------------------------------------------------------
  String selectedformDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  String A = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  Future<void> _selectformDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedformDatee) {
      final df = new DateFormat('dd-MMM-yyyy');
      final dff = new DateFormat('yyyy-MM-dd');
      setState(() {
        selectedformDatee = df.format(picked);
        A=dff.format(picked);
      });
    }
  }

  /// To Date-----------------------------------------------------------------------------------------
  String selectedtoDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
  String B = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  DateTime ? fromtime;
  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedtoDatee) {
      final df = new DateFormat('dd-MMM-yyyy');
      final dff = new DateFormat('yyyy-MM-dd');
      setState(() {
        selectedtoDatee = df.format(picked);
        B=dff.format(picked);
        DayCalculation();
      });
    }
  }
  int totalDate=1;
  /// Date Calculation......................
  DayCalculation() {
    DateTime dt1 = DateTime.parse("${B}");
    DateTime dt2 = DateTime.parse("${A}");
    Duration diff = dt1.difference(dt2);
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ${diff.inDays}");
//output (in days): 1198
    setState(() {
      totalDate = int.parse("${diff.inDays}")+1;
      if(totalDate.isNegative){
      //  customNotification(context, "Your formDate must less from to Date", "Please try again");
        quickAlertsuccess(context, "Warning for you", "Your formDate must less from toDate",2);
      selectedformDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
      selectedtoDatee = DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString();
        totalDate=1;
      } else{

      }
    });
  }

  int daysBetween_wrong1(DateTime date1, DateTime date2) {
    return date1.difference(date2).inDays;
  }
}


