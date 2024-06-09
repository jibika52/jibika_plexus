

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';

class CustomHttpRequestClass{

  ///  header Parts
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };




  ///--------- PRIVACY POLICY ------------///
  Future<List> Trancations(int w_valu) async {
    List trancations=[];
    try{
      var response = await http.get(
        Uri.parse('${BASEURL}/api/transactions?wallet=${w_valu}'),
        headers:headers,
      );
      //  print("Transactionsssssssssssssssss ${response.body}");
      var data =  jsonDecode(response.body);
      trancations=data["data"];
    }catch(e){
      print("Transection catch error $e");
    }
    return trancations;
  }



}