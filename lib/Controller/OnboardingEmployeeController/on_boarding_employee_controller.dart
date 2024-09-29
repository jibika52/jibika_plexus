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
  ///   GetVehicle List-------------------------------------------------------------------------
  dynamic GetEmployeeByIdList;
  GetEmployeeByIdListProvider(String ID_CARD_NO,String UserId,BuildContext context)async{
    GetEmployeeByIdList =await CustomHttpRequestClass().GetEmployeeByIdListHttpFunction(ID_CARD_NO,UserId,context);
    notifyListeners();
  }


}