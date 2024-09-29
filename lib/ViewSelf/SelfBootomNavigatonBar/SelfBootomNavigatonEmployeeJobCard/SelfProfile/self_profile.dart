import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomImageUpdateSection/custom_image_update_section.dart';
import 'package:jibika_plexus/CustomSelfWedget/myself_leave_status.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/SelfBootomNavigatonEmployeeJobCard/SelfProfile/SelfProfileImageNameSubName/self_profileimage_name_subname.dart';

import '../../../../CustomSelfWedget/CustomMySelfJobCard/CustomMySelfJobCard3rdPart/custom_myself_jobcard3rdpart.dart';
import '../../../../CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import '../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class ProfileScreen extends StatefulWidget {
    ProfileScreen({super.key,required this.getProfile,required this.areYouFromEmployee});
   dynamic getProfile;
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
  @override
  Widget build(BuildContext context) {
    print("ssssssssssssssssssssssssssssssss${widget.getProfile}");

    List<SelfProfileInformationCard> SelfProfileInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Id no",
        text2: "${widget.getProfile["ID_CARD_NO"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Nid",
        text2: "${widget.getProfile["NID_NO"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Employee name",
        text2: "${widget.getProfile["EMPLOYEE_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Date of birth",
        text2: "${widget.getProfile["BIRTH_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Father name",
        text2: "${widget.getProfile["FATHER_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Gender",
        text2: "${widget.getProfile["GENDER"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Marital status",
        text2: "${widget.getProfile["MARITAL_STATUS"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile number",
        text2: "${widget.getProfile["PERSONAL_PHONE"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Gmail",
        text2: "${widget.getProfile["PERSONAL_EMAIL"]??""}",

      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Present address",
        text2: "${widget.getProfile["PRESENT_ADDRESS_ENGLISH"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Permanent address",
        text2: "${widget.getProfile["PERMANENT_ADDRESS_ENGLISH"]??""}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Religion",
        text2: "${widget.getProfile["RELIGION_ENGLISH"]??""}",
      ),
    ];

    List<SelfProfileInformationCard> SelfOfficialInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Department",
        text2:"${widget.getProfile["DEPARTMENT_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Designation",
        text2:"${widget.getProfile["DESIGNATION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Section",
        text2:"${widget.getProfile["SECTION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Staff Category",
        text2:"${widget.getProfile["STAFF_CATEGORY_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Work Station",
        text2:"${widget.getProfile["WORK_STATION_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Joining Date",
        text2:"${widget.getProfile["JOINING_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Inactive Date",
        text2:"${widget.getProfile["INACTIVE_DATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Roster Type",
        text2:"${widget.getProfile["ROSTER_TYPE_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Shift Plan",
        text2:"${widget.getProfile["SHIFT_PLAN_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Employee Status",
        text2:"${widget.getProfile["EMPLOYEE_STATUS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Roster Group",
        text2:"${widget.getProfile["ROSTER_GROUP_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Second Weekend",
        text2:"${widget.getProfile["WEEKEND2_ENGLISH"]}",
      ),
    ];

    List<SelfProfileInformationCard> SelfSalaryInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Gross Salary",
        text2:"${widget.getProfile["GROSS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Basic",
        text2:"${widget.getProfile["BASIC"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "House Rent",
        text2:"${widget.getProfile["HOUSE_RENT"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Medical Allowance",
        text2:"${widget.getProfile["MEDICAL_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Food Allowance",
        text2:"${widget.getProfile["FOOD_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Other Allowance",
        text2:"${widget.getProfile["OTHER_ALLOWANCE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Other Deduction",
        text2:"${widget.getProfile["OTHER_DEDUCTION"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Over Time Rate",
        text2:"${widget.getProfile["OT_RATE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile Number",
        text2:"${widget.getProfile["PERSONAL_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Bank & Branch Name",
        text2:"${widget.getProfile["BANK_INFO_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Account Number",
        text2:"${widget.getProfile["BANK_AC_NO"]}",
      ),
    ];

    List<SelfProfileInformationCard> SelfReferrerInformationCardlist=[
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer Name",
        text2:"${widget.getProfile["REF_PERSON_NAME_ENGLISH"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer Address",
        text2:"${widget.getProfile["REF_PERSON_ADDRESS"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Mobile Number",
        text2:"${widget.getProfile["REF_PERSON_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Referrer E-mail",
        text2:"${widget.getProfile["REF_PERSON_PHONE"]}",
      ),
      SelfProfileInformationCard(
        image: "Assets/DashBoardIcons/personalcard.png",
        text1: "Relation with Referrer",
        text2:"${widget.getProfile["NOMINEE_RELATION"]}",
      ),
    ];


    return SafeArea(
      child: Scaffold(
        backgroundColor: home_default_color,
        // appBar: PreferredSize(preferredSize: Size.fromHeight(75),
        //     child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
        //         text: "Uzzal Biswas")),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// First part -----------------------------
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 237,
                      width: double.infinity,
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(container_Radius),
                         bottomRight: Radius.circular(container_Radius),
                       ) ,
                     ),
                     child: Column(
                       children: [
                         Container(
                           height: 214,
                           width: double.infinity,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(container_Radius),
                               bottomRight: Radius.circular(container_Radius),
                             ) ,
                             color: Colors.amberAccent,
                             gradient: LinearGradient(colors: [
                               Main_Theme_textColor_tir_Condition,
                               Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                               Main_Theme_textColor_tir_Condition.withOpacity(0.7),
                               Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                               Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                               Main_Theme_textColor_tir_Condition.withOpacity(0.4),
                               Main_Theme_textColor_tir_Condition.withOpacity(0.3),
                             ])
                           ),
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 16,top: 13),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CustomImageSctionNetwork(height: 84, width: 84, radius: 100, image:"${widget.getProfile["EMP_PHOTO_PATH"]}"),
                                     SizedBox(width: 23,),
                                     Container(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Container(
                                             alignment: Alignment.center,
                                             height: 23,
                                             width: 80,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(7),
                                               color: Color(0xffACC027).withOpacity(0.6),
                                             ),
                                             child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${widget.getProfile["EMPCODE"]}", letterSpacing: 0.5, textColor: Main_Theme_WhiteCollor,),
                                           ),
                                           SizedBox(height:2,),
                                           ColorCustomText(fontSize: 18, fontWeight: FontWeight.w400, text: "${widget.getProfile["EMPLOYEE_NAME_ENGLISH"]}", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "${widget.getProfile["DESIGNATION_ENGLISH"]}", letterSpacing: 0.5, textColor: Main_Theme_textColor,),

                                         ],
                                       ),
                                     ),
                                     Spacer(),
                                     CircleAvatar(
                                       backgroundColor:  Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                                       radius: 20,
                                       child: CustomImageSction2(height: 20, width: 20, radius: 5, image: "Assets/SelfIcon/edit_iconss.png", img_color: Colors.white),
                                     ),
                                     SizedBox(width: 10,)
                                   ],
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Container(
                                 height: 75,
                                 margin: EdgeInsets.all(10),
                                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   color:Main_Theme_WhiteCollor.withOpacity(0.2),
                                 ),
                                 child:   Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Dep : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text:  "${widget.getProfile["DEPARTMENT_ENGLISH"]}",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                     Spacer(),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Deg : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             overflow: TextOverflow.ellipsis,
                                             maxLines: 1,
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text:"${widget.getProfile["DESIGNATION_ENGLISH"]}",
                                             letterSpacing: 0.3),
                                       ],
                                     ),
                                     Spacer(),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         ColorCustomText(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                           text: "Age : ",
                                           letterSpacing: 0.3,
                                           textColor:
                                           Main_Theme_textColor.withOpacity(0.5),
                                         ),
                                         CustomText(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             text: "10Y 05M",
                                             letterSpacing: 0.3),
                                       ],
                                     ),

                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                         SizedBox(height: 22,)
                       ],
                     ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Main_Theme_WhiteCollor,
                      ),
                          child:  ShareMessagePdfPart(
                            width: 170,
                            is_share: true, onTap: () {
                          }, is_messsage: true, onTap2message: () {
                          }, is_pdf: true, onTap3pdf: () {
                          },
                        ),
                      ),
                    )
                  ],
                ),
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
                                  animatedheight=index==0?785:index==1?740:index==2?750:400;
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
                                    CustomText(fontSize: font13, fontWeight: FontWeight.w500, text: "${profile_list[index]}", letterSpacing: 0.3),
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
                                          SelfProfileImageNameSubName(
                                          image: "${SelfProfileInformationCardlist[index].image}",
                                          text1: "${SelfProfileInformationCardlist[index].text1}",
                                          text2: "${SelfProfileInformationCardlist[index].text2}",
                                        ) :
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
              ],
            ),
          ),
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

