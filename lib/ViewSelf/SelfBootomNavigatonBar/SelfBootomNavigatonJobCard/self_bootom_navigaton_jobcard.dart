
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomMySelfJobCard/CustomMySelfJobCard3rdPart/custom_myself_jobcard3rdpart.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomMySelfJobCard/SelfCustomCalender/self_custom_calender.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../CustomWidget/CustomImage/custom_image.dart';

class SelfBootomNavigatonJobCard extends StatefulWidget {
  const SelfBootomNavigatonJobCard({super.key});

  @override
  State<SelfBootomNavigatonJobCard> createState() => _SelfBootomNavigatonJobCardState();
}

class _SelfBootomNavigatonJobCardState extends State<SelfBootomNavigatonJobCard> {
  double animatedheight=0;
  int selectedmonth=0;
  String? selectedValue;
  int key=0;

  int  selectedindex=-1;
  String ? getindex;

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: home_default_color,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 132,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
              color: Main_Theme_WhiteCollor,

              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 139,
                        width: 170,
                        child: SelfProfileSummaryPart()),
                  ),



                  Container(
                    height: 170,
                    width: 170,
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return PieChart(
                          key: ValueKey(key),
                          chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: false
                          ),
                          /// Customize Right Side Option ----------------------------------P L H A----------.
                          legendOptions: LegendOptions(
                              legendTextStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,)),
                          dataMap: {"P": 5, "A": 2, "L": 3, "H": 2,},
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 10,
                          chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300), // radius komay baray
                          colorList: [
                            presentsent_color, absent_color, holiday_color, leave_color
                          ],
                          initialAngleInDegree: 0,
                          ringStrokeWidth: -4,
                          baseChartColor: Colors.transparent,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: apps_div_margin,),
            CustomCalender(
                width: 120, is_share: true, onTap: () {
            }, is_messsage: true, onTap2message: () {
            }, is_pdf: true, onTap3pdf: () {
            },
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                width: 400,
                color: Main_Theme_WhiteCollor,
                child: Container(
                    child: ListView.builder(
                      itemCount: DateTime(DateTime.now().year, DateTime.now().month+1, 0).day,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex=index;
                              animatedheight=0;
                              Future.delayed(Duration(milliseconds: 100),() {
                                setState(() {
                                  if(getindex=="$index"){
                                    animatedheight=0;
                                    getindex='';
                                  }else{
                                    animatedheight=210;
                                    getindex="$index";
                                  }

                                });
                              },);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(7)),
                                    //  color: Color(0xffF3FCFB)
                                  //  color:  CustomButtonColor.withOpacity(0.05),
                                    border: Border(bottom: BorderSide( color: CustomButtonColor))
                                ),
                                margin: EdgeInsets.only(bottom: 7),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 6,right: 10),
                                      height: 62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                          bottomLeft: Radius.circular( selectedindex==index?0:7),
                                          bottomRight:Radius.circular( selectedindex==index?0:7),
                                        ),    ),
                                      width: double.infinity,
                                      child: CustomMySelfJobCard3rdPart1(selectedindex: selectedindex==index?true:false,index: index,),
                                    ),
                                    selectedindex==index?
                                    AnimatedContainer(
                                      height: animatedheight,
                                      width: double.infinity,
                                      duration: Duration(milliseconds: 400),
                                      child: Container(
                                        child: SingleChildScrollView(
                                          physics: NeverScrollableScrollPhysics(),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Divider(height: 0.5,),
                                              CustomMySelfJobCard3rdPart(),
                                              Divider(height: 0.5,),
                                              Container(
                                                height: 20,
                                                margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    CustomImageSction2(height: 16, width: 14, radius: 5, image: "Assets/DrawerImage/chat.png", img_color: Main_Theme_textColor.withOpacity(0.6)),
                                                    SizedBox(width: 7,),
                                                    CustomText(fontSize: 13, fontWeight: FontWeight.w300, text: "Comments", letterSpacing: 0.3),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  border: Border.all(color: Main_Theme_textColor.withOpacity(0.5)),
                                                ),
                                                margin: EdgeInsets.only(left: 10,right: 10),
                                                padding: EdgeInsets.all(10),
                                                child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400,maxLines: 2 ,text: "$Loremtext", letterSpacing: 0.3,textAlign: TextAlign.justify, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0,top: 5),
                                                child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w300, text: "Movement punch", letterSpacing: 0.3,textAlign: TextAlign.left ,textColor: Main_Theme_textColor.withOpacity(0.7)),
                                              ),
                                              Container(
                                                height: 100,
                                                margin: EdgeInsets.only(top: 7,left: 10,right: 10),
                                                width: double.infinity,
                                                child:
                                                GridView.builder(
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,mainAxisSpacing:5, crossAxisSpacing: 5,mainAxisExtent: 15),
                                                  itemCount: 4,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, index) {
                                                      return ColorCustomText(fontSize:11, fontWeight: FontWeight.w300, text: "10-sep-2024 : 10:20:44 (A-101)", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5));
                                                    },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ) ,
                                    ) :Container(),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5,
                                  left: 40,
                                  child: CircleAvatar(
                                radius: 8,
                               backgroundColor:absent_color.withOpacity(0.4),
                              // backgroundColor:Main_Theme_WhiteCollor,
                                    child: Icon(Icons.location_on_outlined,color: Main_Theme_textColor.withOpacity(0.6),size: 12,),
                                    // backgroundColor:Colors.red,
                              ),

                              )
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
}