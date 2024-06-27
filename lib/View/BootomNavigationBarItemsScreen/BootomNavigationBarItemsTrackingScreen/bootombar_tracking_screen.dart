import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';

class BootomNavigationBarItemsTrackingScreen extends StatefulWidget {
  const BootomNavigationBarItemsTrackingScreen({super.key});

  @override
  State<BootomNavigationBarItemsTrackingScreen> createState() => _BootomNavigationBarItemsTrackingScreenState();
}

class _BootomNavigationBarItemsTrackingScreenState extends State<BootomNavigationBarItemsTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Employee Tracker")
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// Tracking First Part-------------------------------
            Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 10,right: 10,left: 10,bottom: 6
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                        height: 48,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color:Color.fromRGBO(245, 245, 245, 1),
                            border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10,right: 10
                              ),
                              height: 16,width: 16 ,
                              child: CustomImageSction(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10
                              ),
                              height: 12,
                              width: 2,
                              color: Main_Theme_textColor.withOpacity(0.1),
                            ),
                            Expanded(
                              child: Container(
                                  child: TextFormField(
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: 10),
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Main_Theme_textColor.withOpacity(0.30)
                                        ),
                                        hintText: "Search Here"
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      )),

                  Container(
                    height: 53,
                    width: 40,
                    margin: EdgeInsets.only(
                        left: 10,right: 10
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7.95
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:Color.fromRGBO(245, 245, 245, 1),
                        border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                    ),
                    child: CustomImageSction(height: 17, width: 15, radius: 1, image: "Assets/DrawerImage/search_filter.png"),
                  ),



                  Container(
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0,left: 10),
                          child: ColorCustomText(
                            text: "${selected2Datee}",
                            textColor: Main_Theme_textColor.withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w400, letterSpacing: 0.2,),
                        ),
                        SizedBox(width: 5,),
                        /// ---------- Custom Calender Part --------- ///
                        InkWell(
                          onTap: () {
                            _select2Date(context);
                          },
                          child: Container(
                            height: 53,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color:Color.fromRGBO(245, 245, 245, 1),
                                border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                            ),
                            child: CustomImageSction(height: 17, width: 15, radius: 1, image: "Assets/DashBoardIcons/clender.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  String selected2Datee = DateFormat.yMMMd().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMd();
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }
}
