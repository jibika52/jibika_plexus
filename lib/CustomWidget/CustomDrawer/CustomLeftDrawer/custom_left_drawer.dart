import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomDrawer/CustomDrawerOption/custom_draweroption.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import 'package:provider/provider.dart';
class CustomLeftDrawer extends StatelessWidget {
  const CustomLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
  //  final selfORAdminShortInformationdata = Provider.of<HomeProvider>(context).selfORAdminShortInformationdata;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Main_Theme_WhiteCollor,
            width: 291,
            height: MediaQuery.of(context).size.height,
            // padding: EdgeInsets.only(left: 13,right: 13,top: 13),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 122,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        //    color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Container(
                              height: 122/3*2,
                              decoration: BoxDecoration(
                            // color: Colors.green,
                              image: DecorationImage(image: AssetImage("Assets/SelfIcon/profile_background.jpg"),fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(5)),
                              ),

                            Container(
                              height: 122/3,
                              decoration: BoxDecoration(
                            //  color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5)),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 122/3-20,
                        left: 20,
                     //   child:CustomImageSctionNetwork(height: 100, width: 100, radius: 100, image: "${GetStorage().read("APPS_IMG_BASEURL")}${GetStorage().read("APPS_IMG_Path")}"),
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(4.5),
                        decoration: BoxDecoration(
                            color: home_default_color,
                            borderRadius: BorderRadius.circular(50)),
                           child:CustomImageSctionNetwork(height: 100, width: 100, radius: 100, image: "${GetStorage().read("APPS_IMG_Path")}"),
                      ),
                      ),
                      // Positioned(
                      //   top: 122/2-5,
                      //   left: 130,
                      //   right: 20,
                      //   child: Text("${selfORAdminShortInformationdata["Unit"]}",style: TextStyle(
                      //     fontSize: 16,fontWeight: FontWeight.w500,
                      //     overflow: TextOverflow.ellipsis
                      //   ))
                      // )
                    ],
                  ),

                Padding(padding: EdgeInsets.only(left: 13,right: 13),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 30,
                            // color: Color(0xffACC027).withOpacity(0.6),
                            child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w600, text: " ${GetStorage().read("APPS_User_Name")}",
                              overflow: TextOverflow.ellipsis,letterSpacing: 0.5, textColor: CustomButtonColor,),
                          ),
                          //  ColorCustomText(fontSize: 20, fontWeight: FontWeight.w600, text: " ${GetStorage().read("APPS_User_Name")}", letterSpacing: 0.5, textColor: presentsent_color.withOpacity(0.7),),
                          ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "  Software Eng.", letterSpacing: 0.5, textColor: Main_Theme_textColor.withOpacity(0.7),),
                          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "  ID 4531454", letterSpacing: 0.5, textColor: CustomButtonColor,),
                          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "  Service Length: 2Y 6M", letterSpacing: 0.5, textColor: Main_Theme_textColor,),


                        ],
                      ),
                    ),

                    /// Previous Model --------------------------------------------------------------

                    SizedBox(height: 10),
                    Consumer<CounterProvider>(
                      builder: (context, value, child) => GetStorage().read("user_type_id")==1003?Divider(): Container(
                        alignment: Alignment.centerRight,
                        child: CustomButton(onTap: () {
                          if(value.are_you_user_or_admin=="user"){
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BootomNatchBarScreen(
                              index: 4,
                            ),));
                          }else{
                            Navigator.push(context, CupertinoPageRoute(  builder: (context) => SalfBootomNatchBarScreen(
                              currentIndex: 4,
                            ),));
                          }

                        }, text:value.are_you_user_or_admin=="user"? "Switch to Admin mode":"Switch to Self mode"  , button_text_fontSize: 14, button_height: 35, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 30),
                      ),
                    ),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawericonong.png", name: "Home", size: 16,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/leaveupbrla.png", name: "Planning", size: 20,size2: 20,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_person_option.png", name: "Employee Management", size: 16,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_attendence_option.png", name: "Attendance Calendar ", size: 18, size2: 19,),
                    CustomDrawerOption(image: "Assets/DrawerImage/leaveupbrla.png", name: "Leave Manager", size: 20, size2: 20,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_employee_option.png", name: "Employee Profile", size: 17,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_employee_trace_option.png", name: "Employee Tracker", size: 19,size2: 19,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_employee_cash_option.png", name: "Payroll Manager", size: 19,size2: 18,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_reportbox_option.png", name: "Stationary Manager", size: 18,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_monysend.png", name: "Complaint Box", size: 19,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_reportbox_option.png", name: "Report Manager", size: 18, size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_reportbox_option.png", name: "Privacy Policy", size: 18,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_tirmscondition_option.png", name: "Terms & Condition", size: 17,size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_disclimer_option.png", name: "Disclaimer", size: 16, size2: 16,),
                    CustomDrawerOption(image: "Assets/DrawerImage/drawer_setting_option.png", name: "Setting", size: 17, size2: 16,),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, CupertinoPageRoute(builder: (context) => SalfBootomNatchBarScreen(
                    //         currentIndex: 4,
                    //       ),));
                    //     },
                    //     child: CustomDrawerOption(image: "Assets/DrawerImage/drawericonong.png", name: "Employee home", size: 17, size2: 16,)),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.push(context, CupertinoPageRoute(builder: (context) => BootomNatchBarScreen(
                    //         index: 4,
                    //       ),));
                    //     },
                    //     child: CustomDrawerOption(image: "Assets/DrawerImage/drawericonong.png", name: "Admin home", size: 17, size2: 16,)),
                  ],
                ),
                ),
                  SizedBox(height: 60,)
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  GetStorage().erase();
                  stopService();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenSlide(),));
                },
                child: Container(
                  height: 40,
                  width: 224,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE3F0ED),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageSction(height: 17.5, width: 17.5, radius: 0, image: "Assets/DrawerImage/drawer_logout_option.png"),
                      SizedBox(width: 7,),
                      ColorCustomText(fontSize: 16, fontWeight: FontWeight.w400, text: "Log out", letterSpacing: 0.2, textColor: CustomButtonColor)
                    ],
                  )
                ),

              )


          ),
        ],
      ),
    );
  }
}
