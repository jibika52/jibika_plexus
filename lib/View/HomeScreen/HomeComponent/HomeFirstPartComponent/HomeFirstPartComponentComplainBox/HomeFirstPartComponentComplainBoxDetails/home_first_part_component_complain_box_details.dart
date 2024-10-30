import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../../Utils/constants.dart';

class HomeFirstPartComponentComplainBoxDetails extends StatefulWidget {
  const HomeFirstPartComponentComplainBoxDetails({super.key});

  @override
  State<HomeFirstPartComponentComplainBoxDetails> createState() =>
      _HomeFirstPartComponentComplainBoxDetailsState();
}

class _HomeFirstPartComponentComplainBoxDetailsState
    extends State<HomeFirstPartComponentComplainBoxDetails> {
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
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Main_Theme_WhiteCollor),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CustomText(
                      textAlign: TextAlign.center,
                      fontSize: fontTitle + 1,
                      fontWeight: FontWeight.w600,
                      text: "Please Add Address Field on Website",
                      letterSpacing: 0.3)),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: ColorCustomText(
                      textColor: Main_Theme_textColor.withOpacity(0.7),
                      fontSize: fontSubTitle - 1,
                      fontWeight: FontWeight.w600,
                      text: "Date : 10-Jun-2024",
                      letterSpacing: 0.3)),
              Divider(
                height: 35,
              ),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "To Manager ",
                  letterSpacing: 0.2),
              SizedBox(
                height: 5,
              ),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "Sir,",
                  letterSpacing: 0.2),
              SizedBox(
                height: 15,
              ),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.7),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "${Application}",
                  letterSpacing: 0.2),
              SizedBox(
                height: 15,
              ),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "Thank you in advance.",
                  letterSpacing: 0.2),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "Yours faithfully,",
                  letterSpacing: 0.2),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "Mr. Abc",
                  letterSpacing: 0.2),
              SizedBox(
                height: 5,
              ),
              ColorCustomText(
                  textColor: Main_Theme_textColor.withOpacity(0.8),
                  overflow: TextOverflow.fade,
                  fontSize: font13header,
                  fontWeight: FontWeight.w500,
                  text: "Attachment",
                  letterSpacing: 0.2),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                          "Assets/LoginScreenIMG/complainboxforcomplain.png"),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Main_Theme_textColor,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Main_Theme_textColor.withOpacity(0.7),
                        width: 1.5),
                    color: Main_Theme_textColor.withOpacity(0.2)),
                child: CustomText(
                    fontSize: font13header,
                    fontWeight: FontWeight.w400,
                    text:
                        "Thank you so much for your information. As soon as possible we solved the problem.",
                    letterSpacing: 0.2),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 6, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(0),
                      ),
                      color: presentsent_color,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 7, left: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CustomImageSction(
                                  height: 50,
                                  width: 50,
                                  radius: 1,
                                  image: "Assets/DrawerImage/testperson.png")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColorCustomText(
                                fontSize: font12,
                                fontWeight: FontWeight.w400,
                                text: "ID: 544532",
                                letterSpacing: 0.3,
                                textColor: Main_Theme_WhiteCollor),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    width: 230,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                            color: Main_Theme_textColor.withOpacity(0.2))),
                    child: Row(
                      children: [
                        Spacer(),
                        CustomImageSction2(
                          height: 24,
                          width: 30,
                          radius: 1,
                          image: "Assets/Icons/share2.png",
                          img_color: Main_Theme_textColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            fontSize: font15,
                            fontWeight: FontWeight.w500,
                            text: "Share",
                            letterSpacing: 0.3),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 1.5,
                          color: Main_Theme_textColor.withOpacity(0.2),
                        ),
                        Spacer(),
                        CustomImageSction2(
                            height: 19,
                            width: 19,
                            radius: 1,
                            image: "Assets/SelfIcon/delete.png",
                            img_color: Main_Theme_textColor),
                        SizedBox(
                          width: 7,
                        ),
                        CustomText(
                            fontSize: font15,
                            fontWeight: FontWeight.w500,
                            text: "Delete",
                            letterSpacing: 0.3),
                        Spacer(),
                      ],
                    )),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
