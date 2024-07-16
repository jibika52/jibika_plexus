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
  dynamic dashboardOnleaveEmployeeinfo ;
  dashboardOnleaveEmployeeInfoProvider(String UserId,String AttDate , BuildContext context)async{
    dashboardOnleaveEmployeeinfo=await CustomHttpRequestClass().dashboardOnleaveEmployeeinfo(UserId, AttDate,  context);
    notifyListeners();
  }



}