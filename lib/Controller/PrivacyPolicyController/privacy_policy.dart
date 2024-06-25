import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';

import '../../Model/PrivacyPolicyModelClass/privacy_policy_model_class.dart';

class PrivacyPolicyProvider with ChangeNotifier{


  /// Privacy Policy Provider
  List<Rows> prvacyPolicylist =[];
  getPrivacyPolicyProvider(String privacyPolicyType)async{
    prvacyPolicylist=await CustomHttpRequestClass().prvacyPolicylist(privacyPolicyType);
    notifyListeners();
}


}