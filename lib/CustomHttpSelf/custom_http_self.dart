


import 'dart:convert';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';

import '../CustomWidget/CustomText/custom_text.dart';
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

        ElegantNotification(
          borderRadius: BorderRadius.circular(11),
          width: 380,
          iconSize: 25,
          background: presentsent_color,
          progressIndicatorBackground: presentsent_color,
          progressIndicatorColor: absent_color,
          // position: Alignment.center,
          title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text:
          "${selfCheckInCheckOut["status"]}",
              letterSpacing: 0.3, textColor: Main_Theme_textColor),
          description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks from JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
          onDismiss: () {
            print('Message when the notification is dismissed');
          }, icon: Icon(Icons.info_outlined,color:Colors.black,),
        ).show(context);
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
         for(int i=0;i<31;i++){
           final tempobj = Updated_attendance_summary();
           tempobj.date = "${i}";
           tempobj.Status = " ";
           int tempday = 0;
            for(var item in monthlyAttendanceSummary){
              tempday = int.parse("${item["DUTY_DATE"].substring(0, 2)}");
              if(tempday==i){
                print("duty date:${int.parse("${item["DUTY_DATE"].substring(0, 2)}")}");
                tempobj.Status = "${item["STATUS"]}";
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























}