
import 'package:web_socket_channel/status.dart' as status;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/View/SplashScreen/splash_screen1.dart';
import 'package:jibika_plexus/View/SplashScreen/splash_screen2.dart';
import 'package:jibika_plexus/View/SplashScreen/splash_screen3.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../Utils/constants.dart';
import '../BootomNatchBar/bootom_bar_screen.dart';

class MainSplashPageViewScreen extends StatefulWidget {
  const MainSplashPageViewScreen({super.key});

  @override
  State<MainSplashPageViewScreen> createState() => _MainSplashPageViewScreenState();
}

class _MainSplashPageViewScreenState extends State<MainSplashPageViewScreen> {
  void permissionn()async{
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

  @override
  void initState() {
    socketFunction();
    permissionn();
    Future.delayed(Duration(milliseconds: 500),() {

      if(GetStorage().read("id_token")!=null && GetStorage().read("user_type_id")==1001){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(
          index: 4,
        ),
        ),);
      }

      else if(GetStorage().read("id_token")!=null && GetStorage().read("user_type_id")==1003){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SalfBootomNatchBarScreen(currentIndex: 4),));
      }
      else if(GetStorage().read("id_token")!=null){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenSlide(),));
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3(),));
      }else{
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3(),));
        print(GetStorage().read("id_token")!=null);
      }
    },);

    // TODO: implement initState
    super.initState();
  }
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body:GetStorage().read("id_token")!=null?Center(child: CircularProgressIndicator(),)
            :
        PageView(
          children:[
            SplashScreen1(),
            SplashScreen2(),
            SplashScreen3(),
          ],
        ),
      ),
    );
  }
}
