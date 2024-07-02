

import 'dart:convert';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Model/PrivacyPolicyModelClass/privacy_policy_model_class.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../View/Auth/OtpScreen/otp_screen.dart';

class CustomHttpRequestClass{

  ///  header Parts
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };




  ///--------- PRIVACY POLICY ------------///
  prvacyPolicylist(String privacyPolicytype) async {
    List<Rows>prvacyPolicylist=[];
    try{
      var response = await http.post(
        Uri.parse('${BASEURL}/${PRIVACY_POLICY}'),
        headers:headers,
      );
      Rows privacyPolicyModelClass;
      if(response.statusCode==200){
        var data =  jsonDecode(response.body);
        for(var i in data["rows"]){
           privacyPolicyModelClass = Rows.fromJson(i);
            prvacyPolicylist.add(privacyPolicyModelClass);
          print("prvacyPolicylist------------------------------: ${prvacyPolicylist}");
        }
      }
    //+  prvacyPolicylist=data["rows"];
    }catch(e){
      print("privacy Policy Error catch error $e");
    }
    return prvacyPolicylist;
  }


  ///           OTP send Function --------------------------------------------------
   sendOtpFunction(
        String package,
        BuildContext context,
        String   mobileNumber,
        String   companytype,
        String   companyname,
        String   companyAddress,
        String   noOfEmployee,
        String  companyEmail,
        String   password,
        String previous_route_name,

       )async{
    Response response=await http.get(Uri.parse("${BASEURL}/${SEND_OTP}$mobileNumber"));
    print(response.statusCode);
    var data=jsonDecode(response.body);
    print("ccccccccccccccccccccccccccccc ${data}");
    if(response.statusCode==200 && data["status"]=="Message has been sent."){
      previous_route_name=="resend"?f():   Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(
        package: "${package}",
        companytype :"${companytype}",
        companyname:"${companyname}",
        companyAddress:"${companyAddress}",
        noOfEmployee:"${noOfEmployee}",
        mobileNumber:"${mobileNumber}",
        companyEmail:"${companyEmail}",
        password:"${password}",
        previous_route_name:"${previous_route_name}",
      ),),);
    }else{
      // Flushbar(
      //   backgroundColor: presentsent_color,
      //   flushbarPosition: FlushbarPosition.TOP,
      //   messageColor: Main_Theme_textColor,
      //   titleColor: Main_Theme_textColor,
      //   icon: Icon(Icons.info_outlined,color:Colors.black,),
      //   messageSize: 16,
      //   title:  "Could not send OTP",
      //   message:  "Please check your mobile number",
      //   duration:  Duration(seconds: 3),
      // )..show(context);

      ElegantNotification(
        borderRadius: BorderRadius.circular(11),
        width: 380,
        iconSize: 25,
        background: presentsent_color,
       progressIndicatorBackground: presentsent_color,
       progressIndicatorColor: absent_color,
       // position: Alignment.center,
        title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Could not send OTP", letterSpacing: 0.3, textColor: Main_Theme_textColor),
        description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please check your mobile number", letterSpacing: 0.3, textColor: Main_Theme_textColor),
     onDismiss: () {
          print('Message when the notification is dismissed');
        }, icon: Icon(Icons.info_outlined,color:Colors.black,),
      ).show(context);
    }
   }



  ///           Company Registration  --------------------------------------------------
   companyRegistrationFunction(String mobileNumber)async{
    try{
      Response response=await http.post(Uri.parse("http://45.114.84.22:8081/useridentity/registration"),
          body:
      jsonEncode(
         {
            "EnglishDesc":"JIBIKA",
            "BusinessType":"1",
            "Address":"Jumuna Future Park",
            "EmpSize":"100",
            "Mobile":"0188973335",
            "GroupMail":"uzzal@gmail.com",
            "PackageType":"small",
            "NewPassword":"123456789",
            "ConPassword":"123456789",
            "Otp":"8296"
          }
      ));

    print("registration -----------------------------> ${response.body}");
    print("registration -----------------------------> ${response.statusCode}");

   }catch(e){
      print("Catch error $e");
    }
  }
}

f(){}