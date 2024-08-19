import 'package:flutter/cupertino.dart';

import '../../CustomHttpSelf/custom_http_self.dart';
import '../../Model/EmpoyeeLeaveStatusModelClass/employee_leave_model_class.dart';
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
    notifyListeners();
  }







  ///  Leave allocation --------------------------------------------------------------------------
  dynamic selfLeaveAllocationList=[];
  selfLeaveAllocationProvider(String UserId, String EMPCODE, BuildContext context)async{
    selfLeaveAllocationList =await CustomHttpSelf().selfLeaveAllocation(UserId, EMPCODE , context);
    notifyListeners();
  }






}