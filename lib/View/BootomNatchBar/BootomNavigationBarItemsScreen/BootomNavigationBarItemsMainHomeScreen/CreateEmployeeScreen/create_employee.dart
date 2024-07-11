
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/jibika2customformfield.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../../../../Utils/constants.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  const CreateNewEmployeeScreen({super.key});

  @override
  State<CreateNewEmployeeScreen> createState() => _CreateNewEmployeeScreenState();
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {
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
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Primary Information")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20
        ),
        child: Column(
          children: [
              Container(
                height: 102,
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
              SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),
            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

            SizedBox(height: 34,),
            JibikaCustomTextFromField(image: "Assets/DashBoardIcons/personalcard.png", controller: _companyNameController, hintText: "Enter name", height: 25, width: 25),

          ],
        ),
      ),
    );
  }
}
