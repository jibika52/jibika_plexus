import 'package:flutter/cupertino.dart';

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


}