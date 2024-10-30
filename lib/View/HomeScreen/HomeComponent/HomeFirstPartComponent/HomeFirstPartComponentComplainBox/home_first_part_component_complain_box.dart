import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/HomeFirstPartComponent/HomeFirstPartComponentComplainBox/HomeFirstPartComponentComplainBoxDetails/home_first_part_component_complain_box_details.dart';

import '../../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class HomeFirstPartComponentComplainBox extends StatefulWidget {
  const HomeFirstPartComponentComplainBox({super.key});

  @override
  State<HomeFirstPartComponentComplainBox> createState() =>
      _HomeFirstPartComponentComplainBoxState();
}

class _HomeFirstPartComponentComplainBoxState
    extends State<HomeFirstPartComponentComplainBox> {
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
            text: "Complain Box"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Main_Theme_WhiteCollor),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomImageSction2(
                                          height: 19,
                                          width: 19,
                                          radius: 0,
                                          image:
                                              "Assets/DashBoardIcons/suggestion.png",
                                          img_color:
                                              absent_color.withOpacity(0.9)),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ColorCustomText(
                                          textColor:
                                              Main_Theme_textColor.withOpacity(
                                                  0.8),
                                          fontSize: font13header,
                                          fontWeight: FontWeight.w700,
                                          text: "Suggest",
                                          letterSpacing: 0.3),
                                      SizedBox(
                                        width: 7,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  ColorCustomText(
                                    fontSize: font11,
                                    fontWeight: FontWeight.w500,
                                    text: "12-Oct-2024",
                                    letterSpacing: 0.3,
                                    textColor:
                                        Main_Theme_textColor.withOpacity(0.6),
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(left: 6, right: 10),
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(0),
                                ),
                                color: leave_color.withOpacity(0.75),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(right: 7, left: 0),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: CustomImageSction(
                                            height: 50,
                                            width: 50,
                                            radius: 1,
                                            image:
                                                "Assets/DrawerImage/testperson.png")),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ColorCustomText(
                                              fontSize: font12,
                                              fontWeight: FontWeight.w400,
                                              text: "ID: 544532",
                                              letterSpacing: 0.3,
                                              textColor:
                                                  Main_Theme_WhiteCollor),
                                          Text(
                                            "Hafijur Rahman Mizan",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: font12,
                                              color: Main_Theme_WhiteCollor,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.3,
                                            ),
                                          ),
                                          ColorCustomText(
                                            textColor: Main_Theme_WhiteCollor,
                                            fontSize: font11,
                                            fontWeight: FontWeight.w300,
                                            text: "HR Manager",
                                            letterSpacing: 0.3,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ColorCustomText(
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          fontSize: font12,
                          fontWeight: FontWeight.w400,
                          text: "To Manager,\n$Loremtext",
                          letterSpacing: 0.4,
                          textColor: Main_Theme_textColor.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 18,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  HomeFirstPartComponentComplainBoxDetails(),
                            ));
                      },
                      child: Container(
                          padding: EdgeInsets.only(right: 10, bottom: 3),
                          color: Main_Theme_WhiteCollor,
                          child: Row(
                            children: [
                              CustomText(
                                  fontSize: font12,
                                  fontWeight: FontWeight.w400,
                                  text: " ... ",
                                  letterSpacing: 0.2),
                              ColorCustomText(
                                  textColor: presentsent_color.withOpacity(0.7),
                                  fontSize: fontSubTitle,
                                  fontWeight: FontWeight.w600,
                                  text: "Read More",
                                  letterSpacing: 0.2),
                            ],
                          )),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
