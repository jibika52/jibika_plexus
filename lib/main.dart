import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
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

    // home:SplashScreen1(),
      //   home:PrivacyPolicyScreen(),
       home:CompanyRegistrationScreen(),
      //    home:LoginScreenSlide(),
    );
  }
}







