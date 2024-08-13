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
//   int widget.currentIndex = 0;
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
//       body: bottomBarPages[widget.currentIndex],
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
//                     widget.currentIndex=0;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png")),
//
//             InkWell(
//                 onTap: () {
//                   setState(() {
//                     widget.currentIndex=1;
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
//                     widget.currentIndex=2;
//                   });
//                 },
//                 child: CustomImageSction(height: 35, width: 35, radius: 5, image: "Assets/DashBoardIcons/b_bar_payroll.png")),
//             InkWell(
//                 onTap: () {
//                   setState(() {
//
//                     widget.currentIndex=3;
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
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/bootom_navigation_barItems_main_home_screen.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationConvince/self_bootom_navigation_convience.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigationLeave/self_bootom_navigation_leave.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/self_bootombar_employee_job_card.dart';
//import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeDashboard/self_bootom_navigaton_employee_dashboard.dart';
import '../../CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import '../../CustomWidget/CustomDrawer/CustomLeftDrawer/custom_left_drawer.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import 'SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';
import 'SelfBootomNavigatonEmployeeDashboard/self_bootom_navigaton_employee_dashboard.dart';

class SalfBootomNatchBarScreen extends StatefulWidget {
  SalfBootomNatchBarScreen({super.key,required this.currentIndex});
  int  currentIndex;
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

    SelfBootomBarJobCardScreen(),
    SelfBootomNavigatonEmployeeDashboard(),
    SelfBootomNavigationLeave(),
    SelfBootomNavigationConvienceScreen(),
    SelfBootomNavigatonBarHomeScreen(),

  ];
  final _key=GlobalKey<ScaffoldState>();

  double b_bar_icon_size=30;
  double b_bar_height=50;
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
            center_appbar_text: "${GetStorage().read("Company_name")}",
            leading_ontab: () {
              _key.currentState!.openDrawer();
            }, is_need_trailing: true),
      ),

      body: bottomBarPages[widget.currentIndex],
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
                    widget.currentIndex=0;
                  });
                },
                child: Container(
                  height: b_bar_height,
                  child: Column(
                    children: [
                      CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size, img_color:widget.currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/DashBoardIcons/b_bar_home.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "My Menu", letterSpacing: 0.3, textColor: widget.currentIndex==0? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                  ),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.currentIndex=1;
                  });
                },
                child: Container(
                  height: b_bar_height,
                  child: Column(
                    children: [
                        Icon(Icons.list_alt,size: 30,weight: 30,color: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.3),),
              //   CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/DashBoardIcons/b_bar_attendence.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Job Card", letterSpacing: 0.3, textColor: widget.currentIndex==1? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                  ),
                )),


            Container(
              width: MediaQuery.of(context).size.width*0.13,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.currentIndex=2;
                  });
                },
                child: Container(
                  height: b_bar_height,
                  child: Column(
                    children: [
                      CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5),  radius: 5, image: "Assets/SelfIcon/leave_icon.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Leave", letterSpacing: 0.3, textColor: widget.currentIndex==2? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                  ),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.currentIndex=3;
                  });
                },
                child: Container(
                  height: b_bar_height,
                  child: Column(
                    children: [
                      CustomImageSction2(height: b_bar_icon_size,width: b_bar_icon_size,  img_color: widget.currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5), radius: 5, image: "Assets/SelfIcon/Conveyance_edited1.png"),
                      SizedBox(height: 2,),
                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Conveyance", letterSpacing: 0.3, textColor: widget.currentIndex==3? Main_Theme_WhiteCollor:Main_Theme_WhiteCollor.withOpacity(0.5)),
                    ],
                  ),
                )),
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
            setState(() {
              widget.currentIndex=4;
            });
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