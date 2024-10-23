
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/Controller/TrackingController/tracking_controller.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/BackgroundTrackingApiModelClass/background_tracking_api_modelclass.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/CreateConvieyance/create_convieyance.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/self_bootom_navigation_convience.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/self_bootombar_employee_job_card.dart';
import 'package:provider/provider.dart';
import '../../Controller/SelfDashboardController/self_dashboard_controller.dart';
import '../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import 'SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';
import 'SelfBootomNavigatonEmployeeDashboard/self_bootom_navigaton_employee_dashboard.dart';

class SalfBootomNatchBarScreen extends StatefulWidget {
  SalfBootomNatchBarScreen({super.key,required this.currentIndex});
  int  currentIndex;
  @override
  State<SalfBootomNatchBarScreen> createState() => _SalfBootomNatchBarScreenState();
}
List<BackgroundTrackingApiModelClass> GpstrackingList =[];
class _SalfBootomNatchBarScreenState extends State<SalfBootomNatchBarScreen> {

  final _key=GlobalKey<ScaffoldState>();
  late int   _currentIndex ;
  double C_size=30;
  double b_bar_h=50;
  double b_bar_icon_size=30;
  double b_bar_height=50;
  final List<Widget> bottomBarPages = [
    SelfBootomBarJobCardScreen(),
    SelfBootomNavigatonEmployeeDashboard(are_you_user: "user",),
    SelfBootomNavigationLeave(),
    GetStorage().read("is_Start_Journey")=="true" ?CreateConveyanceScreen():  SelfBootomNavigationConvienceScreen(),
    SelfBootomNavigatonBarHomeScreen(),

  ];
  void initState() {
    _currentIndex=widget.currentIndex;
    Provider.of<CounterProvider>(context,listen: false).areYouUserOrAdminFunction("user");
    Provider.of<SelfDashboardController>(context,listen: false).selfORAdminShortDescriptionProvider(GetStorage().read("mobile_id"), GetStorage().read("IdCardNo"), context);
    Provider.of<SelfDashboardController>(context,listen: false).selfAdminGetLeaveEarlyCountProvider("${GetStorage().read("mobile_id")}", "${GetStorage().read("Empcode")}", context);
    Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider
      (
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        "${GetStorage().read("mobile_id")}",
        "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
        "${GetStorage().read("IdCardNo")}",
        "GENERAL", context);
    // Future.delayed(Duration(seconds: 2),() {
    //   startService();
    // },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer:CustomLeftDrawer(),
        key: _key,
        appBar: PreferredSize(preferredSize: Size.fromHeight(80),
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
                    setState(() {
                      _currentIndex=0;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                    children: [
                      Icon(Icons.category_rounded,color: _currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),size: 30,),
                      //    CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size, img_color:_currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "My Menu", letterSpacing: 0.3, textColor: _currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                    ),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex=1;
                    });
                  },
                  child: Container(
                    height: b_bar_h,
                    child: Column(
                    children: [
                      //     Icon(Icons.list_alt,size: 30,weight: 30,color: _currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.3),),
                      CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: _currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/SelfIcon/test_fingerprint.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Attendance", letterSpacing: 0.3, textColor: _currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                    ),
                  )),



              Container(
                width: MediaQuery.of(context).size.width*0.13,
              ),
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
                      CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: _currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/SelfIcon/leave_icon.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Leave", letterSpacing: 0.3, textColor: _currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                    ),
                  )),
              InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex=3;
                    Provider.of<TrackingController>(context,listen: false).GetVehicleListHttpFunctionProvider("${GetStorage().read("mobile_id")}", "10/04/2024", context);
                  });


                },
                child: Container(
                  height: b_bar_h,
                  child: Column(
                    children: [
                      Icon(Icons.time_to_leave,color: _currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),size: 30,),
                      //    CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: _currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), radius: 5, image: "Assets/SelfIcon/Conveyance_edited1.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Conveyance", letterSpacing: 0.3, textColor: _currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
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
