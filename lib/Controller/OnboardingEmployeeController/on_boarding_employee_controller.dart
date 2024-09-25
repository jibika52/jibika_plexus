import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class OnboardingEmployeeController with ChangeNotifier{

  ///   GetVehicle List-------------------------------------------------------------------------
  dynamic GetShiftPlanNWeekendList;
  GetShiftPlanNWeekendListProvider(String UserId,BuildContext context)async{
    GetShiftPlanNWeekendList =await CustomHttpRequestClass().GetShiftPlanNWeekendListHttpFunction(UserId,context);
    notifyListeners();
  }
  ///   GetVehicle List-------------------------------------------------------------------------
  dynamic GetDepartmentNDesinationList;
  GetDepartmentNDesinationListProvider(String UserId,BuildContext context)async{
    GetDepartmentNDesinationList =await CustomHttpRequestClass().GetDepartmentNDesinationListHttpFunction(UserId,context);
    notifyListeners();
  }


}