import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../../CustomSelfWedget/CustomMySelfJobCard/CustomMySelfJobCard3rdPart/custom_myself_jobcard3rdpart.dart';

class SelfLoanScreen extends StatefulWidget {
  const SelfLoanScreen({super.key});

  @override
  State<SelfLoanScreen> createState() => _SelfLoanScreenState();
}

class _SelfLoanScreenState extends State<SelfLoanScreen> {
  double animatedheight = 0;
  int selectedmonth = 0;
  String? selectedValue;
  int key = 0;

  int selectedindex = -1;
  String? getindex;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomDefaultAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Loan")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 321,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Main_Theme_WhiteCollor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.033),
                      child: CustomImageSction(
                          height: 170,
                          width: 205,
                          radius: 5,
                          image: "Assets/SelfIcon/loan.png"),
                    ),
                    SizedBox(
                      height: h * 0.020,
                    ),
                    CustomText(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        text: "You haven't applied for any loan",
                        letterSpacing: 0.4),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: CustomButtonColor.withOpacity(0.2)),
                          child: ColorCustomText(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              text: "Apply for loan",
                              letterSpacing: 0.3,
                              textColor: CustomButtonColor)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Main_Theme_WhiteCollor,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                          animatedheight = 0;
                          Future.delayed(
                            Duration(milliseconds: 100),
                            () {
                              setState(() {
                                if (getindex == "$index") {
                                  animatedheight = 0;
                                  getindex = '';
                                } else {
                                  animatedheight = 210;
                                  getindex = "$index";
                                }
                              });
                            },
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            //  color: Color(0xffF3FCFB)
                            //  color:  CustomButtonColor.withOpacity(0.05),
                            border: Border(
                                bottom: BorderSide(color: CustomButtonColor))),
                        margin: EdgeInsets.only(bottom: 7),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 6, right: 10),
                              height: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7),
                                  bottomLeft: Radius.circular(
                                      selectedindex == index ? 0 : 7),
                                  bottomRight: Radius.circular(
                                      selectedindex == index ? 0 : 7),
                                ),
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      text: "General Loan",
                                      letterSpacing: 0.3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          text: "General Loan",
                                          letterSpacing: 0.3),

                                      Spacer(),

                                      ///----------------- Third Part ------------------------------///
                                      Container(
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 25)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            selectedindex == index
                                ? AnimatedContainer(
                                    height: animatedheight,
                                    width: double.infinity,
                                    duration: Duration(milliseconds: 400),
                                    child: Container(
                                      child: SingleChildScrollView(
                                        physics: NeverScrollableScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(
                                              height: 0.5,
                                            ),
                                            CustomMySelfJobCard3rdPart(
                                                late: "10:00",
                                                Duration: "8:10:10",
                                                OT: "02.00.00",
                                                Shift_Plane: "General"),
                                            Divider(
                                              height: 0.5,
                                            ),
                                            Container(
                                              height: 20,
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  CustomImageSction2(
                                                      height: 16,
                                                      width: 14,
                                                      radius: 5,
                                                      image:
                                                          "Assets/DrawerImage/chat.png",
                                                      img_color:
                                                          Main_Theme_textColor
                                                              .withOpacity(
                                                                  0.6)),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  CustomText(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      text: "Comments",
                                                      letterSpacing: 0.3),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                    color: Main_Theme_textColor
                                                        .withOpacity(0.5)),
                                              ),
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              padding: EdgeInsets.all(10),
                                              child: ColorCustomText(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 2,
                                                text: "$Loremtext",
                                                letterSpacing: 0.3,
                                                textAlign: TextAlign.justify,
                                                textColor: Main_Theme_textColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, top: 5),
                                              child: ColorCustomText(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                  text: "Movement punch",
                                                  letterSpacing: 0.3,
                                                  textAlign: TextAlign.left,
                                                  textColor:
                                                      Main_Theme_textColor
                                                          .withOpacity(0.7)),
                                            ),
                                            Container(
                                              height: 100,
                                              margin: EdgeInsets.only(
                                                  top: 7, left: 10, right: 10),
                                              width: double.infinity,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 5,
                                                        crossAxisSpacing: 5,
                                                        mainAxisExtent: 15),
                                                itemCount: 4,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return ColorCustomText(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      text:
                                                          "10-sep-2024 : 10:20:44 (A-101)",
                                                      letterSpacing: 0.3,
                                                      textColor:
                                                          Main_Theme_textColor
                                                              .withOpacity(
                                                                  0.5));
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
