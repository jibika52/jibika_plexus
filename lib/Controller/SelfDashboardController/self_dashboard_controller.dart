import 'package:flutter/cupertino.dart';

import '../../CustomHttpSelf/custom_http_self.dart';

class SelfDashboardController with ChangeNotifier{


  /// dashboard Salary Comprison List
  dynamic dashboardSalaryComparisanChartList ;
  dashboardSalaryComprisonListProvider(String UserId,String AttendanceDate, String AttendanceTime, String RefCardNo, String Location, String District, String Division, String PostalCode, String SubLocality, String StreetName, String lat,  String lng, int Empcode, String DutyDate,String Remarks, BuildContext context)async{
    dashboardSalaryComparisanChartList=await CustomHttpSelf().selfCheckInCheckOut(
        UserId,
        AttendanceDate,
        AttendanceTime,
        RefCardNo,
        Location,
        District,
        Division,
        PostalCode,
        SubLocality,
        StreetName,
        lat,
        lng,
        Empcode,
      DutyDate,
      Remarks,
        context,
    );
    notifyListeners();
  }


  /// self One Month Attendance List
  dynamic selfOneMonthAttendanceList ;
  selfOneMonthAttendanceProvider(String UserId,String AttendanceDate, String RefCardNo, String attendanceType,BuildContext context)async{
    selfOneMonthAttendanceList=await CustomHttpSelf().selfOneMonthAttendanceFunction(UserId, AttendanceDate, RefCardNo, attendanceType, context,);
    notifyListeners();
  }






}