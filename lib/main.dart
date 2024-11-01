import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeFirstPartComponent/HomeFirstPartComponentPromotion/home_first_part_component_promotion.dart';
import 'package:jibika_plexus/tracking_google_map_test.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'Controller/AdminApprovalController/admin_approval_controller.dart';
import 'Controller/AdminEmployeeController/admin_employee_controller.dart';
import 'Controller/AttendanceController/attendance_controller.dart';
import 'Controller/HomeController/home_controller.dart';
import 'Controller/PrivacyPolicyController/privacy_policy.dart';
import 'Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'Controller/TrackingController/tracking_controller.dart';
import 'View/HomeScreen/HomeComponent/HomeFirstPartComponent/HomeFirstPartComponentNewJoinApproval/home_first_part_component_new_join_approval.dart';
import 'View/SplashScreen/main_splash_pageview_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;
 

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings androidInitializationSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosInitializationSettings =
  DarwinInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // Handle notification tap here
    },
  );

  tz.initializeTimeZones();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  // showNotification("nitification", "I am Uzzal Kumar biswas Fro Rajbari District Dhaka banfladesh .I invite you to come my home district and enjoy111111111111111");
    d_height = MediaQuery.of(context).size.height;
    d_width = MediaQuery.of(context).size.width;
    return MultiProvider(providers: [
      ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider(),),
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),),
      ChangeNotifierProvider<PrivacyPolicyProvider>(create: (context) => PrivacyPolicyProvider(),),
      ChangeNotifierProvider<SelfDashboardController>(create: (context) => SelfDashboardController(),),
      ChangeNotifierProvider<AttendanceProvder>(create: (context) => AttendanceProvder(),),
      ChangeNotifierProvider<EmployeeAdminProvider>(create: (context) => EmployeeAdminProvider(),),
      ChangeNotifierProvider<TrackingController>(create: (context) => TrackingController(),),
      ChangeNotifierProvider<OnboardingEmployeeController>(create: (context) => OnboardingEmployeeController(),),
      ChangeNotifierProvider<AdminApprovalController>(create: (context) => AdminApprovalController(),),
    ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jibika Payscale',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home:PrivacyPolicyScreen(phone_or_email: '01889173335',),
        //  home:TEstHeroAnimation(),
        //     home:CompanyRegistrationScreen(),
        //  home:BootomNavBarItemsEmployeeHomeScreen(),
        //     home:HomeFirstPartComponentAttendance(),

        /// ----------Home Screen---------
        //      home:BootomNatchBarScreen(),
        //   home:BootomNatchBarScreen(),
        /// ----------SplashScreen--------
          home:MainSplashPageViewScreen(),

        //    home:HomeFirstPartComponentPromotionScreen(),
        //     home:TrackingMapScreenTEstPoliline(),
        //    home:SalfBootomNatchBarScreen(currentIndex: 4,),
        //  home:TestLongPress(),
        //   home:MonthPicker(),
        //    home:Googlemap(),
        /// ----------Working Screen--------
        //    home:LoginScreenSlide(),
        //

        //  home:BootomNavigationBarItemsTrackingScreen(),

        // home:BootomNavigationBarItemsAttendenceScreen(),

        //  home:EmployeeProfileScreen(),

        /// Self Screen=================
        //   home:   SalfBootomNatchBarScreen(
        //   currentIndex: 4,
        // ),
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
      )

    );
  }
}





