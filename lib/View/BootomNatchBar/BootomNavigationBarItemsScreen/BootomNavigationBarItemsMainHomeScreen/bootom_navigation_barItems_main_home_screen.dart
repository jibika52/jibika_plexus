

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/AdminEmployeeController/admin_employee_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/CreateEmployeeScreen/create_employee.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsMainHomeScreen/EmployeeProfile/employee_profile_screen.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:provider/provider.dart';

import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class BootomNavBarItemsMainFloationHomeScreen extends StatefulWidget {
  const BootomNavBarItemsMainFloationHomeScreen({super.key});

  @override
  State<BootomNavBarItemsMainFloationHomeScreen> createState() => _BootomNavBarItemsMainFloationHomeScreenState();
}

class _BootomNavBarItemsMainFloationHomeScreenState extends State<BootomNavBarItemsMainFloationHomeScreen> {

  double animatwidth=117;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  int selectedmonth=0;
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body:
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container (
                  height: 55,
                  width: w,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                    color: Main_Theme_WhiteCollor,
                  ),
                  child: Stack(
                    children: [
                      Container(
                          height: 38,
                          width: 160,
                          padding: EdgeInsets.only(top: 2),
                          child:  Container(
                            height: 38,
                            child: AnimatedToggleSwitch.size(

                              clipBehavior: Clip.none,

                              current:_isActive ,
                              values: [false,true],
                              iconOpacity: 0.8,
                              indicatorSize: Size.fromWidth(120),
                              customIconBuilder: (context,local,global){
                                return  AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  child: Text(local.value? "Inactive":"Active",style: TextStyle(
                                      fontSize: _isActive? 11:11,
                                      fontWeight:  _isActive? FontWeight.w400 : FontWeight.w400,
                                      color:  Colors.black ),),
                                );},

                              borderWidth: 1.0,
                              iconAnimationCurve: Curves.linear,
                              //  selectedIconOpacity: 1.0,
                              selectedIconOpacity: 0.8,
                              onChanged: (value) => setState(() {
                                _isActive=!_isActive;
                                print(_isActive);
                                if(_isActive==true){
                                  Provider.of<EmployeeAdminProvider>(context,listen: false).GetDailyAttendanceCounterListProvider("${GetStorage().read("mobile_id")}", "Inactive", 1, context);
                                }else{
                                  Provider.of<EmployeeAdminProvider>(context,listen: false).GetDailyAttendanceCounterListProvider("${GetStorage().read("mobile_id")}", "Active", 1, context);

                                }
                              }),
                              styleBuilder: (b) => ToggleStyle(
                                borderColor: Main_Theme_textColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                backgroundColor: b ? Colors.white : Colors.white,
                                indicatorColor: b ? Colors.red : Colors.green,
                                indicatorBorderRadius: BorderRadius.circular(b ? 4.0 : 4.0),
                              ),

                            ),
                          )
                      ),

                      Positioned(
                          top: 0.9,
                          right: 0,
                          bottom: 2,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 50,
                            width: animatwidth,

                            padding: EdgeInsets.only(left: 7,right: 7),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 10,
                                    child: Container(
                                      height: 55,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color:Color.fromRGBO(245, 245, 245, 1),
                                          border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _is_click_date=!_is_click_date;
                                                if(_is_click_date==true){
                                                  if(w>530){
                                                    animatwidth=530;
                                                  }else{
                                                    animatwidth=w-13;
                                                  }
                                                }else{
                                                  animatwidth=117.0;
                                                }
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10,right: 10
                                              ),
                                              height: 16,width: 16 ,
                                              child: CustomImageSction(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                                            ),
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
                                                      contentPadding: EdgeInsets.only(bottom: 14),
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
                                  height: 55,
                                  width: 40,
                                  margin: EdgeInsets.only(
                                      left: 10,right: 0
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical:2.95
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
                          ))
                    ],
                  ),
                ),

                Expanded(
                  child: Consumer<EmployeeAdminProvider>(
                    builder: (context, value, child) {
                      print("${value.Admin_GetEmployeeListByStatus}");
                    return value.Admin_GetEmployeeListByStatus==null?Center(child: CircularProgressIndicator(backgroundColor: CustomButtonColor,),) : Container(
                        margin: EdgeInsets.only(top: 7),
                        width: 400,
                        color: Main_Theme_WhiteCollor,
                        padding: EdgeInsets.only(
                            left: 10,
                            right: 10
                        ),
                        child: Container(
                            child: ListView.builder(
                              itemCount: value.Admin_GetEmployeeListByStatus.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeProfileScreen(
                                    currentEmployeedataIndex: value.Admin_GetEmployeeListByStatus[index],
                                  ),)),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all( Radius.circular(7)),
                                        color:  _isActive==false?
                                        presentsent_color.withOpacity(0.05):
                                        absent_color.withOpacity(0.1),

                                        border: Border(bottom: BorderSide(color:  _isActive==false?
                                        presentsent_color:
                                        absent_color,))
                                    ),
                                    margin: EdgeInsets.only(bottom: 7),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10,right: 0,top: 5,bottom: 5),
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),

                                            color:  leave_color.withOpacity(0.05),
                                            //  border: Border(bottom: BorderSide(color:_selectedindex==index?CustomButtonColor.withOpacity(0.05): CustomButtonColor))
                                          ),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 55,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                                ),
                                                margin: EdgeInsets.only(right: 5),
                                                child:value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]!=""? CustomImageSctionNetwork(height: 55, width: 45, radius: 7, image: "${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}"):Image(image: NetworkImage("https://greenmartbd.net/images/default.jpg"),height: 70,width: 50,fit: BoxFit.fill,),
                                              ),

                                              SizedBox(width: 5,),
                                              Expanded(
                                                flex: 4,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(value.Admin_GetEmployeeListByStatus[index]["EmployeeNameEnglish"]??"",
                                                        overflow: TextOverflow.ellipsis
                                                        ,style: GoogleFonts.poppins(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w500,
                                                          letterSpacing: 0.3,
                                                        ),),
                                                      SizedBox(height: 1,),
                                                      CustomText(fontSize: 12, fontWeight: FontWeight.w300, text:value.Admin_GetEmployeeListByStatus[index]["Designation"]??"", letterSpacing: 0.3,  ),
                                                      SizedBox(height: 1,),
                                                      CustomText(fontSize: 12, fontWeight: FontWeight.w300, text: value.Admin_GetEmployeeListByStatus[index]["Department"]??"", letterSpacing: 0.3,  ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10,),


                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomImageSction(height: 15, width: 15, radius: 1, image: "Assets/DashBoardIcons/rating.png"),
                                                      SizedBox(width: 5,),
                                                      CustomImageSction(height: 15, width: 15, radius: 1, image: "Assets/DashBoardIcons/rating.png"),
                                                      SizedBox(width: 5,),
                                                      CustomImageSction(height: 15, width: 15, radius: 1, image: "Assets/DashBoardIcons/rating.png"),
                                                      SizedBox(width: 5,),
                                                      CustomImageSction(height: 15, width: 15, radius: 1, image: "Assets/DashBoardIcons/rating.png"),
                                                      Spacer(),
                                                      IconButton(onPressed: () {

                                                      }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 22,color: Main_Theme_textColor,))
                                                    ],
                                                  ),
                                                ),
                                              )


                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },)
                        ),
                      );
                    },
                  ),
                )

              ],
            ),
          ) ,
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder( // <= Change BeveledRectangleBorder to RoundedRectangularBorder
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        backgroundColor: CustomButtonColor,
        onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => CreateNewEmployeeScreen(),));
      },
      child:Image.asset("Assets/DashBoardIcons/employee_management.png",height: 30,width: 30,fit: BoxFit.fill,color: Main_Theme_WhiteCollor,),
      ),
    );
  }
  bool  isActive=true;
  bool _isActive=false;

}
