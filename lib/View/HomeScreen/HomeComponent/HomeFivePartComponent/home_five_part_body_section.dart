import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class HomeFivePartBodyScetion extends StatelessWidget {
  HomeFivePartBodyScetion({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.email,
    required this.phone,
    required this.todayselectionbirthdaylist,
  });
  String name;
  String phone;
  String email;
  String designation;
  String image;
  List todayselectionbirthdaylist;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: apps_div_margin),
      //  height: "${todayselectionbirthdaylist}" == "[]" ? 35 : 140,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Main_Theme_WhiteCollor
          //  color: CustomButtonColor.withOpacity(0.15),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorCustomText(
              text: "${todayselectionbirthdaylist}" == "[]"
                  ? "Today's Birthday Not Found"
                  : "Today's Birthday",
              fontSize: font13header,
              fontWeight: FontWeight.w500,
              textColor: Main_Theme_textColor.withOpacity(0.9),
              letterSpacing: 0.3,
            ),
          ),
          "${todayselectionbirthdaylist}" == "[]"
              ? Container()
              : Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 8),
                  child: ListView.builder(
                    itemCount: todayselectionbirthdaylist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Stack(
                          children: [
                            Container(
                              height: 98,
                              width: 220,
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  gradient: LinearGradient(colors: [
                                    CustomButtonColor.withOpacity(0.3),
                                    CustomButtonColor.withOpacity(0.2),
                                    CustomButtonColor.withOpacity(0.1),
                                  ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        top: -4,
                                        left: -4,
                                        bottom: 7,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          width: 55,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color:
                                                absent_color.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          width: 60,
                                          height: 75,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${todayselectionbirthdaylist}" ==
                                                            "[]"
                                                        ? ""
                                                        : "${GetStorage().read("APPS_IMG_BASEURL")}${todayselectionbirthdaylist[index]["EmployeeImage"]}"),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.only(right: 5, top: 5),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 3,
                                          ),
                                          ColorCustomText(
                                            text: "${todayselectionbirthdaylist}" ==
                                                    "[]"
                                                ? ""
                                                : "${todayselectionbirthdaylist[index]["EmployeeNameEnglish"]}",
                                            fontSize: font13header,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.4,
                                            textColor: Main_Theme_textColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          ColorCustomText(
                                              fontSize: font11,
                                              fontWeight: FontWeight.w400,
                                              text: "${todayselectionbirthdaylist}" ==
                                                      "[]"
                                                  ? ""
                                                  : "${todayselectionbirthdaylist[index]["DesignationEnglish"]}",
                                              letterSpacing: 0.2,
                                              textColor: Main_Theme_textColor
                                                  .withOpacity(0.6)),
                                          ColorCustomText(
                                              fontSize: font11,
                                              fontWeight: FontWeight.w400,
                                              text: "${todayselectionbirthdaylist}" ==
                                                      "[]"
                                                  ? ""
                                                  : "${todayselectionbirthdaylist[index]["MobileNo"]}",
                                              letterSpacing: 0.2,
                                              textColor: Main_Theme_textColor
                                                  .withOpacity(0.6)),
                                          ColorCustomText(
                                              fontSize: font11,
                                              fontWeight: FontWeight.w400,
                                              text: "${todayselectionbirthdaylist}" ==
                                                      "[]"
                                                  ? ""
                                                  : "${todayselectionbirthdaylist[index]["Email"]}",
                                              letterSpacing: 0.2,
                                              textColor: Main_Theme_textColor
                                                  .withOpacity(0.6))
                                        ],
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Image.asset(
                                "Assets/Icons/birthday.png",
                                height: 35,
                                width: 35,
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
