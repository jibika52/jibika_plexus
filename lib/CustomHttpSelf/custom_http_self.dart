


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
  selfCheckInCheckOut(String UserId,String AttendanceDate, String AttendanceTime, String RefCardNo, String Location, String District, String Division, String PostalCode, String SubLocality, String StreetName, String lat,  String lng, int Empcode, String DutyDate,String Remarks, BuildContext context)async{
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
      "Remarks" : "$Remarks"
    });

    try{
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
        // ElegantNotification(
        //   borderRadius: BorderRadius.circular(11),
        //   width: 380,
        //   iconSize: 25,
        //   background: presentsent_color,
        //   progressIndicatorBackground: presentsent_color,
        //   progressIndicatorColor: absent_color,
        //   // position: Alignment.center,
        //   title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text:
        //   "${selfCheckInCheckOut["status"]}",
        //       letterSpacing: 0.3, textColor: Main_Theme_textColor),
        //   description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks from JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
        //   onDismiss: () {
        //     print('Message when the notification is dismissed');
        //   }, icon: Icon(Icons.info_outlined,color:Colors.black,),
        // ).show(context);
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
  selfOneMonthAttendanceFunction(String UserId,String AttendanceDate, String RefCardNo, String attendanceType,BuildContext context)async{

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
         for(int i=1;i<32;i++){
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



















}