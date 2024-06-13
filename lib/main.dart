import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';
import 'package:jibika_plexus/View/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';

import 'Controller/HomeController/home_controller.dart';
import 'View/BootomNatchBar/bootom_bar_screen.dart';
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
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //    home:MainSplashPageViewScreen(),
        home:LoginScreenSlide(),
      //    home:HomeScreen(),
      //    home:BootomNatchBarScreen(),
    ),
    );
  }
}








