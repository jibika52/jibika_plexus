import 'package:flutter/cupertino.dart';

import '../../CustomHttpSelf/custom_http_self.dart';
import '../../ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';

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
  List<Updated_attendance_summary> selfOneMonthAttendanceList = [];
  selfOneMonthAttendanceProvider(String UserId,String AttendanceDate, String RefCardNo, String attendanceType,BuildContext context)async{
    selfOneMonthAttendanceList=await CustomHttpSelf().selfOneMonthAttendanceFunction(UserId, AttendanceDate, RefCardNo, attendanceType, context,);
    // for(int i=0;i<DateTime(DateTime.now().year, DateTime.now().month+1, 0).day;i++){
    //   pdated_attendance_summary.add(updated_attendance_summary(date: "${i}",Status:  "$i"));
    //   for(int j=0;j<selfOneMonthAttendanceList.length;j++){
    //     if(i==selfOneMonthAttendanceList[j]["DUTY_DATE"].substring(0,2)){
    //       print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS $j");
    //       //   pdated_attendance_summary.replaceRange(j, j + 1, [updated_attendance_summary(date: "$j",Status:  "P")]);
    //       //   pdated_attendance_summary.replaceRange(j, j + 1, [updated_attendance_summary(date: "$j",Status:  "${selfOneMonthAttendanceList[j]["Status"]}")]);
    //       //    pdated_attendance_summary.insert(j,updated_attendance_summary(date: "$j",Status:  "${selfOneMonthAttendanceList[j]["Status"]}") );
    //     }
    //   }
    // }
    notifyListeners();
  }






}