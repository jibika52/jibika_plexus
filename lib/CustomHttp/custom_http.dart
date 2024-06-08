

import 'package:get_storage/get_storage.dart';

class CustomHttpRequestClass{

  ///  header Parts
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };





}