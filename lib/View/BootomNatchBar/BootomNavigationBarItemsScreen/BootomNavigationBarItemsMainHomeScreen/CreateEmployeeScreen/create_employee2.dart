
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomCheckBox/custom_check_box.dart';
import 'package:jibika_plexus/CustomWidget/CustomCircleDay/custom_circleday.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomImageButton/custom_imagebutton.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../../../Utils/constants.dart';

class CreateNewEmployeeScreen2 extends StatefulWidget {
  const CreateNewEmployeeScreen2({super.key});

  @override
  State<CreateNewEmployeeScreen2> createState() => _CreateNewEmployeeScreen2State();
}

class _CreateNewEmployeeScreen2State extends State<CreateNewEmployeeScreen2> {
  TextEditingController _companyAddressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _fromKey=GlobalKey<FormState>();
  File ? _image;

  final picker = ImagePicker();
  ///NID font
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double C_height=8;
    double Cwidth=10;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Primary Information")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            height: 30,
            width: double.infinity,
            child: ListView.builder(
              itemCount: nameList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                splashColor:home_default_color,
                onTap: () {
                  setState(() {
                    _selectedIndex =index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.06),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:index==_selectedIndex? presentsent_color:home_default_color
                  ),
                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400,
                      text: "${nameList[index]}", letterSpacing: 0.2),
                ),
              ),),

          ),

          _selectedIndex==0?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10
              ),
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
            
            
                    SizedBox(height: C_height,),
                    Container(
                      height: 102,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80,
                                width:80,
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(7),
                                    border: Border.all(
                                        color: Main_Theme_textColor.withOpacity(0.4),
                                        width: 1.2
                                    )
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(56),
                                      child: Container(
                                        height: 56,
                                        width: 56,
                                        color:  Main_Theme_textColor.withOpacity(0.07),
                                        padding: EdgeInsets.all(10),
                                        child: CustomImageSction(height: 20, width: 15, radius: 1, image: "Assets/DashBoardIcons/person1.png"),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -1.5,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 1, left: 1.0, right:1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("Assets/Icons/subtract.png"),
                                                fit: BoxFit.fill),
                                          ),
                                          height: 20,
                                          width: 50,
                                        ),
                                      ),
                                    ),
            
            
            
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Upload / Take photo", letterSpacing: 0.3),
            
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width:126,
                                    decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(7),
                                        border: Border.all(
                                            color: absent_color.withOpacity(0.3),
                                            width: 1.2
                                        )
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      padding: EdgeInsets.only(top: 7),
                                      color:  Main_Theme_WhiteCollor,
                                      child: CustomImageSction2(height: 27, width: 47, radius: 1, image: "Assets/DashBoardIcons/empoloyee_card.png",img_color: Main_Theme_textColor.withOpacity(0.7),),
                                    ),
                                  ),
                                  Positioned(
                                      top: 80/2-2 ,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow:[
                                            BoxShadow(
                                              color: absent_color.withOpacity(0.8),
                                              spreadRadius: 1,
                                              blurRadius: 9,
                                              offset: Offset(0, 2), // changes position of shadow
                                            ),
                                          ],
                                          color: absent_color.withOpacity(0.7),
                                        ),
                                        height: 1,
                                        width: 126,
            
                                      )),
            
                                  Positioned(
                                      top: 80/2+2,
                                      child: Container(
                                        height: 1,
                                        width: 126,
                                        color: absent_color.withOpacity(0.7),
                                      )),
                                  Positioned(
                                      top: 80/2+2,
                                      child: Container(
                                        height: 36.5,
                                        width: 126,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(7),
                                              bottomRight: Radius.circular(7)
                                          ) ,
                                          color: absent_color.withOpacity(0.07),
                                        ),
            
                                      ))
                                ],
                              ),
                              SizedBox(height: 5,),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Scan NID Card", letterSpacing: 0.3),
            
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: C_height,),   /// Registration part ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                    child: Column(
                      children: [
                        JibikaCustomTextFromField(
                            controller: _companyAddressController,
                            height: 50,
                            img: "Assets/DashBoardIcons/personalcard.png",
                            hinttext: "Employee id",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            controller: _companyAddressController,
                            height: 50,
                            img: "Assets/PrimaryInformation/people (1).png",
                            hinttext: "Employee NID",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            controller: _companyAddressController,
                            height: 50,
                            img: "Assets/PrimaryInformation/people (2).png",
                            hinttext: "Employee name",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            controller: _companyAddressController,
                            height: 50,
                            img: "Assets/PrimaryInformation/calendar.png",
                            hinttext: "Date of barth",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            controller: _companyAddressController,
                            height: 50,
                            img: "Assets/PrimaryInformation/father.png",
                            hinttext: "Father name",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/phone.png",
                            hinttext: "Mobile number",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/DashBoardIcons/messagetext.png",
                            hinttext: "Gmail",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/DashBoardIcons/location.png",
                            hinttext: "Present address",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/DashBoardIcons/location.png",
                            hinttext: "Permanent address",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/work-shift 1.png",
                            hinttext: "Shift plane",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/money_payment.png",
                            hinttext: "Marital status",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/calendar.png",
                            hinttext: "Joining date",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/religion 1.png",
                            hinttext: "Religion",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField2(
                            controller: _phoneController,
                            height: 50,
                            img: "Assets/PrimaryInformation/education-182 1.png",
                            hinttext: "Education",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                      ],
                    ),
                    ),
                    SizedBox(height: C_height+18,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Gender", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
                    SizedBox(height: C_height,),
                    Container(
                        height: 35,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCircleDay(day: "M", onTap: () {
                              setState((){
                                m=true;
                                f=false;
                                o=false;
                              });
                            }, backgroundColor:m==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:m==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                            CustomCircleDay(day: "F", onTap: () {
                              setState((){
                                m=false;
                                f=true;
                                o=false;
                              });
                            }, backgroundColor:f==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:f==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                            CustomCircleDay(day: "O", onTap: () {
                              setState((){
                                m=false;
                                f=false;
                                o=true;
                              });
                            }, backgroundColor:o==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:o==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),

                          ],
                        )
                    ),
                    SizedBox(height: C_height+10,),
                    Container(height: 139,width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Signature", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                Container(
                                  height: 80,
                                  width: 146,
                                  margin: EdgeInsets.only(top: 5,bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: presentsent_color.withOpacity(0.4)),
                                   // color: Colors.blue,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("Assets/PrimaryInformation/email.png",height: 31,width: 45,fit: BoxFit.fill,),
                                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Browse file", letterSpacing: 0.1, textColor: presentsent_color),
                                    ],
                                  ),
                                ),
                                ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Accepted File Types: .jpeg and .png", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

                              ],
                            ),
                           ),
                          ),

                          Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "QR code", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                    Container(
                                      height: 80,
                                      width: 146,
                                      margin: EdgeInsets.only(top: 5,bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: presentsent_color.withOpacity(0.4)),
                                        // color: Colors.blue,
                                      ),
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset("Assets/PrimaryInformation/qrcode.png",height: 47,width: 48,fit: BoxFit.fill,),
                                      //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Browse file", letterSpacing: 0.1, textColor: presentsent_color),
                                        ],
                                      ), ),
                                    ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: " ", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),
            
                  ],
                ),
              ),
            ),
          )
              :
          _selectedIndex==1?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (2).png",
                              hinttext: "Department",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (1).png",
                              hinttext: "Designation",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Section",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/father.png",
                              hinttext: "Staff Category",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/gender.png",
                              hinttext: "Work Station",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Joining Date",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Inactive Date",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/DashBoardIcons/messagetext.png",
                              hinttext: "Roster Type",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/work-shift 1.png",
                              hinttext: "Shift Plan",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/work-shift 1.png",
                              hinttext: "Shift plane",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/work-shift 2.png",
                              hinttext: "Employee status",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height+10,),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Weekend", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
                          SizedBox(height: C_height,),
                          Container(
                              height: 35,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCircleDay(day: "Sa", onTap: () {
                                    setState(() =>sat=!sat);
                                  }, backgroundColor:sat==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sat==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                                  CustomCircleDay(day: "Su", onTap: () {
                                    setState(() =>sun=!sun);
                                  }, backgroundColor:sun==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sun==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                                  CustomCircleDay(day: "Mo", onTap: () {
                                    setState(() =>mon=!mon);
                                  }, backgroundColor:mon==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:mon==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                                  CustomCircleDay(day: "Tu", onTap: () {
                                    setState(() =>Tue=!Tue);
                                  }, backgroundColor:Tue==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Tue==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                                  CustomCircleDay(day: "We", onTap: () {
                                    setState(() =>Wed=!Wed);
                                  }, backgroundColor:Wed==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Wed==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                                  CustomCircleDay(day: "Th", onTap: () {
                                    setState(() =>Thu=!Thu);
                                  }, backgroundColor:Thu==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Thu==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),


                                  CustomCircleDay(day: "Fr", onTap: () {
                                    setState(() =>fri=!fri);
                                  }, backgroundColor:fri==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:fri==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),



                                ],
                              )
                          ),
                          SizedBox(height: C_height+5,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )
          :
          _selectedIndex==2?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/money_payment.png",
                              hinttext: "Gross Salary",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/money_payment.png",
                              hinttext: "Basic Salary",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/home-svgrepo-com 1.png",
                              hinttext: "House rent",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people.png",
                              hinttext: "Medical Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/gender-7 1.png",
                              hinttext: "Food Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),


                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/convienceallowence.png",
                              hinttext: "Convince Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/other_allowence.png",
                              hinttext: "Other Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),


                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/other_deduction.png",
                              hinttext: "Other Deduction",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/clock.png",
                              hinttext: "Over Time Rate",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/bank.png",
                              hinttext: "Bank & Branch Name",
                              keyboardType: TextInputType.text,
                              obscureText: false),

                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Account number",
                              keyboardType: TextInputType.text,
                              obscureText: false),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )
              :
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            height: 102,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width:80,
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(7),
                                          border: Border.all(
                                              color: Main_Theme_textColor.withOpacity(0.4),
                                              width: 1.2
                                          )
                                      ),
                                      alignment: Alignment.center,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(56),
                                            child: Container(
                                              height: 56,
                                              width: 56,
                                              color:  Main_Theme_textColor.withOpacity(0.07),
                                              padding: EdgeInsets.all(10),
                                              child: CustomImageSction(height: 20, width: 15, radius: 1, image: "Assets/DashBoardIcons/person1.png"),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -1.5,
                                            left: 0,
                                            right: 0,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(bottom: 1, left: 1.0, right:1.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("Assets/Icons/subtract.png"),
                                                      fit: BoxFit.fill),
                                                ),
                                                height: 20,
                                                width: 50,
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Upload / Take photo", letterSpacing: 0.3),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (2).png",
                              hinttext: "Referrer Name",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (1).png",
                              hinttext: "Referrer Address",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/phone.png",
                              hinttext: "Mobile number",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                              controller: _companyAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/sms.png",
                              hinttext: "Referrer E-mail",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _phoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/relation.png",
                              hinttext: "Relation with Referrer",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height+5,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
List nameList=[
  "Persnal",
  "Official",
  "Salary",
  "Referrer",
];
  /// for gender
  bool m=false;
  bool f=false;
  bool o=false;
  /////////////////////////
  bool sat=false;
  bool sun=false;
  bool mon=false;
  bool Tue=false;
  bool Wed=false;
  bool Thu=false;
  bool fri=false;


}
