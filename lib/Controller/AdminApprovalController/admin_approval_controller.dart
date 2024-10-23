import 'package:flutter/material.dart';

import '../../CustomHttp/custom_http.dart';
class AdminApprovalController with ChangeNotifier{


/// Pending Leave List--------------------------------------
  dynamic pendingLeaveList;
   pendingLeaveListProvider(String UserId, String ID_CARD_NO, String EMPCODE,BuildContext context)async{
   pendingLeaveList = await CustomHttpRequestClass().pendingLeaveListHttpFunction(UserId, ID_CARD_NO, EMPCODE, context);
   notifyListeners();
  }


  /// Approved Leave List--------------------------------------
   approvedLeaveListProvider(String UserId, String ID_CARD_NO, String EMPCODE,BuildContext context)async{
     pendingLeaveList = await CustomHttpRequestClass().ApprovedLeaveListHttpFunction(UserId, ID_CARD_NO, EMPCODE, context);
   notifyListeners();
  }


  ///  Leave Approved by tempCode--------------------------------------
   dynamic LeaveapprovedList;
  LeaveapprovedProvider(String UserId,  String EMPCODE,  String ID_CARD_NO,    String TEMP_CODE, String R_EMPCODE, BuildContext context)async{
    LeaveapprovedList = await CustomHttpRequestClass().ApprovedLeavebyTmpTableCodeHttpFunction(UserId, EMPCODE, ID_CARD_NO ,TEMP_CODE, R_EMPCODE, context);
   notifyListeners();
  }


  ///  LeaveReject by tempCode--------------------------------------
   dynamic reject;
  LeaveRejectProvider(String UserId,  String EMPCODE,  String ID_CARD_NO,    String TEMP_CODE, String R_EMPCODE, BuildContext context)async{
    reject = await CustomHttpRequestClass().RejectLeaveApprovalTmpTableCodeHttpFunction(UserId, EMPCODE, ID_CARD_NO ,TEMP_CODE, R_EMPCODE, context);
   notifyListeners();
  }

}