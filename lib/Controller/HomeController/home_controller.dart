import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';

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



}