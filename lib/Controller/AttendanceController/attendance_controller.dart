import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';

class AttendanceProvder with ChangeNotifier{

  ///    adminGetDailyAttendanceCounter--------------------------------------------------------------------------
  dynamic GetDailyAttendanceCounter;
  GetDailyAttendanceCounterListProvider(
      String UserId,String AttDate, BuildContext context)async{
    GetDailyAttendanceCounter =await CustomHttpRequestClass().adminGetDailyAttendanceCounter(UserId, AttDate, context);
    notifyListeners();
  }
}