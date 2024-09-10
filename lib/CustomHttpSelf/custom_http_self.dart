


import 'dart:convert';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';

import '../CustomWidget/CustomText/custom_text.dart';
import '../Model/EmpoyeeLeaveStatusModelClass/employee_leave_model_class.dart';
import '../Utils/constants.dart';
import '../ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';
class CustomHttpSelf{

  ///  header Parts
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };





  ///  self Dashboard Check In Check Out --------------------------------------------------------------------------
  ///
  ///
  selfCheckInCheckOut(String UserId,String AttendanceDate, String AttendanceTime, String RefCardNo, String Location,
      String District, String Division, String PostalCode, String SubLocality, String StreetName, String lat,
      String lng, int Empcode, String DutyDate,String Remarks,
      String IsTrack,
      )async{

    print("$UserId---$AttendanceDate---$AttendanceTime---$RefCardNo---$Location---$lng---$Empcode---$DutyDate---$Remarks---"
        "$District---$Division---$PostalCode---$SubLocality---$StreetName---$lat---$IsTrack---");

    dynamic selfCheckInCheckOut ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "AttendanceDate":"$AttendanceDate",
      "AttendanceTime":"$AttendanceTime",
      "RefCardNo" : "$RefCardNo",
      "Location" : "$Location",
      "District" : "$District",
      "Division" : "$Division",
      "PostalCode" : "$PostalCode",
      "SubLocality": "$SubLocality",
      "StreetName" : "$StreetName",
      "lat" : "$lat",
      "lng" : "$lng",
      "Empcode": Empcode,
      "DutyDate" : "$DutyDate",
      "Remarks" : "$Remarks",
      "IsTrack":"$IsTrack"
    });

    try{
      print("Check ------------------------------------- Status----------------------------------");
      var data=await http.post(Uri.parse("${BASEURL}/${SelfCheckInCheckOut}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        selfCheckInCheckOut =jsonDecode(response.body);
        print("ssssssssssssssssssssssssssssssssss ${selfCheckInCheckOut["status"]}");
      });
      return selfCheckInCheckOut;
    }
    catch(e){
      print("selfCheckInCheckOut Catch error ${e}");
    }
  }








  ///  self Dashboard self OneMonth Attendance List --------------------------------------------------------------------------
  ///
  ///
  selfOneMonthAttendanceFunction(
      int yyyy,
      int MMMM,
      int dd,
      String UserId,String AttendanceDate, String RefCardNo, String attendanceType,BuildContext context)async{

    dynamic monthlyAttendanceSummary;
    List<Updated_attendance_summary> newdatalist = [];
    print("${UserId} $AttendanceDate $RefCardNo $attendanceType");
    var body = jsonEncode({
        "UserId":"$UserId",
        "AttDate" : "$AttendanceDate",
        "ID_CARD_NO":"$RefCardNo",
        "attendanceType" : "$attendanceType"
        });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${SelfGetMonthlyAttendanceList}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
         monthlyAttendanceSummary = jsonDecode(response.body)["data"];
        // for(int i=1;i<DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day+1;i++){
           for(int i=1;i<DateTime(yyyy,MMMM + 1, 0).day+1;i++){
           final tempobj = Updated_attendance_summary();
           tempobj.date = "${i}";
           tempobj.Status = "No Punch";
           tempobj.iNTIME ="--:--:--";
           tempobj.oUTTIME="--:--:--";
           tempobj.lATE=" ";
           tempobj.aCTUALWORKDURATION=" ";
           tempobj.oT=" ";
           tempobj.sHIFTPLAN=" ";
           tempobj.aTTENDANCEREMARK=" ";
           tempobj.mOVEMENTPUNCH=" ";
           tempobj.IN_LATITUDE=" ";
           tempobj.IN_LONGITUDE=" ";
           tempobj.IN_LOCNAME=" ";
           tempobj.IN_DISTRICT=" ";
           tempobj.IN_STREET_NAME=" ";
           tempobj.IN_DIVISION=" ";
           tempobj.OUT_LATITUDE=" ";
           tempobj.OUT_LONGITUDE=" ";
           tempobj.OUT_LOCNAME=" ";
           tempobj.OUT_DISTRICT=" ";
           tempobj.OUT_STREET_NAME=" ";
           tempobj.OUT_DIVISION=" ";
           tempobj.SHIFT_IN_TIME=" ";
           tempobj.SHIFT_OUT_TIME=" ";
           tempobj.ATTENDANCE_START_TIME=" ";

           int tempday = 0;
            for(var item in monthlyAttendanceSummary){
              tempday = int.parse("${item["DUTY_DATE"].substring(0, 2)}");
              if(tempday==i){
                print("duty date:${int.parse("${item["DUTY_DATE"].substring(0, 2)}")}");
                tempobj.Status = "${item["STATUS"]}";
                  tempobj.iNTIME ="${item["IN_TIME"]}"==""?"--:--:--" : "${item["IN_TIME"].substring(12, 20)}";
                  tempobj.oUTTIME="${item["OUT_TIME"]}"==""?"--:--:--" : "${item["OUT_TIME"].substring(12, 20)}";
                  tempobj.lATE= "${item["LATE"]}";
                  tempobj.aCTUALWORKDURATION= "${item["ACTUAL_WORK_DURATION"]}";
                  tempobj.oT= "${item["OT"]}";
                  tempobj.sHIFTPLAN= "${item["SHIFT_PLAN"]}";
                  tempobj.aTTENDANCEREMARK= "${item["ATTENDANCE_REMARK"]}";
                  tempobj.mOVEMENTPUNCH ="${item["MOVEMENT_PUNCH"]}";
                  tempobj.IN_LATITUDE="${item["IN_LATITUDE"]}";
                  tempobj.IN_LONGITUDE="${item["IN_LONGITUDE"]}";
                  tempobj.IN_LOCNAME="${item["IN_LOCNAME"]}";
                  tempobj.IN_DISTRICT="${item["IN_DISTRICT"]}";
                  tempobj.IN_STREET_NAME="${item["IN_STREET_NAME"]}";
                  tempobj.IN_DIVISION="${item["IN_DIVISION"]}";
                  tempobj.OUT_LATITUDE="${item["OUT_LATITUDE"]}";
                  tempobj.OUT_LONGITUDE="${item["OUT_LONGITUDE"]}";
                  tempobj.OUT_LOCNAME="${item["OUT_LOCNAME"]}";
                  tempobj.OUT_DISTRICT="${item["OUT_DISTRICT"]}";
                  tempobj.OUT_STREET_NAME="${item["OUT_STREET_NAME"]}";
                  tempobj.OUT_DIVISION="${item["OUT_DIVISION"]}";
                  tempobj.SHIFT_IN_TIME="${item["SHIFT_IN_TIME"]}";
                  tempobj.SHIFT_OUT_TIME="${item["SHIFT_OUT_TIME"]}";
                  tempobj.ATTENDANCE_START_TIME="${item["ATTENDANCE_START_TIME"]}";
              }
            }
                newdatalist.add(tempobj);
         }
         return newdatalist;
      });

     return newdatalist;
    }
    catch(e){
      print("selfOneMonthAttendanceList Catch error ${e}");
    }
  }




  ///  Admin Or Self (Employee Short Information/Description) --------------------------------------------------------------------------
  selfORAdminShortDescription(String UserId,String ID_CARD_NO, BuildContext context)async{
    dynamic self_OR_Admin_Short_Description ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "ID_CARD_NO":"$ID_CARD_NO"
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_Short_Description}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        self_OR_Admin_Short_Description =jsonDecode(response.body)["data"];
      });
      return self_OR_Admin_Short_Description;
    }
    catch(e){
      print("self_OR_Admin_Short_Description Catch error  ============================ ${e}");
    }
  }

  ///  Leave allocation --------------------------------------------------------------------------
  selfLeaveAllocation(String UserId, String EMPCODE, BuildContext context)async{
    dynamic  selfLeaveAllocationList  ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "EMPCODE":"$EMPCODE"
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_Leave_Allocation}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        selfLeaveAllocationList =jsonDecode(response.body)["data"];

      });
      return selfLeaveAllocationList;
    }
    catch(e){
      print("self Leave Allocation Catch error ============================ ${e}");
    }
  }



  ///  Self Or Admin Get Leave Early Count --------------------------------------------------------------------------
    selfAdminGetLeaveEarlyCount(String UserId, String EMPCODE, BuildContext context)async{
    dynamic  selfAdminGetLeaveEarlyCountList  ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "EMPCODE":"$EMPCODE"
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_Get_Leave_Register_By_Employee}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        selfAdminGetLeaveEarlyCountList =jsonDecode(response.body)["data"];

      });
      return selfAdminGetLeaveEarlyCountList;
    }
    catch(e){
      print(" self Or Admin Get Leave Early Count Catch error ============================ ${e}");
    }
  }



  ///  Self Or Admin Get selfAdminAdmin Get Monthly Att SummaryCountList Count --------------------------------------------------------------------------
    selfAdminAdmin_Get_Monthly_Att_SummaryCount( String SUMMARY_MONTH, BuildContext context)async{
    dynamic  selfAdminAdmin_Get_Monthly_Att_SummaryCountList  ;
    var body = jsonEncode({
      "UserId":"${GetStorage().read("mobile_id")}",
      "ID_CARD_NO":"${GetStorage().read("IdCardNo")}",
        "attendanceType" : "GENERAL",
        "SUMMARY_MONTH": "$SUMMARY_MONTH"
    });
    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_Get_Monthly_Att_Summary_By_Employee}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        selfAdminAdmin_Get_Monthly_Att_SummaryCountList =jsonDecode(response.body)["data"];

      });
      return selfAdminAdmin_Get_Monthly_Att_SummaryCountList;
    }
    catch(e){
      print(" self Or Admin Get selfAdminAdmin_Get_Monthly_Att_SummaryCountList Count Catch error ============================ ${e}");
    }
  }



  ///  self Admin_Get_Emp_New_Face_Get --------------------------------------------------------------------------
    selfAdminAdmin_Get_Emp_New_Face_Get()async{
    dynamic  selfAdminAdmin_Emp_New_Face_GetList  ;
    var body = jsonEncode({
      "UserId":"${GetStorage().read("mobile_id")}",
    });
    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_GetEmpNewFaceList_By_Employee}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        selfAdminAdmin_Emp_New_Face_GetList =jsonDecode(response.body)["data"];

        print("-----------------------------$selfAdminAdmin_Emp_New_Face_GetList");
      });
      return selfAdminAdmin_Emp_New_Face_GetList;
    }
    catch(e){
      print(" self Or Admin Get selfAdminAdmin_selfAdminAdmin_Emp_New_Face_GetList Catch error ============================ ${e}");
    }
  }




  ///  Save Leave Register By Employee --------------------------------------------------------------------------
    selfAdminSaveLeaveRegister_By_Employee(
        String LEAVETYPECODE,String LEAVEDAYS,String FROMDATE,
        String TODATE,String APPLYDATE,String HALFDAY,String HOLIDAYFOND,
        String ATEENBONUSFLAG,String LEAVEREASON,String ADDRESSDURINGLEAVE,
        String DUTYCARRIEDOUTBY,String MOBILENO,
        String STAFFCATEGORYCODE,String USERTYPEID, BuildContext context)async{

  print("AAAAAAAAAAAAAAAA===> ${GetStorage().read("mobile_id")}",);
  print("AAAAAAAAAAAAAAAA===> ${GetStorage().read("IdCardNo")}",);
  print("AAAAAAAAAAAAAAAA===> ${GetStorage().read("Empcode")}",);
  print("AAAAAAAAAAAAAAAA= LEAVETYPECODE==> ${LEAVETYPECODE}",);
  print("AAAAAAAAAAAAAAAA=LEAVEDAYS==> ${LEAVEDAYS}",);
  print("AAAAAAAAAAAAAAAA==FROMDATE=> ${FROMDATE}",);
  print("AAAAAAAAAAAAAAAA=TODATE==> ${TODATE}",);
  print("AAAAAAAAAAAAAAAA=APPLYDATE==> ${APPLYDATE}",);
  print("AAAAAAAAAAAAAAAA=HALFDAY==> ${HALFDAY}",);
  print("AAAAAAAAAAAAAAAA==HOLIDAYFOND=> ${HOLIDAYFOND}",);
  print("AAAAAAAAAAAAAAAA==ATEENBONUSFLAG=> ${ATEENBONUSFLAG}",);
  print("AAAAAAAAAAAAAAAA==LEAVEREASON=> ${LEAVEREASON}",);
  print("AAAAAAAAAAAAAAAA=ADDRESSDURINGLEAVE==> ${ADDRESSDURINGLEAVE}",);
  print("AAAAAAAAAAAAAAAA==DUTYCARRIEDOUTBY=> ${DUTYCARRIEDOUTBY}",);
  print("AAAAAAAAAAAAAAAA=MOBILENO==> ${MOBILENO}",);
  print("AAAAAAAAAAAAAAAA=STAFFCATEGORYCODE==> ${STAFFCATEGORYCODE}",);
  print("AAAAAAAAAAAAAAAA=USERTYPEID==> ${USERTYPEID}",);

    dynamic  SaveLeaveRegister  ;
    var body = jsonEncode({
        "USERID":"${GetStorage().read("mobile_id")}",
        "IDCARDNO":"${GetStorage().read("IdCardNo")}",
        "EMPCODE" : "${GetStorage().read("Empcode")}",
        "LEAVETYPECODE": "$LEAVETYPECODE",
        "LEAVEDAYS":"$LEAVEDAYS",
        "FROMDATE":"$FROMDATE",
        "TODATE":"$TODATE",
        "APPLYDATE":"$APPLYDATE",
        "HALFDAY":"$HALFDAY",
        "HOLIDAYFOND":"$HOLIDAYFOND",
        "ATEENBONUSFLAG":"$ATEENBONUSFLAG",
        "LEAVEREASON":"$LEAVEREASON",
        "ADDRESSDURINGLEAVE" : "$ADDRESSDURINGLEAVE",
        "DUTYCARRIEDOUTBY":"$DUTYCARRIEDOUTBY",
        "MOBILENO": "$MOBILENO",
        "STAFFCATEGORYCODE" : "$STAFFCATEGORYCODE",
        "USERTYPEID" : "$USERTYPEID"
    });
    try{
      var data=await http.post(Uri.parse("${BASEURL}/${Self_Admin_SaveLeaveRegister_By_Employee}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        SaveLeaveRegister =jsonDecode(response.body);
        print(" sydgf gsudf usd fsdf gusyd=====================>   ${SaveLeaveRegister}");
        ElegantNotification(
          borderRadius: BorderRadius.circular(11),
          width: 380,
          iconSize: 25,
          background: presentsent_color,
          progressIndicatorBackground: presentsent_color,
          progressIndicatorColor: absent_color,
          // position: Alignment.center,
          title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "${SaveLeaveRegister["status"]}", letterSpacing: 0.3, textColor: Main_Theme_textColor),
          description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks for Apply", letterSpacing: 0.3, textColor: Main_Theme_textColor),
          onDismiss: () {
            print('Message when the notification is dismissed');
          }, icon: Icon(Icons.info_outlined,color:Colors.black,),
        ).show(context);
      });
      return SaveLeaveRegister;
    }
    catch(e){
      print(" self Or Admin Save Leave Registert Catch error ============================ ${e}");
    }
  }





  ///  Create Conveyance --------------------------------------------------------------------------
    createConveyance_By_Employee(
        String AttendanceDate,
        String AttendanceTime,
        String Location,
        String District,
        String Division,
        String PostalCode,
        String SubLocality,
        String StreetName,
        String lat,
        String lng,
        int Empcode,
        String Note,
        String IsTrack,
        int Amount,
        int VehicleType,
        int Code,
        int Distance,
        BuildContext context
        )async{

    dynamic  SaveLeaveRegister  ;
    var body = jsonEncode({
      "UserId":"${GetStorage().read("mobile_id")}",
      "AttendanceDate":"$AttendanceDate",
      "AttendanceTime":"$AttendanceTime",
      "RefCardNo" : "${GetStorage().read("RfIdCardNo")}",
      "Location" : "$Location",
      "District" : "$District",
      "Division" : "$Division",
      "PostalCode" : "$PostalCode",
      "SubLocality": "$SubLocality",
      "StreetName" : "$StreetName",
      "lat" : "$lat",
      "lng" : "$lng",
      "Empcode": Empcode,
      "Note" : "$Note",
      "IsTrack":"$IsTrack",
      "Amount": Amount,
      "VehicleType": VehicleType,
      "Code":Code,
      "Distance" :Distance
    });
    try{
      var data=await http.post(Uri.parse("${BASEURL}/${SaveConveyance}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        SaveLeaveRegister =jsonDecode(response.body);
        GetStorage().write("for_end_conveyance_code", "${SaveLeaveRegister["code"]}");
      });
      return SaveLeaveRegister;
    }
    catch(e){
      print(" Create Conveyance Catch error ============================ ${e}");
    }
  }
























}