import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/Controller/HomeController/home_controller.dart';
import 'package:jibika_plexus/Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'package:provider/provider.dart';

import '../CustomWidget/CustomText/custom_text.dart';
import '../Utils/constants.dart';

class SelfProfileSummaryPart extends StatelessWidget {
  const SelfProfileSummaryPart({super.key});

  @override
  Widget build(BuildContext context) {
    final selfORAdminShortInformationdata =
        Provider.of<HomeProvider>(context).selfORAdminShortInformationdata;
    print(
        "ddddddddddddddddddddddddddddd -------------------- ${selfORAdminShortInformationdata}");
    return Container(
      // height: 110,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      color: Main_Theme_WhiteCollor,
      child: Row(
        children: [
          Container(
            //   height: 110,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border:
                    Border.all(color: Main_Theme_textColor.withOpacity(0.1))),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${GetStorage().read("APPS_IMG_BASEURL")}${selfORAdminShortInformationdata["EmpImage"] ?? ""}"),
                        fit: BoxFit.fill),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorCustomText(
                      fontSize: font12,
                      fontWeight: FontWeight.w400,
                      text: "",
                      letterSpacing: 0.3,
                      textColor: Main_Theme_textColor.withOpacity(0.5),
                    ),
                    CustomText(
                        fontSize: font10,
                        fontWeight: FontWeight.w400,
                        text:
                            "${selfORAdminShortInformationdata["IdCardNo"] ?? ""}",
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            //  height: 170,
            //  width: MediaQuery.of(context).size.width * 0.3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: fontSubTitle,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    text:
                        "${selfORAdminShortInformationdata["EmployeeNameEnglish"] ?? ""}",
                    letterSpacing: 0.3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CustomText(
                      fontSize: font12,
                      fontWeight: FontWeight.w400,
                      text:
                          "${selfORAdminShortInformationdata["Department"] ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: 0.3),
                  SizedBox(
                    height: 3,
                  ),
                  CustomText(
                      fontSize: font12,
                      fontWeight: FontWeight.w400,
                      text:
                          "${selfORAdminShortInformationdata["Designation"] ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: 0.3),
                  SizedBox(
                    height: 3,
                  ),
                  CustomText(
                      fontSize: font12,
                      fontWeight: FontWeight.w400,
                      text:
                          "${selfORAdminShortInformationdata["JoiningDate"] ?? ""}",
                      letterSpacing: 0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdminProfileSummaryPart extends StatelessWidget {
  AdminProfileSummaryPart({
    super.key,
    required this.network_image,
    required this.IdCardNo,
    required this.EmployeeNameEnglish,
    required this.Department,
    required this.Designation,
    required this.JoiningDate,
  });
  String network_image;
  String IdCardNo;
  String EmployeeNameEnglish;
  String Department;
  String Designation;
  String JoiningDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      color: Main_Theme_WhiteCollor,
      child: Row(
        children: [
          Container(
            height: 110,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border:
                    Border.all(color: Main_Theme_textColor.withOpacity(0.1))),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${GetStorage().read("APPS_IMG_BASEURL")}$network_image"),
                        fit: BoxFit.fill),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorCustomText(
                      fontSize: font12,
                      fontWeight: FontWeight.w400,
                      text: "",
                      letterSpacing: 0.3,
                      textColor: Main_Theme_textColor.withOpacity(0.5),
                    ),
                    CustomText(
                        fontSize: font10,
                        fontWeight: FontWeight.w400,
                        text: "${IdCardNo}",
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 170,
              width: MediaQuery.of(context).size.width * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      fontSize: fontSubTitle,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      text: "${EmployeeNameEnglish}",
                      letterSpacing: 0.3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    CustomText(
                        fontSize: font12,
                        fontWeight: FontWeight.w400,
                        text: "${Department}",
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.3),
                    SizedBox(
                      height: 3,
                    ),
                    CustomText(
                        fontSize: font12,
                        fontWeight: FontWeight.w400,
                        text: "${Designation}",
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 0.3),
                    SizedBox(
                      height: 3,
                    ),
                    CustomText(
                        fontSize: font12,
                        fontWeight: FontWeight.w400,
                        text: "${JoiningDate}",
                        letterSpacing: 0.3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
