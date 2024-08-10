

import 'dart:convert';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Model/DashboardEmployeeLeaveListModel/dashboard_employee_leave_list_model.dart';
import 'package:jibika_plexus/Model/PrivacyPolicyModelClass/privacy_policy_model_class.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:provider/provider.dart';

import '../View/Auth/LoginScreen/login_screen_screen2.dart';
import '../View/Auth/OtpScreen/otp_screen.dart';
import '../ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';

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
      //    print("prvacyPolicylist------------------------------: ${prvacyPolicylist}");
        }
      }
    //+  prvacyPolicylist=data["rows"];
    }catch(e){
      print("privacy Policy Error catch error $e");
    }
    return prvacyPolicylist;
  }

  ///           OTP send Function --------------------------------------------------
   sendOtpFunction(String package, BuildContext context, String mobileNumber, String companytype, String companyname, String companyAddress, String noOfEmployee, String companyEmail, String password, String previous_route_name,) async{
    Response response=await http.get(Uri.parse("${BASEURL}/${SEND_OTP}$mobileNumber"));
    print(response.statusCode);
    var data=jsonDecode(response.body);
    print("ccccccccccccccccccccccccccccc ${data}");
    Provider.of<CounterProvider>(context,listen: false).eetOTP(data["otp"]);
    if(response.statusCode==200 && data["status"]=="Message has been sent."){
      previous_route_name=="resend"?f():   Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(package: "${package}", companytype :"${companytype}", companyname:"${companyname}", companyAddress:"${companyAddress}", noOfEmployee:"${noOfEmployee}", mobileNumber:"${mobileNumber}", companyEmail:"${companyEmail}", password:"${password}", previous_route_name:"${previous_route_name}",),),);
    }else{
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
   companyRegistrationFunction(String package, BuildContext context, String   mobileNumber, String   companytype, String   companyname, String   companyAddress, String   noOfEmployee, String  companyEmail, String   password, String OTP,)async{
    try{
          var body = jsonEncode({
            "EnglishDesc":"$companyname",
            "BusinessType":"$companytype",
            "Address":"$companyAddress",
            "EmpSize":int.parse("${noOfEmployee}"),
            "Mobile":"$mobileNumber",
            "GroupMail":"$companyEmail",
            "PackageType":"$package",
            "NewPassword":"$password",
            "ConPassword":"$password",
            "Otp":"$OTP"
          });
   var data=await http.post(Uri.parse("${BASEURL}/${REGISTRATION}"),
          headers: {"Content-Type": "application/json"},
          body: body
      ).then((http.Response response) {
        var registration =jsonDecode(response.body);

        if(response.statusCode==200 && registration["msg"]=="success"){
          ElegantNotification(
            borderRadius: BorderRadius.circular(11),
            width: 380,
            iconSize: 25,
            background: presentsent_color,
            progressIndicatorBackground: presentsent_color,
            progressIndicatorColor: absent_color,
            // position: Alignment.center,
            title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Registration Successful", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks from JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            onDismiss: () {
              print('Message when the notification is dismissed');
            }, icon: Icon(Icons.info_outlined,color:Colors.black,),
          ).show(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenSlide(),));
        }
      }
      );
   }catch(e){
      print("Catch error $e");
    }
  }

  ///           Login as Employee  --------------------------------------------------------------------------
  loginEmployee(String phone,String password, BuildContext context)async{
    try{
      var body = jsonEncode({
        "UserId":"$phone",
        "UserPass":"$password",
      });
      var data=await http.post(Uri.parse("${BASEURL}/${LOGIN}"),
          headers: {
        "Content-Type": "application/json",
        "username": "jibikaapps",
        "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        print(response.statusCode);
        print(response.body);
        var loginData =jsonDecode(response.body);
        if(response.statusCode==200 && loginData["msg"]=="success"){
          GetStorage().write("id_token",loginData["id_token"]) ;
          GetStorage().write("refresh_token",loginData["refresh_token"]) ;
          GetStorage().write("Company_name",loginData["Company"]) ;
          GetStorage().write("RfIdCardNo",loginData["RfIdCardNo"]) ;
          GetStorage().write("Empcode",loginData["Empcode"]) ;
          GetStorage().write("user_type_id",loginData["user_type_id"]) ;
          //   print("$loginData");
          ElegantNotification(
            borderRadius: BorderRadius.circular(11),
            width: 340,
            iconSize: 25,
            background: presentsent_color,
            progressIndicatorBackground: presentsent_color,
            progressIndicatorColor: absent_color,
            // position: Alignment.center,
            title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Login Successful", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks, JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            onDismiss: () {
              print('Message when the notification is dismissed');
            }, icon: Icon(Icons.info_outlined,color:Colors.black,),
          ).show(context);

          if(GetStorage().read("id_token")!=null && GetStorage().read("user_type_id")==1001){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(),));
          }

          else if(GetStorage().read("id_token")!=null && GetStorage().read("user_type_id")==1003){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SalfBootomNatchBarScreen(currentIndex: 4),));
          }else{
            print("AAA");
          }
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(),));
        }else{
          ElegantNotification(
            borderRadius: BorderRadius.circular(11),
            width: 340,
            iconSize: 25,
            background: presentsent_color,
            progressIndicatorBackground: presentsent_color,
            progressIndicatorColor: absent_color,
            // position: Alignment.center,
            title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Wrong phone or Password", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please correct & try again", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            onDismiss: () {
              print('Message when the notification is dismissed');
            }, icon: Icon(Icons.delete_forever,color:Colors.black,),
          ).show(context);
        }
      }
      );
    }catch(e){
      print("Login employeee Catch error ${e}");
    }
  }


  ///           Home Dashboard Pichart Data get  --------------------------------------------------------------------------
  dashboardPieChartData(String UserId,String AttDate, BuildContext context)async{
    dynamic dashboardPieChartData;
    try{
      var body = jsonEncode({
        "UserId":"$UserId",
        "AttDate":"$AttDate"
      });
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardPieChartData}"),
          headers: {
        "Content-Type": "application/json",
        "username": "jibikaapps",
        "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardPieChartData =jsonDecode(response.body);
      }
      );
      return dashboardPieChartData;
    }catch(e){
      print("dashboardPieChartData Catch error ${e}");
    }
  }


  ///           Home Dashboard Pichart Data get  --------------------------------------------------------------------------
  dashboardBarChartData(String UserId,String AttDate,String PayrollMonth, BuildContext context)async{
    dynamic dashboardBarChartData;
    try{
      var body = jsonEncode({
        "UserId":"$UserId",
        "AttDate":"$AttDate",
        "PayrollMonth":"$PayrollMonth"
      });
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardBarChartData}"),
          headers: {
        "Content-Type": "application/json",
        "username": "jibikaapps",
        "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardBarChartData =jsonDecode(response.body);
      }
      );
      return dashboardBarChartData;
    }catch(e){
      print("dashboarBarChartData Catch error ${e}");
    }
  }



  ///           Home Dashboard On Leave Employee List --------------------------------------------------------------------------
  dashboardOnleaveEmployeeList(String UserId,String AttDate, BuildContext context)async{

    dynamic dashboardOnleaveEmployeeList ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "lvDate":"$AttDate"
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardLeaveInformation}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardOnleaveEmployeeList =jsonDecode(response.body)["lvinfo"];
      });
      return dashboardOnleaveEmployeeList;
          }
    catch(e){
      print("dashboardOnleaveEmployeeList Catch error ${e}");
    }
  }

  ///           Home Dashboard Employee Information  --------------------------------------------------------------------------
  dashboardEmployeeinfo(String UserId,String AttDate, BuildContext context)async{

    dynamic dashboardEmployeeinfo ;
    var body = jsonEncode({
      "UserId":"$UserId",
      "AttDate":"$AttDate"
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardEmployeeInf}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardEmployeeinfo =jsonDecode(response.body)["empinfo"];
      });
      return dashboardEmployeeinfo;
          }
    catch(e){
      print("dashboardEmployeeinfo Catch error ${e}");
    }
  }

  ///           Home Dashboard On Leave Employee List --------------------------------------------------------------------------
  dashboardTodaysBirthDayEmployeeinfo(String UserId,String AttDate, BuildContext context)async{

    dynamic dashboardtodaysBirthdayEmployeeinfo ;
    var body = jsonEncode({
      "UserId":"$UserId",
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardTodayBirthDay}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardtodaysBirthdayEmployeeinfo =jsonDecode(response.body)["brinfo"];
      });
      return dashboardtodaysBirthdayEmployeeinfo;
          }
    catch(e){
      print("dashboardtodaysBirthdayEmployeeinfo Catch error ${e}");
    }
  }


  ///  Home Dashboard Salary Comparison Chart List --------------------------------------------------------------------------
  dashboardComparisanChart(String UserId,String AttDate, BuildContext context)async{
    dynamic dashboardSalaryComparisanChartList ;
    var body = jsonEncode({
      "UserId":"$UserId",
    });

    try{
      var data=await http.post(Uri.parse("${BASEURL}/${HomeDashboardSalaryComparisonList}"),
          headers: {
            "Content-Type": "application/json",
            "username": "jibikaapps",
            "password": "20jibika24",
          },
          body: body
      ).then((http.Response response) {
        dashboardSalaryComparisanChartList =jsonDecode(response.body)["data"];
      });
      return dashboardSalaryComparisanChartList;
          }
    catch(e){
      print("dashboardSalaryComparisanChartList Catch error ${e}");
    }
  }







}














f(){}