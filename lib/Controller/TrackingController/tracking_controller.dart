import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class TrackingController with ChangeNotifier{

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic EmployeeLocaltionInfoList;
  GetEmployeeLocaltionInfoProvider(String UserId,String AttDate, BuildContext context)async{
    EmployeeLocaltionInfoList =await CustomHttpRequestClass().GetEmployeeLocaltionInfoHttpFunction(UserId,AttDate,context);
    notifyListeners();
  }

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic GetMovementTrackableEmployeeList;
  GetMovementTrackableEmployeeListProvider(String UserId,String AttDate, BuildContext context)async{
    GetMovementTrackableEmployeeList =await CustomHttpRequestClass().GetMovementTrackableEmployeeListHttpFunction(UserId,AttDate,context);
    notifyListeners();
  }

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic GetMovementTrackableEmployeeByDate;
  GetMovementTrackableEmployeeByDateProvider(String UserId,String AttDate,String ID_CARD_NO,BuildContext context)async{
    GetMovementTrackableEmployeeByDate =await CustomHttpRequestClass().GetMovementTrackableEmployeeByDateHttpFunction(UserId,AttDate,ID_CARD_NO,context);
    notifyListeners();
  }
}