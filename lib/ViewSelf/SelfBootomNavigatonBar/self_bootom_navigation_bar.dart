import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/TrackingController/tracking_controller.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/CreateConvieyance/create_convieyance.dart';
import 'package:karmm_callkit/karmm_callkit.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/bootom_navigation_barItems_main_home_screen.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/self_bootom_navigation_convience.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/self_bootombar_employee_job_card.dart';
import 'package:provider/provider.dart';
//import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeDashboard/self_bootom_navigaton_employee_dashboard.dart';
import '../../Controller/HomeController/home_controller.dart';
import '../../Controller/SelfDashboardController/self_dashboard_controller.dart';
import '../../CustomHttpSelf/custom_http_self.dart';
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

class _SalfBootomNatchBarScreenState extends State<SalfBootomNatchBarScreen> {

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;
  @override
  void initState() {

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
    Future.delayed(Duration(seconds: 2),() {
      startService();
    },);
    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [

    SelfBootomBarJobCardScreen(),
    SelfBootomNavigatonEmployeeDashboard(),
    SelfBootomNavigationLeave(),
    GetStorage().read("is_Start_Journey")=="true" ?CreateConveyanceScreen():  SelfBootomNavigationConvienceScreen(),
    SelfBootomNavigatonBarHomeScreen(),

  ];
  final _key=GlobalKey<ScaffoldState>();

  double b_bar_icon_size=30;
  double b_bar_height=50;
  @override
  Widget build(BuildContext context) {
    List<Updated_attendance_summary>   selfOneMonthAttendanceList =  Provider.of<SelfDashboardController>(context).selfOneMonthAttendanceList;

    for(var i in selfOneMonthAttendanceList){
      if("${i.date}"=="${DateTime.now().day}"){
        GetStorage().write("SHIFT_IN_TIME", i.SHIFT_IN_TIME);
        GetStorage().write("SHIFT_OUT_TIME", i.SHIFT_OUT_TIME);
        GetStorage().write("ATTENDANCE_START_TIME", i.ATTENDANCE_START_TIME);
        GetStorage().write("ATTENDANCE_Status", i.Status);
      }
    }
//    print(" shift_time ${GetStorage().read("SHIFT_IN_TIME")}---------SHIFT_OUT_TIME --${GetStorage().read("SHIFT_OUT_TIME")}-----ATTENDANCE_Status --${GetStorage().read("ATTENDANCE_Status")}---------IsTrack --${GetStorage().read("IsTrack")}---------------");
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer:CustomLeftDrawer(),
        key: _key,
        appBar: PreferredSize(preferredSize: Size.fromHeight(60),
          /// ------------ Custom Main AppBAr -------------///
          child: CustomMainAppBar(
              leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png",
              center_appbar_text: "${GetStorage().read("Company_name")}",
              leading_ontab: () {
                _key.currentState!.openDrawer();
              }, is_need_trailing: true),
        ),
      
        body: bottomBarPages[widget.currentIndex],
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
                      widget.currentIndex=0;
                    });
                  },
                  child: Container(
                    height: b_bar_height,
                    child: Column(
                      children: [
                        Icon(Icons.category_rounded,color: widget.currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),size: 30,),
                        //    CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size, img_color:widget.currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png"),
                        SizedBox(height: 2,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "My Menu", letterSpacing: 0.3, textColor: widget.currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.currentIndex=1;
                    });
                  },
                  child: Container(
                    height: b_bar_height,
                    child: Column(
                      children: [
                        //     Icon(Icons.list_alt,size: 30,weight: 30,color: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.3),),
                        CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/SelfIcon/test_fingerprint.png"),
                        SizedBox(height: 2,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Attendance", letterSpacing: 0.3, textColor: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
      
      
              Container(
                width: MediaQuery.of(context).size.width*0.13,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.currentIndex=2;
                    });
                  },
                  child: Container(
                    height: b_bar_height,
                    child: Column(
                      children: [
                        CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/SelfIcon/leave_icon.png"),
                        SizedBox(height: 2,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Leave", letterSpacing: 0.3, textColor: widget.currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.currentIndex=3;
                      Provider.of<TrackingController>(context,listen: false).GetVehicleListHttpFunctionProvider("${GetStorage().read("mobile_id")}", "10/04/2024", context);
                    });
                  },
                  child: Container(
                    height: b_bar_height,
                    child: Column(
                      children: [
                        Icon(Icons.time_to_leave,color: widget.currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),size: 30,),
                        //    CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), radius: 5, image: "Assets/SelfIcon/Conveyance_edited1.png"),
                        SizedBox(height: 2,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Conveyance", letterSpacing: 0.3, textColor: widget.currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      
        floatingActionButton:keyboardOpen==true
            ? SizedBox(): CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: FloatingActionButton(
            isExtended: false,shape: CircleBorder(
            side: BorderSide(color: Main_Theme_WhiteCollor),
          ),
            foregroundColor: Main_Theme_WhiteCollor,
            backgroundColor: Main_Theme_WhiteCollor,
            onPressed: () {
              setState(() {
                widget.currentIndex=4;
              });
            }, child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("Assets/Logo/leaff.png" ),
          ),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      ),
    );
  }
  bool keyboardOpen = false;
}


/// Background processing is running form here below now check the code-----------------------------------------------------------------------------------
void   startService() async {
  await initializeService();
}

void stopService() {
  service.invoke("stopService");
}

void initCallPushListeners() {
  ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);
  ConnectycubeFlutterCallKit.instance.init(
  );
}

// https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-pre-1.12-Android-projects.md

void initCallPush() {
  print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz---------------1------------------------");
  ConnectycubeFlutterCallKit.getLastCallId().then((value) {
    ConnectycubeFlutterCallKit.reportCallEnded(sessionId: value);
  });

  var sessionId = DateTime.now().microsecondsSinceEpoch.toString();
  // CallEvent callEvent = CallEvent(
  //     sessionId: sessionId,
  //     callType: 0,
  //     callerId: randomIds(),
  //     callerName: randomString(5),
  //     opponentsIds: {randomIds(), randomIds()},
  //     callPhoto: 'https://i.imgur.com/KwrDil8b.jpg',
  //     userInfo: {'user_id': '${randomIds()}'});
  // ConnectycubeFlutterCallKit.showCallNotification(callEvent);
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

int randomIds() {
  var rng = new Random();
  var randomNumber = rng.nextInt(100000) + 1;
  return randomNumber;
}

// generate random string function
String randomString(int length) {
  var rng = new Random();
  var codeUnits =
  List.generate(length, (index) => rng.nextInt(33) + 89); // 33 to 122
  return String.fromCharCodes(codeUnits);
}

void checkFullScreenIntentPermission() async {
  var canUseFullScreenIntent =
  await ConnectycubeFlutterCallKit.canUseFullScreenIntent();
  print("boolValue: $canUseFullScreenIntent");
  if (canUseFullScreenIntent == false) {
    ConnectycubeFlutterCallKit.provideFullScreenIntentAccess();
  }
}

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;
final service = FlutterBackgroundService();
Future<void> initializeService() async {
  print("--- ----------------------------------${GetStorage().read("SHIFT_IN_TIME")} -----------------------");
  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,
    ),
  );
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print("--- shift_time ${GetStorage().read("SHIFT_IN_TIME")}---------SHIFT_OUT_TIME --${GetStorage().read("SHIFT_OUT_TIME")}-----ATTENDANCE_Status --${GetStorage().read("ATTENDANCE_Status")}---------IsTrack --${GetStorage().read("IsTrack")}-----------------------");
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);


  late Position position;
  late  Placemark place;
  _getCurrentLocation() async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude
    );
   place = placemarks[0];
  }

  Timer.periodic(Duration(seconds: 30), (timer) async {

    _getCurrentLocation();
    print("Location--------------- ${position.latitude} ${position.longitude} ");
    print("select_car_type------------------> ${GetStorage().read("select_car_type")} ");



  });
  // bring to foreground
  Timer.periodic(Duration(minutes: 1), (timer) async {
    bool is_internet_available = await InternetConnection().hasInternetAccess;
    print("Location---------------${position.latitude} ${position.longitude} \nis_internet available-- ${is_internet_available}\n--- shift_time ${GetStorage().read("SHIFT_IN_TIME")}\n---------SHIFT_OUT_TIME --${GetStorage().read("SHIFT_OUT_TIME")}\n-----ATTENDANCE_Status --${GetStorage().read("ATTENDANCE_Status")}\n---------IsTrack --${GetStorage().read("IsTrack")}\n--------${timer.tick}----------------------");
    ///---------------------------------------------------------------------------
    CustomHttpSelf().selfCheckInCheckOut(
      "${GetStorage().read("mobile_id")}",
      "${DateFormat('yyyyMMdd').format(DateTime.now())}",
      "${DateFormat('HHmmss').format(DateTime.now()).toString()}",
      "${GetStorage().read("RfIdCardNo")}",

      "${place.name}",
      "${place.locality}",
      "${place.administrativeArea}",
      "${place.postalCode}",
      "${place.subAdministrativeArea}",
      "${place.street.toString()}",
      // " ",
      // " ",
      // " ",
      // " ",
      // " ",
      // " ",
      "${position.latitude}",
      "${position.longitude}",
      int.parse("${"${GetStorage().read("Empcode")}"}"),
      "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
      GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track",
      "true",
      GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track",
    );
    ///---------------------------------------------------------------------------
    if (service is AndroidServiceInstance) {
      //   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa----------------------------${DateTime.now()}----------");
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
}