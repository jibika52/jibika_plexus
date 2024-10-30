import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';

class ChoosePackageScreen extends StatefulWidget {
  const ChoosePackageScreen({super.key});

  @override
  State<ChoosePackageScreen> createState() => _ChoosePackageScreenState();
}

class _ChoosePackageScreenState extends State<ChoosePackageScreen> {
  double image_height = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomDefaultAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Choose Your Package")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyRegistrationScreen(
                      Package: "SME",
                    ),
                  )),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Main_Theme_WhiteCollor,
                    border: Border.all(
                        color: CustomButtonColor.withOpacity(0.7), width: 1.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //    Container(width: 50,height: 10,),
                          ColorCustomText(
                              fontSize: fontTitle,
                              fontWeight: FontWeight.w600,
                              text: "Web & Mobile Application",
                              letterSpacing: 0.3,
                              textColor: absent_color),
                          Spacer(),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.info_outline))
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 45,
                            //color: Colors.red,
                            child: CustomImageSction(
                                height: image_height,
                                width: image_height,
                                radius: 10,
                                image: "Assets/buttonIcon/corporate.png"),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            // color: Colors.green,
                            child: ColorCustomText(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                text: "TK. 50/month",
                                letterSpacing: 0.4,
                                textColor: CustomButtonColor),
                          )),
                          Container(
                            height: 55,
                            width: 55,
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8,
                      ),
                      child: ColorCustomText(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          text: "Per Employee",
                          letterSpacing: 0.3,
                          textColor: Main_Theme_textColor_tir_Condition),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyRegistrationScreen(
                      Package: "Customizable",
                    ),
                  )),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Main_Theme_WhiteCollor,
                    border: Border.all(
                        color: CustomButtonColor.withOpacity(0.7), width: 1.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ColorCustomText(
                              fontSize: fontTitle,
                              fontWeight: FontWeight.w600,
                              text: "Web & Mobile Application",
                              letterSpacing: 0.3,
                              textColor: absent_color),
                          Spacer(),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.info_outline))
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 45,
                            //color: Colors.red,
                            child: CustomImageSction(
                                height: image_height,
                                width: image_height,
                                radius: 10,
                                image: "Assets/buttonIcon/indistrypackage.png"),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            // color: Colors.green,
                            child: ColorCustomText(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                text: "Customizable",
                                letterSpacing: 0.4,
                                textColor: CustomButtonColor),
                          )),
                          Container(
                            height: 55,
                            width: 55,
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8,
                      ),
                      child: ColorCustomText(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          text: "Contact us to get offer",
                          letterSpacing: 0.3,
                          textColor: Main_Theme_textColor_tir_Condition),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: CustomBootomSplashBar(),
    );
  }

  List head_text = [
    "Small Industry",
    "Medium Industry",
    "Large Industry",
    "Small Corporate Industry",
    "Large Corporate Industry",
    "Industry",
  ];
}
