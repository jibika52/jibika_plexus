import 'package:flutter/material.dart';
import 'View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'View/Auth/OtpScreen/otp_screen.dart';
import 'View/Auth/SplashScreen/splash_screen1.dart';
import 'View/LoginScreen/login_screen.dart';
import 'View/LoginScreen/login_screen_screen2.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      //     home:SplashScreen1(),
      home:CompanyRegistrationScreen(),

    );
  }
}







