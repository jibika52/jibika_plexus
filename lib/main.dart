import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';
import 'package:jibika_plexus/View/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';

import 'Controller/HomeController/home_controller.dart';
import 'Controller/PrivacyPolicyController/privacy_policy.dart';
import 'View/BootomNatchBar/bootom_bar_screen.dart';
import 'View/PrivacyPolicy/privacy_policy.dart';
import 'View/SplashScreen/main_splash_pageview_screen.dart';

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
      ChangeNotifierProvider<PrivacyPolicyProvider>(create: (context) => PrivacyPolicyProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home:MainSplashPageViewScreen(),
      // home:PrivacyPolicyScreen(phone_or_email: '01889173335',),
      //  home:TEstHeroAnimation(),
      //     home:CompanyRegistrationScreen(),
      //   home:HomeScreen(),
      //   home:BootomNatchBarScreen(),
    ),

    );
  }
}



// class TEstHeroAnimation extends StatefulWidget {
//   const TEstHeroAnimation({super.key});
//
//   @override
//   State<TEstHeroAnimation> createState() => _TEstHeroAnimationState();
// }
//
// class _TEstHeroAnimationState extends State<TEstHeroAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(fontSize: 15, fontWeight: FontWeight.w400, text: "Add", letterSpacing: 0.3),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           children: [
//
//             Container(height: 100,width: 100,color: Colors.red,),
//             SizedBox(height: 50,),
//             Container(height: 100,width: 100,color: Colors.red,),
//           ],
//         ),
//       ),
//     );
//   }
// }






