import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_header_partt.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_third_part_progressbar.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_thired_part_header.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status.dart';
import 'package:intl/intl.dart';
import '../../CustomWidget/CustomText/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(100),
          /// ------------ Custom Main AppBAr -------------///
          child: CustomMainAppBar(leading_image_route: "Assets/DashBoardIcons/appbar_leadin_menu.png", center_appbar_text: "Jibika Plexus", leading_ontab: () {}, is_need_trailing: true),
        ),
      body: Container(
        color: home_default_color,
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top :10, left: 10.0,right: 10),
              child: HomeHederPart(
                permission_list: [],
              ),
            ),
            /// ------------- Second Part -------------///
            Container(
              height: 180,
              padding: const EdgeInsets.only(top :7, left: 11.0,right: 11),
              child:SecondhomePartScreen(
                  presentTExt: "93",
                  PersentCount: "565",
                  AbsentCount: "323",
                  LeaveCount: "868",
                  HolidayCount: "696",
                  ManpowerCount: "255",
                  ///----------------- Circle ratio part --------------------///
                  total_present: 0.8, total_absent: 0.90, total_leave: 0.95, total_holiday: 1.0
              ),
            ),


            ///---------------- Third Part --------------------///
            Container(
              height: 170,
              width: double.infinity,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white
              ),
              margin: EdgeInsets.symmetric(horizontal: 11,vertical: 10),
              child: Column(
                children: [

                  ///----------- Bar chat Header Part -------///
                  HomeThiredPartHeader(
                    PayableMony: "150", DailyMony: "1500", CumulativeMony: "1222345611",
                  ),
                  Expanded(
                      child: Container(
                        child: Row(
                          children: [
                             Container(
                               height: 170,
                               width: 50,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "100%", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.7),),
                                 //  CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "80%", letterSpacing: 0.4),
                                   ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "70%", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.7),),
                                  // CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "40%", letterSpacing: 0.4),
                                   ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "30%", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.7),),
                                   ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "0%", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.7),),
                                   SizedBox(height: 20,),
                                 ],
                               ),
                             ),
                            Expanded(
                                child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.greenAccent.shade100.withOpacity(0.1),
                              child:  Container(
                                height: 80,
                                width: 500,
                                child:Scrollbar(
                                  child: ListView.builder(
                                    itemCount: 30,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                    return  Container(
                                      height: 80,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Expanded(child: ThirdPartProgressBar(  absenttheight: 30+double.parse("$index"), presentheight:70-double.parse("$index"))),
                                            SizedBox(height: 5,),
                                            Container(
                                              height: 20,
                                              width: 22,
                                              decoration: BoxDecoration(
                                                  color:DateTime.now().day==index? presentsent_color:Main_Theme_textColor.withOpacity(0.05),
                                                borderRadius: BorderRadius.circular(2)
                                              ),
                                              alignment: Alignment.center,
                                              child: CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "${index+1}", letterSpacing: 0.2)
                                            ),
                                            SizedBox(height: 5,),
                                          ],
                                        ));
                                  },),
                                )
                              ),
                            )),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
  int selected_index = 0;
  String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMEd();
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }
}

