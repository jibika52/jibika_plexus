import 'package:flutter/material.dart';
import 'package:jibika_plexus/View/Auth/SplashScreen/splash_screen1.dart';
import 'package:jibika_plexus/View/Auth/SplashScreen/splash_screen2.dart';
import 'package:jibika_plexus/View/Auth/SplashScreen/splash_screen3.dart';

class MainSplashPageViewScreen extends StatefulWidget {
  const MainSplashPageViewScreen({super.key});

  @override
  State<MainSplashPageViewScreen> createState() => _MainSplashPageViewScreenState();
}

class _MainSplashPageViewScreenState extends State<MainSplashPageViewScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  List bottomBarPages=[
    SplashScreen1(),
    SplashScreen2(),
    SplashScreen3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
    );
  }
}
