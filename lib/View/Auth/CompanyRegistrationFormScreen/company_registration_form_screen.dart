
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/PrivacyPolicy/privacy_policy.dart';

import '../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  CompanyRegistrationScreen({super.key,required this.Package});
  String  Package;
  @override
  State<CompanyRegistrationScreen> createState() =>
      _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  bool obscureText = true;
  bool obscureText2 = true;
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyAddressController = TextEditingController();
  TextEditingController _NumberOfEmployeeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _con_passwordController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            /// Custom Default App BAr
            child: CustomDefaultAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: "${widget.Package} sign up",
            )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 25, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  SizedBox(height: h * 0.04),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          getImageFromGallery();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 110,
                            width: 110,
                            color: CompanyProfileDefaultColor,
                            padding: EdgeInsets.all(20),
                            child:_image==null? SvgPicture.asset(
                              'Assets/svgImage/company_image.svg',
                              height: 67.0,
                              width: 67.0,
                              allowDrawingOutsideViewBox: true,
                            ):   ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(_image!.renameSync(_image!.path),
                                  fit: BoxFit.fill,)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 1, left: 0.0, right: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/Icons/subtract.png"),
                                  fit: BoxFit.fill),
                            ),
                            height: 40,
                            width: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 9,
                        left: 24.5,
                        right: 24.5,
                        child: Container(
                          margin:
                              EdgeInsets.only(bottom: 5, left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "Assets/Icons/regisrration_camer.png"),
                                fit: BoxFit.fill),
                          ),
                          height: 15,
                          width: 10,
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 60,
                  //   width: double.infinity,
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         padding: const EdgeInsets.only(right: 8.0, top: 7),
                  //         child: Image.asset(
                  //           "Assets/Icons/crbuisness.png",
                  //           height: 21,
                  //           width: 21,
                  //           fit: BoxFit.fill,
                  //           color: Main_Theme_textColor.withOpacity(0.6),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //           margin: EdgeInsets.only(top: 10),
                  //           height: 50,
                  //           width: double.infinity,
                  //           padding: EdgeInsets.only(left: 15, right: 15),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(11),
                  //             //   border: Border.all(color:icons_green_color,width: 2),
                  //           ),
                  //           child: IgnorePointer(
                  //             ignoring: false,
                  //             child: DropdownButton(
                  //               enableFeedback: true,
                  //               autofocus: false,
                  //               isExpanded: true,
                  //               hint: InkWell(
                  //                   onTap: () {},
                  //                   child: ColorCustomText(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w500,
                  //                       text: "  Business Type",
                  //                       letterSpacing: 0.2,
                  //                       textColor:
                  //                       Main_Theme_textColor.withOpacity(0.4))),
                  //               // Not necessary for Option 1
                  //               value: busnessid,
                  //               onChanged: (newValue) {
                  //                 setState(() {
                  //                   busnessid = newValue.toString();
                  //                   if(busnessid!.contains("SME(0-100 Employee)")){
                  //                     busnessidlist2=["A","B","c"];
                  //                   }
                  //                  else if(busnessid!.contains("Corporate(100-500 Employee)")){
                  //                     busnessidlist2=["1","2","3"];
                  //                   }
                  //                  else{
                  //                     busnessidlist2=["x","y","z"];
                  //                   }
                  //                 });
                  //               },
                  //               items: busnessidlist.map((location) {
                  //                 return DropdownMenuItem(
                  //                   child: Text("${location ?? ""}"),
                  //                   value: "${location}",
                  //                 );
                  //               }).toList(),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8.0, top: 7),
                          child: Image.asset(
                            "Assets/Icons/crbuisness.png",
                            height: 21,
                            width: 21,
                            fit: BoxFit.fill,
                            color: Main_Theme_textColor.withOpacity(0.6),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              //   border: Border.all(color:icons_green_color,width: 2),
                            ),
                            child: IgnorePointer(
                              ignoring: false,
                              child: DropdownButton(
                                enableFeedback: true,
                                autofocus: false,
                                isExpanded: true,
                                hint: InkWell(
                                    onTap: () {},
                                    child: ColorCustomText(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        text: "  Company type",
                                        letterSpacing: 0.2,
                                        textColor:
                                        Main_Theme_textColor.withOpacity(0.4))),
                                // Not necessary for Option 1
                                value: busnessid2,
                                onChanged: (newValue) {
                                  setState(() {
                                    busnessid2 = newValue.toString();
                                  });
                                },
                                items: busnessidlist2.map((location) {
                                  return DropdownMenuItem(
                                    child: Text("${location ?? ""}"),
                                    value: "${location}",
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  JibikaCustomTextFromField(
                      controller: _companyNameController,
                      height: 50,
                      img: "Assets/Icons/crppol.png",
                      hinttext: "Company Name",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: h * 0.02),
                  JibikaCustomTextFromField(
                      controller: _companyAddressController,
                      height: 50,
                      img: "Assets/DashBoardIcons/location.png",
                      hinttext: "Company Address",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: h * 0.02),
                  JibikaCustomTextFromField(
                      controller: _NumberOfEmployeeController,
                      height: 50,
                      img: "Assets/Icons/crppol.png",
                      hinttext: "Number of Employee",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: h * 0.01),
                  JibikaCustomTextFromField2(
                      controller: _phoneController,
                      height: 50,
                      img: "Assets/Icons/call.png",
                      hinttext: "Phone",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: h * 0.02),
                  JibikaCustomTextFromField(
                      controller: _companyEmailController,
                      height: 50,
                      img: "Assets/Icons/cr_email.png",
                      hinttext: "Email",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: h * 0.02),
                  JibikaCustomTextFromField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Main_Theme_textColor.withOpacity(0.5),
                          )),
                      controller: _passwordController,
                      height: 50,
                      img: "Assets/Icons/cr_lock.png",
                      hinttext: "New Password",
                      keyboardType: TextInputType.text,
                      obscureText: obscureText),
                  SizedBox(height: h * 0.02),
                  JibikaCustomTextFromField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Main_Theme_textColor.withOpacity(0.5),
                          )),
                      controller: _con_passwordController,
                      height: 50,
                      img: "Assets/Icons/cr_lock.png",
                      hinttext: "Confirm Password",
                      keyboardType: TextInputType.text,
                      obscureText: obscureText),
                  SizedBox(height: h * 0.03),
                  CustomButton(
                    onTap: () {
      
                      if(_fromKey.currentState!.validate()){
                        if(busnessid2==null){
                          ElegantNotification(
                            borderRadius: BorderRadius.circular(11),
                            width: 340,
                            iconSize: 25,
                            background: presentsent_color,
                            progressIndicatorBackground: presentsent_color,
                            progressIndicatorColor: absent_color,
                            // position: Alignment.center,
                            title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Could not select company", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                            description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please select & try again", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                            onDismiss: () {
                              print('Message when the notification is dismissed');
                            }, icon: Icon(Icons.info_outlined,color:Colors.black,),
                          ).show(context);
                        }else{
                          if(_passwordController.text==_con_passwordController.text) {

                            if(_passwordController.text.length>=6){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PrivacyPolicyScreen(
                                          Package: "${widget.Package}",
                                          companytype: busnessid2,
                                          companyname: _companyNameController.text
                                              .toString(),
                                          companyAddress: _companyAddressController
                                              .text.toString(),
                                          noOfEmployee: _NumberOfEmployeeController
                                              .text.toString(),
                                          mobileNumber: _phoneController.text
                                              .toString(),
                                          companyEmail: _companyEmailController
                                              .text.toString(),
                                          password: _passwordController.text
                                              .toString(),
                                          previous_route_name: "CompanyRegistration",
                                        ),
                                  ));
                            }else{
                              ElegantNotification(
                                borderRadius: BorderRadius.circular(11),
                                width: 340,
                                iconSize: 25,
                                background: presentsent_color,
                                progressIndicatorBackground: presentsent_color,
                                progressIndicatorColor: absent_color,
                                // position: Alignment.center,
                                title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Minimum password length 6 digit", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please try again", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                onDismiss: () {
                                  print('Message when the notification is dismissed');
                                }, icon: Icon(Icons.info_outlined,color:Colors.black,),
                              ).show(context);
                            }
                          }else{
                            ElegantNotification(
                              borderRadius: BorderRadius.circular(11),
                              width: 340,
                              iconSize: 25,
                              background: presentsent_color,
                              progressIndicatorBackground: presentsent_color,
                              progressIndicatorColor: absent_color,
                              // position: Alignment.center,
                              title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Password does not match", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                              description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please try again", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                              onDismiss: () {
                                print('Message when the notification is dismissed');
                              }, icon: Icon(Icons.info_outlined,color:Colors.black,),
                            ).show(context);
                          }
                        }

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ColorCustomText(fontSize: 16, textColor: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, text: "Please fill all the field", letterSpacing: 0.3)));
                      }
                    },
                    text: "Next",
                    button_text_fontSize: 18,
                    button_height: 50,
                    custom_button_collor: CustomButtonColor,
                    button_text_color: Main_Theme_WhiteCollor,
                    borderRadius: 50,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: h * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//  String? busnessid;
  String? busnessid2;
  // List busnessidlist = ["SME(0-100 Employee)", "Corporate(100-500 Employee)", "Industry(501 - 5000 Employee)","Others(Contact Us)"];
  List busnessidlist2 = ["SME", "Corporate", "Industry","Others"];

  companyRegistration()async{

  }
}
