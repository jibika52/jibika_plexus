import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'package:provider/provider.dart';

import 'Controller/HomeController/home_controller.dart';
import 'View/Auth/SplashScreen/main_splash_pageview_screen.dart';
import 'View/Auth/SplashScreen/splash_screen1.dart';
import 'View/PrivacyPolicy/privacy_policy.dart';

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
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:MainSplashPageViewScreen(),
        home:PrivacyPolicyScreen(
       phone_or_email: "01889173335",
      ),
    ),
    );
  }
}







