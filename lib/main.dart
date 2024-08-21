import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import 'package:jibika_plexus/test_on_longpress.dart';
import 'package:jibika_plexus/testfile.dart';
import 'package:jibika_plexus/testgoooglemap.dart';
import 'package:jibika_plexus/testmonth_picker.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'Controller/HomeController/home_controller.dart';
import 'Controller/PrivacyPolicyController/privacy_policy.dart';
import 'Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'View/Auth/LoginScreen/login_screen_screen2.dart';
import 'View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/EmployeeProfile/employee_profile_screen.dart';
import 'View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/bootom_navigation_barItems_main_home_screen.dart';
import 'View/BootomNatchBar/bootom_bar_screen.dart';
import 'View/SplashScreen/main_splash_pageview_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider(),),
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),),
      ChangeNotifierProvider<PrivacyPolicyProvider>(create: (context) => PrivacyPolicyProvider(),),
      ChangeNotifierProvider<SelfDashboardController>(create: (context) => SelfDashboardController(),)
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
        //  home:BootomNavBarItemsMainFloationHomeScreen(),
        //     home:HomeFirstPartComponentAttendance(),

        /// ----------Home Screen---------
        //     home:BootomNatchBarScreen(),
        //      home:BootomNatchBarScreen(),

        /// ----------SplashScreen--------
        //     home:MainSplashPageViewScreen(),
        //   home:SalfBootomNatchBarScreen(currentIndex: 4,),
        //  home:TestLongPress(),
        //   home:MonthPicker(),
        //    home:Googlemap(),
        /// ----------Working Screen--------
        home:LoginScreenSlide(),
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

// Check for marge  requset //



