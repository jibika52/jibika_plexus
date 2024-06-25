

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
import 'package:jibika_plexus/Model/PrivacyPolicyModelClass/privacy_policy_model_class.dart';

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


 //     print("Privacy Policy --------------------->>>>  $data");
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



}