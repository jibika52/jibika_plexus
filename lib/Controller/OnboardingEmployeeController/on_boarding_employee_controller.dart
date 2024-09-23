import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class OnboardingEmployeeController with ChangeNotifier{

  ///   GetVehicle List-------------------------------------------------------------------------
  dynamic GetShiftPlanNWeekendList;
  GetShiftPlanNWeekendListProvider(String UserId,BuildContext context)async{
    GetShiftPlanNWeekendList =await CustomHttpRequestClass().GetShiftPlanNWeekendListHttpFunction(UserId,context);
    notifyListeners();
  }
}