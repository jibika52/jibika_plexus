import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/CustomWidget/CustomTrackNowButton/custom_tracknow_button.dart';

import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeTrackinScreen extends StatefulWidget {
  const EmployeeTrackinScreen({super.key});

  @override
  State<EmployeeTrackinScreen> createState() => _EmployeeTrackinScreenState();
}

class _EmployeeTrackinScreenState extends State<EmployeeTrackinScreen> {
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Uzzal Biswas")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part -----------------------------
            CustomEmployeeProfile(image: "Assets/DrawerImage/testperson.png", id: "89899898", name: "Abdur Rahaman", designation: "Software Engineer",
                time: "30Y 6M", onTap1: () {

                }, onTap2: () {

                },),
            /// Second part -----------------------------
            Container(
              margin: EdgeInsets.only(top: 10,left: 10,right: 10),
              padding: EdgeInsets.symmetric(
               horizontal: 10,
                vertical: 10
              ),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Main_Theme_WhiteCollor
              ),
              child: Row(
                children: [
                  ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Check In - 08:45:01", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                  Spacer(),
                  CustomTrackNowButton(b_text: "Track History",  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeTrackinScreen(),));
                    }, ),
                ],
              ),
            ),


            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                width: 400,
                color: Main_Theme_WhiteCollor,
                child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all( Radius.circular(7)),
                              color:  CustomButtonColor.withOpacity(0.05),
                          ),
                          child: Row(
                            children: [
                              /// for see convince
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    left: 10
                                  ),

                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Main_Theme_WhiteCollor
                                  ),
                                  child: Row(
                                                                  children: [
                                                                   Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "09-11-00",
                                         letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                      Text( "Gulshan Circle 01, Road No. 11, Plot No 8",style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.2,
                                        color: Main_Theme_textColor
                                      ),
                                        ),
                                   ],
                                                                   ),
                                                              ],
                                                                ),
                                ),
                              ),
                               

                            ],)
                        );
                      },)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
