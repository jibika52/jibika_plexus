import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';

class HomeProvider with ChangeNotifier{

  dynamic dashboardPieChartData;

  dashboardPieChartDataProvider(String UserId,String AttDate, BuildContext context)async{
    dashboardPieChartData=await CustomHttpRequestClass().dashboardPieChartData(UserId, AttDate, context);
    notifyListeners();
  }

}