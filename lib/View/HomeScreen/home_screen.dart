import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomMAinAppBAr/custom_main_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCalender/custom_calender.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_header_partt.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/home_thired_part_header.dart';
import 'package:jibika_plexus/View/HomeScreen/HomeComponent/summary_status.dart';
import 'package:intl/intl.dart';
import '../../CustomWidget/CustomText/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Padding(
              padding: const EdgeInsets.only(top :7, left: 11.0,right: 11),
              child:SecondhomePartScreen(
                  presentTExt: "93", PersentCount: "565", AbsentCount: "323", LeaveCount: "868", HolidayCount: "696", ManpowerCount: "255",
                  ///----------------- Circle ratio part --------------------///
                  total_present: 0.8, total_absent: 0.90, total_leave: 0.95, total_holiday: 1.0
              ),
            ),


            ///---------------- Third Part --------------------///
            Container(
              height: 300,
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
                      flex:3,
                      child: Container(
                        color: Colors.red,
                        child: Row(
                          children: [
                             Container(
                               height: 300,
                             )
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

