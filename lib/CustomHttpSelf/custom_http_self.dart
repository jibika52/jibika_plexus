


import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
class CustomHttpSelf{

  ///  header Parts
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };

  ///  self Dashboard Check In Check Out --------------------------------------------------------------------------
  selfCheckInCheckOut(String UserId,String AttendanceDate, String AttendanceTime, String RefCardNo, String Location, String District, String Division, String PostalCode, String SubLocality, String StreetName, String lat,  String lng, int Empcode,  BuildContext context)async{
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
      "Empcode": Empcode
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
      });
      return selfCheckInCheckOut;
    }
    catch(e){
      print("selfCheckInCheckOut Catch error ${e}");
    }
  }
}