import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class TrackingController with ChangeNotifier{

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic EmployeeLocaltionInfoList;
  GetEmployeeLocaltionInfoProvider(String UserId,String AttDate, String EMPCODE, BuildContext context)async{
    EmployeeLocaltionInfoList =await CustomHttpRequestClass().GetEmployeeLocaltionInfoHttpFunction(UserId,AttDate,EMPCODE,context);
    notifyListeners();
  }

  ///   EmployeeLocaltionInfo List-------------------------------------------------------------------------
  dynamic GetMovementTrackableEmployeeList;
  GetMovementTrackableEmployeeListProvider(String UserId,String AttDate, BuildContext context)async{
    GetMovementTrackableEmployeeList =await CustomHttpRequestClass().GetMovementTrackableEmployeeListHttpFunction(UserId,AttDate,context);
    notifyListeners();
  }

  ///   GetMovementTrackableEmployeeByAttendanceDateProvider List-------------------------------------------------------------------------
  dynamic GetMovementTrackableEmployeeByAttendanceDatelist;
  GetMovementTrackableEmployeeByAttendanceDateProvider(String UserId,String AttDate,String ID_CARD_NO,BuildContext context)async{
    GetMovementTrackableEmployeeByAttendanceDatelist =await CustomHttpRequestClass().GetMovementTrackableEmployeeByAttendanceDateHttpFunction(UserId,AttDate,ID_CARD_NO,context);
    notifyListeners();
  }
}