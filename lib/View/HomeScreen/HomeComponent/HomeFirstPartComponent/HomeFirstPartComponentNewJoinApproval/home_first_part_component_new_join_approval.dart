import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/EmployeeProfile/employee_profile_screen.dart';

import '../../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../Utils/constants.dart';

class HomeFirstPartComponentNewJoinApproval extends StatefulWidget {
  const HomeFirstPartComponentNewJoinApproval({super.key});

  @override
  State<HomeFirstPartComponentNewJoinApproval> createState() => _HomeFirstPartComponentNewJoinApprovalState();
}

class _HomeFirstPartComponentNewJoinApprovalState extends State<HomeFirstPartComponentNewJoinApproval> {

  int _selectedIndex=0;
  List nameList=[
    "Waiting",
    "Disapproved",
  ];
  bool isChekin=false;
 int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "NEW JOIN APPROVAL")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 10,right: 10,left: 10,bottom: 6
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                        height: 48,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color:Color.fromRGBO(245, 245, 245, 1),
                            border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10,right: 10
                              ),
                              height: 16,width: 16 ,
                              child: CustomImageSction2(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png",img_color: Main_Theme_textColor.withOpacity(0.5),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10
                              ),
                              height: 12,
                              width: 2,
                              color: Main_Theme_textColor.withOpacity(0.1),
                            ),
                            Expanded(
                              child: Container(
                                  child: TextFormField(
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: 10),
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Main_Theme_textColor.withOpacity(0.30)
                                        ),
                                        hintText: "Search Here"
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: 53,
                    width: 40,
                    margin: EdgeInsets.only(
                        left: 10,right: 10
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7.95
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:Color.fromRGBO(245, 245, 245, 1),
                        border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                    ),
                    child: CustomImageSction(height: 17, width: 15, radius: 1, image: "Assets/DrawerImage/search_filter.png"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),color: Main_Theme_textColor_tir_Condition.withOpacity(0.5)),
              padding:  EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
              child: AnimatedToggleSwitch<int>.size(
                height: 35,
                current: max(_selectedIndex, 0),
                style: ToggleStyle(
                  backgroundColor: home_default_color,
                  indicatorColor: presentsent_color,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  indicatorBorderRadius: BorderRadius.circular(30),

                ),
                values:  [0, 1],
                iconOpacity: 1.0,
                selectedIconScale: 1.0,
                indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width/2),
                iconAnimationType: AnimationType.onHover,
                styleAnimationType: AnimationType.onHover,
                spacing: 2.0,
                customSeparatorBuilder: (context, local, global) {
                  final opacity =
                  ((global.position - local.position).abs() - 0.5)
                      .clamp(0.0, 1.0);
                  return VerticalDivider(
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Colors.white38.withOpacity(opacity));
                },
                customIconBuilder: (context, local, global) {
                  final text = nameList[local.index];
                  return Center(
                      child: Text(text,
                          style: GoogleFonts.poppins(
                              fontSize : 13,
                              fontWeight : FontWeight.w400,
                              letterSpacing :  0.3,
                              color: Color.lerp(Colors.black, Colors.white,
                                  local.animationValue))));
                },
                borderWidth: 1.0,
                onChanged: (i) => setState(() => _selectedIndex = i),
              ),
            ),
            SizedBox(height: 5,),
            CustomText(fontSize: fontSubTitle, fontWeight: FontWeight.w500, text: _selectedIndex==0?"Waiting 655":"DisApproved 100", letterSpacing: 0.1),

            Container(
              height: MediaQuery.of(context).size.height-75-55-55-25-35-13,
              width: double.infinity,
              margin: EdgeInsets.only(top: apps_div_margin-5),
              padding: EdgeInsets.symmetric(horizontal: 10), 
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => EmployeeProfileScreen(currentEmployeedataIndex: []),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(7)),
                          //  color: Color(0xffF3FCFB)
                          color:isChekin==false?  CheckOutColor.withOpacity(0.08) : CustomButtonColor.withOpacity(0.05),
                          border: Border(bottom: BorderSide( color:isChekin==false?CheckOutColor:  CustomButtonColor))
                      ),
                      margin: EdgeInsets.only(bottom: 7),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 6,right: 10),
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7),
                                bottomLeft: Radius.circular( selectedindex==index?0:7),
                                bottomRight:Radius.circular( selectedindex==index?0:7),
                              ),
                               ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                            //      backgroundImage:value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]!=""? NetworkImage("${GetStorage().read("APPS_IMG_BASEURL")}${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}"): NetworkImage("${custom_Avater}"),
                              backgroundImage: AssetImage("Assets/DrawerImage/testperson.png"),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ColorCustomText(fontSize: font12, fontWeight: FontWeight.w500, text: "ID: 544532", letterSpacing: 0.3, textColor: CustomButtonColor.withOpacity(0.7),),
                                        Text("Hafijur Rahman Mizan",
                                          overflow: TextOverflow.ellipsis
                                          ,style: GoogleFonts.poppins(
                                            fontSize: font13header,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3,
                                          ),),
                                        CustomText(fontSize: font12, fontWeight: FontWeight.w400, text: "HR Manager", letterSpacing: 0.3,  ),
                                      ],
                                    )),
                              SizedBox(width: 10,),
                                Container(
                                  height: 50,
                                  width: 1.5,
                                  color: Main_Theme_textColor.withOpacity(0.3),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 60,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(fontSize: font13header, fontWeight: FontWeight.w600, text: "Salary", letterSpacing: 0.5),
                                        CustomText(fontSize: font12, fontWeight: FontWeight.w600, text: "5000000", letterSpacing: 0.5),
                                      ],
                                    )
                                ),


                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    );

  }
}
