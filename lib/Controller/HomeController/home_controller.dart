import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';

import '../../Model/DashboardEmployeeLeaveListModel/dashboard_employee_leave_list_model.dart';

class HomeProvider with ChangeNotifier{


  /// dashboard PieChart Data get here and return dashboardPieChartData
  dynamic dashboardPieChartData;
  dashboardPieChartDataProvider(String UserId,String AttDate, BuildContext context)async{
    dashboardPieChartData=await CustomHttpRequestClass().dashboardPieChartData(UserId, AttDate, context);
    notifyListeners();
  }

  /// dashboard BarChart Data get here and return dashboardBarChartData
  dynamic dashboardBarChartData;
  dashboardBarChartDataProvider(String UserId,String AttDate,String PayrollMonth, BuildContext context)async{
    dashboardBarChartData=await CustomHttpRequestClass().dashboardBarChartData(UserId, AttDate,PayrollMonth, context);
    notifyListeners();
  }


  /// dashboard On Leave Employee Data get here and return dashboardBarChartData
  dynamic dashboardOnleaveEmployeeList ;
  dashboardOnleaveEmployeeListProvider(String UserId,String AttDate , BuildContext context)async{
    dashboardOnleaveEmployeeList=await CustomHttpRequestClass().dashboardOnleaveEmployeeList(UserId, AttDate,  context);
    notifyListeners();
  }

  /// dashboard On Leave Employee Data get here and return dashboardBarChartData
  dynamic dashboardEmployeeinfo ;
  dashboardEmployeeInfoProvider(String UserId,String AttDate , BuildContext context)async{
    dashboardEmployeeinfo=await CustomHttpRequestClass().dashboardEmployeeinfo(UserId, AttDate,  context);
    notifyListeners();
  }

  /// dashboardToday Birthday list
  dynamic dashboardtodaysBirthdayEmployeeinfo ;
  dashboardTodaysBirthdayEmployeeInfoProvider(String UserId,String AttDate , BuildContext context)async{
    dashboardtodaysBirthdayEmployeeinfo=await CustomHttpRequestClass().dashboardTodaysBirthDayEmployeeinfo(UserId, AttDate,  context);
    notifyListeners();
  }

  /// dashboard Salary Comprison List
  dynamic dashboardSalaryComparisanChartList ;
  dashboardSalaryComprisonListProvider(String UserId,String AttDate, BuildContext context)async{
    dashboardSalaryComparisanChartList=await CustomHttpRequestClass().dashboardComparisanChart(UserId,AttDate,  context);
    notifyListeners();
  }


  /// self / Admin Short Description List
  dynamic selfORAdminShortInformationdata ;
  selfORAdminShortDescriptionProvider(String UserId,String ID_CARD_NO, BuildContext context)async{
    selfORAdminShortInformationdata=await CustomHttpRequestClass().selfORAdminShortDescription(UserId,ID_CARD_NO,  context);
    notifyListeners();
  }



}