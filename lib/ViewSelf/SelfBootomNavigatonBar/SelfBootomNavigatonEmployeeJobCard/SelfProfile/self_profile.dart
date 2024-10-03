import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/AdminEmployeeController/admin_employee_controller.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomImageUpdateSection/custom_image_update_section.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_main_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfProfile/SelfProfileImageNameSubName/self_profileimage_name_subname.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import '../../../../CustomSelfWedget/CustomMySelfJobCard/CustomMySelfJobCard3rdPart/custom_myself_jobcard3rdpart.dart';
import '../../../../CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import '../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class ProfileScreen extends StatefulWidget {
    ProfileScreen({super.key ,required this.areYouFromEmployee});

   String areYouFromEmployee;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double container_Radius=50.0;
  double animatedheight=0;
  int selectedmonth=0;
  String? selectedValue;
  int key=0;

  int  selectedindex=-1;
  String ? getindex;
  int _selectedEmployee=-1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    dynamic getProfile =Provider.of<OnboardingEmployeeController>(context).GetEmployeeByIdList;
    List<SelfProfileInformationCard> SelfProfileInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/id.png",
        text1: "Employee Id",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["ID_CARD_NO"]}" ,
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/nid_card.png",
        text1: "Employee NID",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["NID_NO"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/user.png",
        text1: "Name",
        text2: widget.areYouFromEmployee =="user"?  "87" :"${getProfile["EMPLOYEE_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/birthday.png",
        text1: "Date of Birth",
        text2: widget.areYouFromEmployee =="user"?  "87" :"${getProfile["BIRTH_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/person.png",
        text1: "Father Name",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["FATHER_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/gender.png",
        text1: "Gender",
        text2: widget.areYouFromEmployee =="user"?  "87" :"${getProfile["GENDER"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/maritalstatus.png",
        text1: "Marital Status",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["MARITAL_STATUS"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile Number",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["PERSONAL_PHONE"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/email.png",
        text1: "Email",
        text2: widget.areYouFromEmployee =="user"?  "87" :"${getProfile["PERSONAL_EMAIL"]??""}",

      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/address.png",
        text1: "Present Address",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["PRESENT_ADDRESS_ENGLISH"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/address.png",
        text1: "Permanent Address",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["PERMANENT_ADDRESS_ENGLISH"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/Employee_Profile_Icon/religion.png",
        text1: "Religion",
        text2: widget.areYouFromEmployee =="user"?  "87" :"${getProfile["RELIGION_ENGLISH"]??""}",
      ),
    ];
    List<SelfProfileInformationCard> SelfOfficialInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Department",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DEPARTMENT_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Designation",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DESIGNATION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Section",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["SECTION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Staff Category",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["STAFF_CATEGORY_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Work Station",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["WORK_STATION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Joining Date",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["JOINING_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Inactive Date",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["INACTIVE_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Roster Type",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["ROSTER_TYPE_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Shift Plan",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["SHIFT_PLAN_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Employee Status",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMPLOYEE_STATUS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Roster Group",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["ROSTER_GROUP_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Second Weekend",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["WEEKEND2_ENGLISH"]}",
      ),
    ];
    List<SelfProfileInformationCard> SelfSalaryInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Gross Salary",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["GROSS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Basic",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["BASIC"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "House Rent",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["HOUSE_RENT"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Medical Allowance",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["MEDICAL_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Food Allowance",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["FOOD_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Other Allowance",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["OTHER_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Other Deduction",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["OTHER_DEDUCTION"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Over Time Rate",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["OT_RATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile Number",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["PERSONAL_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Bank & Branch Name",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["BANK_INFO_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Account Number",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["BANK_AC_NO"]}",
      ),
    ];
    List<SelfProfileInformationCard> SelfReferrerInformationCardlist= [
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer Name",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["REF_PERSON_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer Address",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["REF_PERSON_ADDRESS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile Number",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["REF_PERSON_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer E-mail",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["REF_PERSON_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Relation with Referrer",
        text2:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["NOMINEE_RELATION"]}",
      ),
    ];


    return SafeArea(
      child: Scaffold(
        backgroundColor: home_default_color,

        // body: Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: Column(
        //           children: [
        //                     customMainEmployeeProfile(
        //                       image:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMP_PHOTO_PATH"]}",
        //                       employeeCode:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMPCODE"]}",
        //                       employeeName:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMPLOYEE_NAME_ENGLISH"]}",
        //                       employeeDesignation:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DESIGNATION_ENGLISH"]}",
        //                       employeeDepartment:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DEPARTMENT_ENGLISH"]??""}",
        //                       birthday:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["BirthDate"]??""}",),
        //             Expanded(
        //               child: Container(
        //                         margin: EdgeInsets.only(left: 10,right: 10),
        //                         child: ListView.builder(
        //                           // physics: NeverScrollableScrollPhysics(),
        //                           // shrinkWrap: true,
        //                           itemCount:profile_list.length,
        //                           itemBuilder: (context, index) {
        //                             return InkWell(
        //                               onTap: () {
        //                                 setState(() {
        //                                   selectedindex=index;
        //                                   animatedheight=0;
        //                                   Future.delayed(Duration(milliseconds: 100),() {
        //                                     setState(() {
        //                                       if(getindex=="$index"){
        //                                         animatedheight=0;
        //                                         getindex='';
        //                                       }else{
        //                                         animatedheight=index==0?795:index==1?780:index==2?780:400;
        //                                         getindex="$index";
        //                                       }
        //                                     });
        //                                   },);
        //                                 });
        //                               },
        //                               child: Container(
        //                                 decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.all( Radius.circular(7)),
        //                                     color: Main_Theme_textColor_tir_Condition.withOpacity(0.1),
        //                                     //  color:  CustomButtonColor.withOpacity(0.05),
        //                                     border: Border(bottom: BorderSide( color: CustomButtonColor))
        //                                 ),
        //                                 margin: EdgeInsets.only(bottom: 7),
        //                                 child: Column(
        //                                   children: [
        //                                     Container(
        //                                       padding: EdgeInsets.only(left: 10,right: 10),
        //                                       height: 51,
        //                                       decoration: BoxDecoration(
        //                                           borderRadius: BorderRadius.only(
        //                                             topLeft: Radius.circular(7),
        //                                             topRight: Radius.circular(7),
        //                                             bottomLeft: Radius.circular( selectedindex==index?0:7),
        //                                             bottomRight:Radius.circular( selectedindex==index?0:7),
        //                                           ),
        //                                       //    color: Main_Theme_textColor_tir_Condition.withOpacity(0.1)
        //                                       ),
        //                                       width: double.infinity,
        //                                       child: Row(
        //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                         children: [
        //                                           CustomText(fontSize: font15, fontWeight: FontWeight.w600, text: "${profile_list[index]}", letterSpacing: 0.3),
        //                                           selectedindex==index && getindex  == "$index"?
        //                                           Icon(Icons.keyboard_arrow_up,)
        //                                               :
        //                                           Icon(Icons.keyboard_arrow_down,),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     selectedindex==index&&index==3? SizedBox(height: 7,):Container()  ,
        //                                     selectedindex==index&&index==3 && getindex  == "$index" ? Row(
        //                                       mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        //                                       children: [
        //                                         CustomImageUpdateScetion2(width: 100,height:50 ,image: "Assets/PrimaryInformation/email.png", heddintext: '',),
        //                                       ],
        //                                     ) :Container(),
        //
        //
        //                                     selectedindex==index? AnimatedContainer(
        //                                       height: animatedheight,
        //                                       width: double.infinity,
        //                                       duration: Duration(milliseconds: 400),
        //                                       color: home_default_color,
        //                                       child: Container(
        //                                           child:  ListView.builder(
        //                                             physics: NeverScrollableScrollPhysics(),
        //                                             itemCount:
        //                                             selectedindex==0? SelfProfileInformationCardlist.length
        //                                             :
        //                                             selectedindex==1? SelfOfficialInformationCardlist.length
        //                                             :
        //                                             selectedindex==2? SelfSalaryInformationCardlist.length
        //                                             :
        //                                             SelfReferrerInformationCardlist.length,
        //
        //                                             itemBuilder: (context, index) {
        //                                               return
        //                                                 selectedindex==0?
        //                                                 Container(
        //                                                   decoration: BoxDecoration(
        //                                                     borderRadius: BorderRadius.circular(7),
        //                                                   ),
        //                                                   margin: EdgeInsets.only(bottom: 5),
        //                                                   padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        //                                                   child: Column(
        //                                                     children: [
        //                                                       Row(
        //                                                         children: [
        //                                                           SvgPicture.asset(
        //                                                             'Assets/Employee_Profile_Icon/profileinf.svg',
        //                                                             height: 30.0,
        //                                                             width: 32.0,
        //                                                             color: Main_Theme_textColor,
        //                                                           ),
        //                                                           SizedBox(width: 10,),
        //                                                           Column(
        //                                                             crossAxisAlignment: CrossAxisAlignment.start,
        //                                                             mainAxisAlignment: MainAxisAlignment.center,
        //                                                             children: [
        //                                                               Text(
        //                                                                 SelfProfileInformationCardlist[index].text1,
        //                                                                 style: customHeadingTextStyle(Main_Theme_textColor.withOpacity(0.7)),
        //                                                               ),
        //                                                               SelfProfileInformationCardlist[index].text2==""?Container():  Text(
        //                                                                 SelfProfileInformationCardlist[index].text2,
        //                                                                 style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.9)),
        //                                                               ),
        //                                                             ],
        //                                                           ),
        //                                                         ],
        //                                                       ),
        //                                                       Divider()
        //                                                     ],
        //                                                   ),
        //                                                 ):
        //                                                 selectedindex==1?
        //                                                 SelfProfileImageNameSubName(
        //                                                 image: "${SelfOfficialInformationCardlist[index].image}",
        //                                                 text1: "${SelfOfficialInformationCardlist[index].text1}",
        //                                                 text2: "${SelfOfficialInformationCardlist[index].text2}",
        //                                               ) :
        //                                                 selectedindex==2?
        //                                                 SelfProfileImageNameSubName(
        //                                                 image: "${SelfSalaryInformationCardlist[index].image}",
        //                                                 text1: "${SelfSalaryInformationCardlist[index].text1}",
        //                                                 text2: "${SelfSalaryInformationCardlist[index].text2}",
        //                                               ):
        //                                                 SelfProfileImageNameSubName(
        //                                                 image: "${SelfReferrerInformationCardlist[index].image}",
        //                                                 text1: "${SelfReferrerInformationCardlist[index].text1}",
        //                                                 text2: "${SelfReferrerInformationCardlist[index].text2}",
        //                                               );
        //                                             },)
        //                                       ) ,
        //                                     ) : Container(),
        //                                     selectedindex==index&&index==0? SizedBox(height: 7,):Container()  ,
        //                                     selectedindex==index&&index==0 && getindex  == "$index" ? Row(
        //                                       mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        //                                       children: [
        //                                         CustomImageUpdateScetion2(width: 100,height:50 ,image: "Assets/PrimaryInformation/email.png", heddintext: 'Signature',),
        //                                         SizedBox(width: 15,),
        //                                         CustomImageUpdateScetion2(width: 50,height:50 ,image: "Assets/PrimaryInformation/qrcode.png", heddintext: 'QR Code',),
        //                                       ],
        //                                     ) :Container(),
        //                                   ],
        //                                 ),
        //                               ),
        //                             );
        //                           },),
        //                       ),
        //
        //             ),
        //           ],
        //         ),
        //       ),
        //       widget.areYouFromEmployee =="user"?Container(
        //         height: 1,
        //         width: double.infinity,
        //       ):
        //       Consumer<EmployeeAdminProvider>(
        //           builder: (context, value, child) {
        //             return Consumer<CounterProvider>(
        //               builder: (context, selected, child) =>
        //                Container(
        //                  height: 100,
        //                  width: double.infinity,
        //                  color: Colors.red.withOpacity(0.2),
        //                )
        //             );
        //           }
        //       ),
        //     ],
        //   ),
        // ),

        body:
        Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// First part -----------------------------
                    customMainEmployeeProfile(
                      profile: getProfile,
                      is_need_edit_button_on_short_profile: "true",
                      image:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMP_PHOTO_PATH"]}",
                      employeeCode:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMPCODE"]}",
                      employeeName:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["EMPLOYEE_NAME_ENGLISH"]}",
                      employeeDesignation:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DESIGNATION_ENGLISH"]}",
                      employeeDepartment:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["DEPARTMENT_ENGLISH"]??""}",
                      birthday:widget.areYouFromEmployee =="user"?  "87" : "${getProfile["BirthDate"]??""}",),
                   /// Second part  -------------------------------
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:profile_list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex=index;
                                animatedheight=0;
                                Future.delayed(Duration(milliseconds: 100),() {
                                  setState(() {
                                    if(getindex=="$index"){
                                      animatedheight=0;
                                      getindex='';
                                    }else{
                                      animatedheight=index==0?795:index==1?780:index==2?780:400;
                                      getindex="$index";
                                    }
                                  });
                                },);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(7)),
                                  color: Main_Theme_textColor_tir_Condition.withOpacity(0.1),
                                  //  color:  CustomButtonColor.withOpacity(0.05),
                                  border: Border(bottom: BorderSide( color: CustomButtonColor))
                              ),
                              margin: EdgeInsets.only(bottom: 7),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10,right: 10),
                                    height: 51,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                          bottomLeft: Radius.circular( selectedindex==index?0:7),
                                          bottomRight:Radius.circular( selectedindex==index?0:7),
                                        ),
                                    //    color: Main_Theme_textColor_tir_Condition.withOpacity(0.1)
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(fontSize: font15, fontWeight: FontWeight.w600, text: "${profile_list[index]}", letterSpacing: 0.3),
                                        selectedindex==index && getindex  == "$index"?
                                        Icon(Icons.keyboard_arrow_up,)
                                            :
                                        Icon(Icons.keyboard_arrow_down,),
                                      ],
                                    ),
                                  ),
                                  selectedindex==index&&index==3? SizedBox(height: 7,):Container()  ,
                                  selectedindex==index&&index==3 && getindex  == "$index" ? Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                                    children: [
                                      CustomImageUpdateScetion2(width: 100,height:50 ,image: "Assets/PrimaryInformation/email.png", heddintext: '',),
                                    ],
                                  ) :Container(),


                                  selectedindex==index? AnimatedContainer(
                                    height: animatedheight,
                                    width: double.infinity,
                                    duration: Duration(milliseconds: 400),
                                    color: home_default_color,
                                    child: Container(
                                        child:  ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount:
                                          selectedindex==0? SelfProfileInformationCardlist.length
                                          :
                                          selectedindex==1? SelfOfficialInformationCardlist.length
                                          :
                                          selectedindex==2? SelfSalaryInformationCardlist.length
                                          :
                                          SelfReferrerInformationCardlist.length,

                                          itemBuilder: (context, index) {
                                            return
                                              selectedindex==0?
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                ),
                                                margin: EdgeInsets.only(bottom: 5),
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'Assets/Employee_Profile_Icon/profileinf.svg',
                                                          height: 30.0,
                                                          width: 32.0,
                                                          color: Main_Theme_textColor,
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              SelfProfileInformationCardlist[index].text1,
                                                              style: customHeadingTextStyle(Main_Theme_textColor.withOpacity(0.7)),
                                                            ),
                                                            SelfProfileInformationCardlist[index].text2==""?Container():  Text(
                                                              SelfProfileInformationCardlist[index].text2,
                                                              style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.9)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Divider()
                                                  ],
                                                ),
                                              ):
                                              selectedindex==1?
                                              SelfProfileImageNameSubName(
                                              image: "${SelfOfficialInformationCardlist[index].image}",
                                              text1: "${SelfOfficialInformationCardlist[index].text1}",
                                              text2: "${SelfOfficialInformationCardlist[index].text2}",
                                            ) :
                                              selectedindex==2?
                                              SelfProfileImageNameSubName(
                                              image: "${SelfSalaryInformationCardlist[index].image}",
                                              text1: "${SelfSalaryInformationCardlist[index].text1}",
                                              text2: "${SelfSalaryInformationCardlist[index].text2}",
                                            ):
                                              SelfProfileImageNameSubName(
                                              image: "${SelfReferrerInformationCardlist[index].image}",
                                              text1: "${SelfReferrerInformationCardlist[index].text1}",
                                              text2: "${SelfReferrerInformationCardlist[index].text2}",
                                            );
                                          },)
                                    ) ,
                                  ) : Container(),
                                  selectedindex==index&&index==0? SizedBox(height: 7,):Container()  ,
                                  selectedindex==index&&index==0 && getindex  == "$index" ? Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                                    children: [
                                      CustomImageUpdateScetion2(width: 100,height:50 ,image: "Assets/PrimaryInformation/email.png", heddintext: 'Signature',),
                                      SizedBox(width: 15,),
                                      CustomImageUpdateScetion2(width: 50,height:50 ,image: "Assets/PrimaryInformation/qrcode.png", heddintext: 'QR Code',),
                                    ],
                                  ) :Container(),
                                ],
                              ),
                            ),
                          );
                        },),
                    ),
                    SizedBox(height: 200,)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child:    widget.areYouFromEmployee =="user"?Container(
                  height: 1,
                  width: double.infinity,
                ):
                Consumer<EmployeeAdminProvider>(
                    builder: (context, value, child) {
                      return Consumer<CounterProvider>(
                        builder: (context, selected, child) =>
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11)),
                                color: home_default_color.withOpacity(0.8),
                              ),
                              child:  Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.Admin_GetEmployeeListByStatus.length,
                                  itemBuilder: (context, index) => InkWell(
                                    splashColor: Colors.white.withOpacity(0.0),
                                    onTap: () {
                                      Provider.of<CounterProvider>(context, listen: false).selectedEmployeeforGetProfileFunction(index);
                                      Provider.of<OnboardingEmployeeController>(context, listen: false).GetEmployeeByIdListProvider(
                                          "${value.Admin_GetEmployeeListByStatus[index]["IdCardNo"]}",
                                          "${GetStorage().read("mobile_id")}",
                                          context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 50,
                                            backgroundColor:selected.selectedEmployeeforGetProfile==index?
                                            presentsent_color.withOpacity(0.7):
                                            leave_color.withOpacity(0.7),
                                            child: CircleAvatar(
                                              radius: selected.selectedEmployeeforGetProfile==index? 42:44,
                                              backgroundImage: NetworkImage(
                                                  "${GetStorage().read("APPS_IMG_BASEURL")}${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}"),
                                              //   child:value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]!=""? CustomImageSctionNetwork(height: 55, width: 45, radius: 7, image: "${value.Admin_GetEmployeeListByStatus[index]["EmpPhotoPath"]}"):Image(image: NetworkImage("https://greenmartbd.net/images/default.jpg"),height: 70,width: 50,fit: BoxFit.fill,),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${value.Admin_GetEmployeeListByStatus[index]["IdCardNo"]}",
                                              style:selected.selectedEmployeeforGetProfile==index?GoogleFonts.poppins(
                                                  fontSize: fontTitle,
                                                  fontWeight: FontWeight.bold
                                              ):
                                              customHeadingTextStyle(
                                                  Colors.black.withOpacity(0.7)
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  ),),),
                            ),
                      );
                    }
                )
            )
          ],
        ),
     ),
    );
  }
  List profile_list=[
    "Profile Info",
    "Official Info",
    "Salary Info",
    "Referrer Info",
  ];

}

class SelfProfileInformationCard{
  SelfProfileInformationCard({
    required this.image,
    required this.text1,
    required this.text2,
});
  String image;
  String text1;
  String text2;
}
