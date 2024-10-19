
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/AdminEmployeeController/admin_employee_controller.dart';
import 'package:jibika_plexus/Controller/AttendanceController/attendance_controller.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsAttendenceScreen/bootom_navigationar_Items_attendence_screen.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/bootom_navigation_barItems_main_home_screen.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsPayrollScreen/bootom_navigationar_Items_payroll_screen.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import '../../testfile.dart';
import '../HomeScreen/home_screen.dart';
import 'BootomNavigationBarItemsScreen/BootomNavigationBarItemsTrackingScreen/bootombar_tracking_screen.dart';

class BootomNatchBarScreen extends StatefulWidget {
   BootomNatchBarScreen({super.key,required this.index});
  int index;
  @override
  State<BootomNatchBarScreen> createState() => _BootomNatchBarScreenState();
}

class _BootomNatchBarScreenState extends State<BootomNatchBarScreen> {

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;
  @override
  void initState() {
    _currentIndex=widget.index;
   Provider.of<HomeProvider>(context,listen: false).selfORAdminShortDescriptionProvider(GetStorage().read("mobile_id"), GetStorage().read("IdCardNo"), context);
     // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [

    BootomNavBarItemsEmployeeHomeScreen(),
    BootomNavigationBarItemsAttendenceScreen(),
    BootomNavigationBarItemsPayrollScreen(),
    BootomNavigationBarItemsTrackingScreen(),
    HomeScreen(),

  ];
  final _key=GlobalKey<ScaffoldState>();
  late int   _currentIndex ;
  double C_size=30;
  double b_bar_h=50;
  @override
  Widget build(BuildContext context) {
  final selfORAdminShortInformationdata=   Provider.of<HomeProvider>(context).selfORAdminShortInformationdata;
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer:CustomLeftDrawer(),
        key: _key,
        appBar: PreferredSize(preferredSize: Size.fromHeight(80),
          /// ------------ Custom Main AppBAr -------------///
          child: CustomMainAppBar(
              leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png",
              center_appbar_text: "${GetStorage().read("Company_name")}",
              leading_ontab: () {
            _key.currentState!.openDrawer();
          }, is_need_trailing: true),
        ),
      body: bottomBarPages[_currentIndex],
      
        bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            color: CustomButtonColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Provider.of<EmployeeAdminProvider>(context,listen: false).GetDailyAttendanceCounterListProvider("${GetStorage().read("mobile_id")}", "Active", 1, context);
                    setState(() {
                      _currentIndex=0;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                      children: [
                        CustomImageSction2(height: C_size, img_color:_currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), width: C_size, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png"),
                        SizedBox(height: 3,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Employee", letterSpacing: 0.9, textColor: _currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=2;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                      children: [
                        CustomImageSction2(height: C_size, img_color: _currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), width: C_size, radius: 5, image: "Assets/DashBoardIcons/b_bar_payroll.png"),
                        SizedBox(height: 3,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Payroll", letterSpacing: 0.9, textColor: _currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
      
      
      
              Container(
                width: MediaQuery.of(context).size.width*0.13,
              ),
              InkWell(
                  onTap: () {
                    Provider.of<AttendanceProvder>(context,listen: false).GetDailyAttendanceCounterListProvider("${GetStorage().read("mobile_id")}",
                        "${DateFormat("dd-MMM-yyyy").format(DateTime.now())}", context);
                    setState(() {
                      _currentIndex=1;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                      children: [
                        CustomImageSction2(height: C_size, img_color: _currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), width: C_size, radius: 5, image: "Assets/DashBoardIcons/b_bar_attendence.png"),
                        SizedBox(height: 3,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Attendance", letterSpacing:0.9, textColor: _currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=3;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                      children: [
                        CustomImageSction2(height: C_size, img_color: _currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), width: C_size, radius: 5, image: "Assets/DashBoardIcons/b_bar_tricker.png"),
                        SizedBox(height: 3,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Tracker", letterSpacing: 0.9, textColor: _currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  ),
               ),
            ],
          ),
        ),
      
      
        floatingActionButton:keyboardOpen==true
          ? SizedBox(): FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            setState(() {
              _currentIndex=4;
            });
          },
          child: Image.asset("Assets/Logo/leaff.png"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      
      ),
    );
  }
  bool keyboardOpen = false;
}