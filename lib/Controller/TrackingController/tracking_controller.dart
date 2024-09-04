import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class TrackingController with ChangeNotifier{

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic EmployeeLocaltionInfoList;
  GetEmployeeLocaltionInfoProvider(String UserId,String AttDate, BuildContext context)async{
    EmployeeLocaltionInfoList =await CustomHttpRequestClass().GetEmployeeLocaltionInfoHttpFunction(UserId,AttDate,context);
    notifyListeners();
  }
}