import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomDrawer/CustomDrawerOption/custom_draweroption.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';

class CustomLeftDrawer extends StatelessWidget {
  const CustomLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Main_Theme_WhiteCollor,
            width: 291,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 13,right: 13,top: 13),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 122,
                    width: double.infinity,
                    child: Row(
                      children: [
                        CustomImageSction(height: 122, width: 100, radius: 0, image: "Assets/DrawerImage/testperson.png"),
                        Expanded(child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 42,
                                color: Color(0xffACC027).withOpacity(0.6),
                                child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w500, text: " jibika plexus", letterSpacing: 0.5, textColor: CustomButtonColor,),
                              ),
                              ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: " Abdur Rahman", letterSpacing: 0.5, textColor: presentsent_color.withOpacity(0.7),),
                              ColorCustomText(fontSize: 10, fontWeight: FontWeight.w500, text: "  Software Eng.", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                              ColorCustomText(fontSize: 10, fontWeight: FontWeight.w300, text: "  ID 4531454", letterSpacing: 0.5, textColor: CustomButtonColor,),
                              ColorCustomText(fontSize: 10, fontWeight: FontWeight.w300, text: "  Service Length: 2Y 6M", letterSpacing: 0.5, textColor: Main_Theme_textColor,),


                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenSlide(),));
                },
                child: Container(
                  height: 45,
                  width: 224,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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