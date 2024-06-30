import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';



class BootomNavigationBarItemsTrackingScreen extends StatefulWidget {
  const BootomNavigationBarItemsTrackingScreen({super.key});

  @override
  State<BootomNavigationBarItemsTrackingScreen> createState() => _BootomNavigationBarItemsTrackingScreenState();
}

class _BootomNavigationBarItemsTrackingScreenState extends State<BootomNavigationBarItemsTrackingScreen> {

  int  selectedindex=0;
  double animatedheight=0;
  double animatwidth=100;
  String ? getindex;
  int selectedmonth=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 7),
                width: 400,
                color: Main_Theme_WhiteCollor,
                padding: EdgeInsets.only(
                    left: 10,right: 10
                ),
                child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all( Radius.circular(7)),

                              color:  CustomButtonColor.withOpacity(0.05),
                              border: Border(bottom: BorderSide( color: CustomButtonColor))
                          ),
                          margin: EdgeInsets.only(bottom: 7),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 6,right: 10),
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                    bottomLeft: Radius.circular( selectedindex==index?0:7),
                                    bottomRight:Radius.circular( selectedindex==index?0:7),
                                  ),

                                  color:selectedindex==index?leave_color.withOpacity(0.1) : leave_color.withOpacity(0.05),
                                  //  border: Border(bottom: BorderSide(color:_selectedindex==index?CustomButtonColor.withOpacity(0.05): CustomButtonColor))
                                ),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 52,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            topRight: Radius.circular(7),
                                            bottomLeft: Radius.circular( selectedindex==index?0:7),
                                            bottomRight:Radius.circular( selectedindex==index?0:7),

                                          )
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: CustomImageSction(height: 64, width: 50, radius: 1, image: "Assets/DrawerImage/trackingimage.png")
                                            ),
                                          ),
                                          Positioned(
                                              left: 4.0,
                                              top: 1.6,
                                              child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                image: DecorationImage(image: AssetImage("Assets/DrawerImage/testperson.png"),fit: BoxFit.fill)
                                              ),
                                            ),
                                          ))

                                        ],
                                      ),
                                    ),


                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 22,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                              color:Main_Theme_textColor_tir_Condition.withOpacity(0.7)
                                              ),
                                              alignment: Alignment.center,
                                              child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "544532", letterSpacing: 0.3,textColor: Main_Theme_WhiteCollor,),
                                            ),
                                            Text("Hafijur Rahman Mizan",
                                              overflow: TextOverflow.ellipsis
                                              ,style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.3,
                                              ),),
                                            CustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "HR Manager", letterSpacing: 0.3,  ),
                                          ],
                                        ),
                                    ),
                                    SizedBox(width: 10,),


                                    Container(
                                      height: 38,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Main_Theme_textColor_tir_Condition.withOpacity(0.7)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Track Now", letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
                                          SizedBox(width: 5,),
                                          Icon(Icons.arrow_forward_ios_rounded,size: 17,color: Main_Theme_WhiteCollor,),
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                              ),

                            ],
                          ),
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
