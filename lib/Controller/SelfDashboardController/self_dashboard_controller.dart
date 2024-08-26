import 'package:flutter/cupertino.dart';

import '../../CustomHttp/custom_http.dart';
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
  selfOneMonthAttendanceProvider(
      int yyyy,
      int MMMM,
      int dd,
      String UserId,String AttendanceDate, String RefCardNo, String attendanceType,BuildContext context)async{
    selfOneMonthAttendanceList=await CustomHttpSelf().selfOneMonthAttendanceFunction(
      yyyy,
      MMMM,
      dd,
      UserId, AttendanceDate, RefCardNo, attendanceType, context,);
    notifyListeners();
  }


  /// self / Admin Short Description List
  dynamic selfORAdminShortInformationdata ;
  selfORAdminShortDescriptionProvider(String UserId,String ID_CARD_NO, BuildContext context)async{
    selfORAdminShortInformationdata=await CustomHttpRequestClass().selfORAdminShortDescription(UserId,ID_CARD_NO,  context);
    notifyListeners();
  }




  ///  Leave allocation --------------------------------------------------------------------------
  dynamic selfLeaveAllocationList=[];
  selfLeaveAllocationProvider(String UserId, String EMPCODE, BuildContext context)async{
    selfLeaveAllocationList =await CustomHttpSelf().selfLeaveAllocation(UserId, EMPCODE , context);
    notifyListeners();
  }








  ///  Leave allocation --------------------------------------------------------------------------
  dynamic selfAdminGetLeaveEarlyCountList=[];
  selfAdminGetLeaveEarlyCountProvider(String UserId, String EMPCODE, BuildContext context)async{
    selfAdminGetLeaveEarlyCountList =await CustomHttpSelf().selfAdminGetLeaveEarlyCount(UserId, EMPCODE , context);
    notifyListeners();
  }








  ///  Leave allocation --------------------------------------------------------------------------
  dynamic selfAdminAdmin_Get_Monthly_Att_SummaryCountList;
  selfAdminAdmin_Get_Monthly_Att_SummaryCountProvider(String SUMMARY_MONTH, BuildContext context)async{
    selfAdminAdmin_Get_Monthly_Att_SummaryCountList =await CustomHttpSelf().selfAdminAdmin_Get_Monthly_Att_SummaryCount( SUMMARY_MONTH, context);
    notifyListeners();
  }









  ///   selfAdminAdmin_Get_Emp_New_FaceList--------------------------------------------------------------------------
  dynamic selfAdminAdmin_Get_Emp_New_FaceList;
  selfAdminAdmin_Get_Emp_New_FaceListProvider(
       BuildContext context)async{
    selfAdminAdmin_Get_Emp_New_FaceList =await CustomHttpSelf().selfAdminAdmin_Get_Emp_New_Face_Get(
       context);
    notifyListeners();
  }







  ///   self Admin Save Leave Register Provider--------------------------------------------------------------------------
  dynamic SaveLeaveRegister;
  selfAdminSaveLeaveRegisterProvider(
      String LEAVETYPECODE,String LEAVEDAYS,String FROMDATE,
      String TODATE,String APPLYDATE,String HALFDAY,String HOLIDAYFOND,
      String ATEENBONUSFLAG,String LEAVEREASON,String ADDRESSDURINGLEAVE,
      String DUTYCARRIEDOUTBY,String MOBILENO,
      String STAFFCATEGORYCODE,String USERTYPEID, BuildContext context)async{
    SaveLeaveRegister =await CustomHttpSelf().selfAdminSaveLeaveRegister_By_Employee(LEAVETYPECODE, LEAVEDAYS, FROMDATE, TODATE, APPLYDATE, HALFDAY, HOLIDAYFOND, ATEENBONUSFLAG, LEAVEREASON, ADDRESSDURINGLEAVE, DUTYCARRIEDOUTBY, MOBILENO, STAFFCATEGORYCODE, USERTYPEID, context);

    notifyListeners();
  }




}