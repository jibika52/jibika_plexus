import 'package:flutter/cupertino.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';

class EmployeeAdminProvider with ChangeNotifier{

  ///    adminGetDailyAttendanceCounter--------------------------------------------------------------------------
  dynamic Admin_GetEmployeeListByStatus;
  GetDailyAttendanceCounterListProvider(
      String UserId,
      String STATUS,
      int PAGE,
      BuildContext context)async{
    Admin_GetEmployeeListByStatus =await CustomHttpRequestClass().adminGetEmployeeListByStatus(
        UserId, STATUS,PAGE, context);
    notifyListeners();
  }
}