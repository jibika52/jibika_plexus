// import 'package:flutter/material.dart';
// import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
// import 'package:jibika_plexus/Utils/constants.dart';
// import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';
// import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
// import '../../CustomWidget/CustomText/custom_text.dart';
//
// class SalfBootomNatchBarScreen extends StatefulWidget {
//   const SalfBootomNatchBarScreen({super.key});
//   @override
//   State<SalfBootomNatchBarScreen> createState() => _SalfBootomNatchBarScreenState();
// }
//
// class _SalfBootomNatchBarScreenState extends State<SalfBootomNatchBarScreen> {
//   int maxCount = 5;
//   bool is_get_profie=false;
//   dynamic getDynamicSliderData;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   /// widget list
//   final List<Widget> bottomBarPages = [
//     SelfBootomNavigatonBarHomeScreen(),
//     Text("AAAAAAAAA"),
//     Text("BBBBBBBBBBBB"),
//     Text("CCCCCCCCCCCCCCCCCCC"),
//   ];
//   final _key=GlobalKey<ScaffoldState>();
//   int _currentIndex = 0;
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(preferredSize: Size.fromHeight(90), child: Container(
//         color: CustomAppbarColor,
//         height: 75,
//         width: double.infinity,
//         padding: EdgeInsets.only(top: 10,left: 15,right: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//                 onTap:  () {
//
//                 },
//                 child: Container(
//                     padding: EdgeInsets.all(3) ,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       color: Main_Theme_WhiteCollor,
//
//                     ),
//                     child: CustomImageSction(height: 33, width: 35, radius: 2, image: "Assets/Logo/jibikalogo3.png"))),
//             ColorCustomText(fontSize: 18, fontWeight: FontWeight.w600, text: "$appbar_text", letterSpacing: 1,textColor: Main_Theme_WhiteCollor.withOpacity(0.8), ),
//              Container(
//               height: 100,
//               width: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0,top: 10),
//                         child: CustomImageSction(height: 25, width: 25, radius: 1, image: "Assets/DashBoardIcons/notification_icon.png"),
//                       ),
//                       Positioned(
//                           top: 5,
//                           left: 9,
//                           child: CircleAvatar(
//                             radius: 7,
//                             child: ColorCustomText(fontSize: 9, fontWeight: FontWeight.w700, text: "7", letterSpacing: 1, textColor: notification_color),
//                           ))
//                     ],
//                   ),
//                   Icon(Icons.more_vert,size: 30,color: Main_Theme_WhiteCollor.withOpacity(0.8) ,)
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       )),
//       resizeToAvoidBottomInset: false,
//       drawer:CustomLeftDrawer(),
//       key: _key,
//
//
//       body: bottomBarPages[_currentIndex],
//       bottomNavigationBar: Container(
//         height: 70,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(11),
//             topRight: Radius.circular(11),
//           ),
//           color: CustomButtonColor,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//                 onTap: () {
//                   setState(() {
//                     _currentIndex=0;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png")),
//
//             InkWell(
//                 onTap: () {
//                   setState(() {
//                     _currentIndex=1;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_attendence.png")),
//             Container(
//               width: 35,
//             ),
//
//             InkWell(
//                 onTap: () {
//                   setState(() {
//                     _currentIndex=2;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_payroll.png")),
//             InkWell(
//                 onTap: () {
//                   setState(() {
//
//                     _currentIndex=3;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_tricker.png")),
//           ],
//         ),
//       ),
//
//       floatingActionButton:keyboardOpen==true
//           ? SizedBox(): CircleAvatar(
//         radius: 30,
//         backgroundColor: Colors.white,
//         child: FloatingActionButton(
//           isExtended: false,shape: CircleBorder(
//           side: BorderSide(color: Main_Theme_WhiteCollor),
//         ),
//           foregroundColor: Main_Theme_WhiteCollor,
//           backgroundColor: Main_Theme_WhiteCollor,
//           onPressed: () {
//        //     Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavBarItemsMainFloationHomeScreen(),));
//           }, child: Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Image.asset("Assets/Logo/leaff.png" ),
//         ),),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//     );
//   }
//   bool keyboardOpen = false;
// }







import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/bootom_navigation_barItems_main_home_screen.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/self_bootom_navigation_convience.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonJobCard/self_bootom_navigaton_jobcard.dart';
import '../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import 'SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';

class SalfBootomNatchBarScreen extends StatefulWidget {
  const SalfBootomNatchBarScreen({super.key});

  @override
  State<SalfBootomNatchBarScreen> createState() => _SalfBootomNatchBarScreenState();
}

class _SalfBootomNatchBarScreenState extends State<SalfBootomNatchBarScreen> {

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [
    SelfBootomNavigatonBarHomeScreen(),
    SelfBootomNavigatonJobCard(),
    SelfBootomNavigationLeave(),
    SelfBootomNavigationConvienceScreen(),
  ];
  final _key=GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer:CustomLeftDrawer(),
      key: _key,
      appBar: PreferredSize(preferredSize: Size.fromHeight(80),
        /// ------------ Custom Main AppBAr -------------///
        child: CustomMainAppBar(
            leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png",
            center_appbar_text: "China National Petroleum Corporation",
            leading_ontab: () {
              _key.currentState!.openDrawer();
            }, is_need_trailing: true),
      ),

      body: bottomBarPages[_currentIndex],
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
                    _currentIndex=0;
                  });
                },
                child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png")),

            InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex=1;
                  });
                },
                child:

                CustomImageSction2(
                    height: 35, width: 35, radius: 5, image: "Assets/SelfIcon/jobcard.png", img_color: Main_Theme_WhiteCollor,)

            ),
            Container(
              width: 35,
            ),
            InkWell(
                onTap: () {
                  setState(() {

                    _currentIndex=2;
                  });
                },
                child: CustomImageSction2(height: 40, width: 35, radius: 5, image: "Assets/DashBoardIcons/aireplane_leave.png", img_color: Main_Theme_WhiteCollor,)),
            InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex=3;
                  });
                },
                child:  CustomImageSction2(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/convence.png", img_color: Main_Theme_WhiteCollor,)),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavBarItemsMainFloationHomeScreen(),));
          }, child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset("Assets/Logo/leaff.png" ),
        ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
  bool keyboardOpen = false;
}