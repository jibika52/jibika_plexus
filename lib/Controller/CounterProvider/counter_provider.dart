import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CounterProvider with ChangeNotifier{
  bool _islogin = false;
  bool get getLogin => _islogin;

  void clickLogin() {
    _islogin=true;
    notifyListeners();
  }
  void unClickLogin() {
    _islogin=false;
    notifyListeners();
  }
  /// For Create Customer  /////////////////////////////////////////////////
  bool _createcustomer=false;
  bool get createcustomerbool=>_createcustomer;
  void clickCreateCustomerFunction() {
    _createcustomer=true;
    notifyListeners();
  }
  void unclickCreateCustomerFunction() {
    _createcustomer=false;
    notifyListeners();
  }


  /// For Open and Close Slider
  bool _isOpenCloseSlider = false;
  bool get isOpenCloseSlider => _isOpenCloseSlider;

  void clickisOpenCloseSlider() {
    _isOpenCloseSlider=!_isOpenCloseSlider;
    notifyListeners();
  }
  void unclickisOpenCloseSlider() {
    _isOpenCloseSlider=false;
    notifyListeners();
  }




  /// For Check-in and Check-Out within attendance
  bool _isCheckIn = true;
  bool get isCheckIn => _isCheckIn;

  void clickIn() {
    _isCheckIn=true;
    notifyListeners();
  }
  void clickout() {
    _isCheckIn=false;
    notifyListeners();
  }


  /// For Leave Approval
  int _selectedindex2=0;
  int get selectindex2=>_selectedindex2;

  void leave_waiting(){
    _selectedindex2=0;
    notifyListeners();
  }
  void leave_approval(){
    _selectedindex2=1;
    notifyListeners();
  }
  void leave_Disapproval(){
    _selectedindex2=2;
    notifyListeners();
  }


  /// For Detpicker
  String _Detpicker="${DateTime.now().year}";
  String get  Detpicker=>_Detpicker;

  void GetDate(String date){
    _Detpicker=date;
    notifyListeners();
  }

  /// For Set OTP
  String _setOTP="${DateTime.now().year}";
  String get  setOTP=>_setOTP;

  void eetOTP(String otp){
    _setOTP=otp;
    notifyListeners();
  }


  /// for auto Counting second
  String _setcountSecond="0";
  String get   setcountSecond=>_setcountSecond;
  void  setcountSecondfunction(){
    print("time--- ${setcountSecond}");
    _setcountSecond = "${DateFormat('HH:mm:ss').format(DateTime.now()).toString()}";
    notifyListeners();
  }


  ///Get Single || Marig status
  String ? _MaritalStatus;
  String? get MaritalStatus=>_MaritalStatus;
  void getMarriedStatus(String getMaritalStatus){
    _MaritalStatus="$getMaritalStatus";
    notifyListeners();
  }


}