
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomMySelfJobCard/CustomMySelfJobCard3rdPart/custom_myself_jobcard3rdpart.dart';
import 'package:jibika_plexus/CustomSelfWedget/CustomMySelfJobCard/SelfCustomCalender/self_custom_calender.dart';
import 'package:jibika_plexus/CustomSelfWedget/selfAttendance/self_attendance_summary.dart';
import 'package:jibika_plexus/CustomSelfWedget/self_profile_summary.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../../../Controller/SelfDashboardController/self_dashboard_controller.dart';
import '../../../CustomSelfWedget/myself_leave_status.dart';
import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../SelfBootomNavigatonBarHomeScreen/self_bootom_navigaton_bar_home_screen.dart';

class SelfBootomNavigatonEmployeeDashboard extends StatefulWidget {
  const SelfBootomNavigatonEmployeeDashboard({super.key});

  @override
  State<SelfBootomNavigatonEmployeeDashboard> createState() => _SelfBootomNavigatonEmployeeDashboardState();
}

class _SelfBootomNavigatonEmployeeDashboardState extends State<SelfBootomNavigatonEmployeeDashboard> {
  double animatedheight=0;
  int selectedmonth=0;
  String? selectedValue;
  int key=0;

  int  selectedindex=-1;
  String ? getindex;
  @override
  void initState() {

    Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        "${GetStorage().read("mobile_id")}",
        "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
        "${GetStorage().read("IdCardNo")}",
        "GENERAL",
        context
    );
    Provider.of<SelfDashboardController>(context,listen: false).selfAdminAdmin_Get_Monthly_Att_SummaryCountProvider(
        "${DateFormat("MMM-yyyy").format(DateTime.now())}",
        context
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double P_Count=0;
    double AB_Count=0;
    double L_Count=0;
    double HL_Count=0;

    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    List<Updated_attendance_summary>  selfOneMonthAttendanceList=  Provider.of<SelfDashboardController>(context).selfOneMonthAttendanceList;
    dynamic selfAdminAdmin_Get_Monthly_Att_SummaryCountList=Provider.of<SelfDashboardController>(context).selfAdminAdmin_Get_Monthly_Att_SummaryCountList;


    for(var i in selfOneMonthAttendanceList){
      if("${i.Status}"=="P"){
        P_Count++;
      }
      else if("${i.Status}"=="AB"){
        AB_Count++;
      }
      else if("${i.Status!.substring(i.Status!.length-1)}"=="L" ){
        L_Count++;
      }
      else if("${i.Status!.substring(i.Status!.length-1)}"=="H" ){
        HL_Count++;
      }
      else{
     //   HL_Count++;
      }
    }

    return Scaffold(
    //  backgroundColor: home_default_color,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 115,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 0,top: 0,bottom: 0),
                    color: Main_Theme_WhiteCollor,
                    child:  SelfProfileSummaryPart()
                  ),
                  Positioned(
                    right: 0,
                    top: -10,
                    child:  Container(color: Colors.white,
                    height: 139,
                    width: MediaQuery.of(context).size.width*0.45,
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
                          dataMap: {
                            "P(${double.parse("$P_Count").toStringAsFixed(0)}D) "
                                :
                            P_Count, "A(${double.parse("$AB_Count").toStringAsFixed(0)}D)"
                                :
                            AB_Count, "L(${double.parse("$L_Count").toStringAsFixed(0)}D)"
                                :
                            L_Count, "H (${double.parse("$HL_Count").toStringAsFixed(0)}D)"
                                :
                            HL_Count,
                          },
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 10,
                          chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300), // radius komay baray
                          colorList: [
                            presentsent_color.withOpacity(0.75),
                            absent_color.withOpacity(0.75),
                            leave_color.withOpacity(0.75) ,
                            holiday_color.withOpacity(0.75)
                          ],
                          initialAngleInDegree: 0,
                          ringStrokeWidth: -4,
                          baseChartColor: Colors.transparent,
                        );
                      },
                    ),
                  ),)
                ],
              ),
              Container(
                height: 90,
                width: double.infinity,
                color: Main_Theme_WhiteCollor,
                padding: EdgeInsets.only(
                  bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SelfAttendanceSummarySecondPart(image: "Assets/SelfIcon/late_punch.png", text1: "Total late", text2:selfAdminAdmin_Get_Monthly_Att_SummaryCountList==null?"": "${selfAdminAdmin_Get_Monthly_Att_SummaryCountList["LATE_MINUTE"]??""}", image_h: 20, image_w: 20),
                     SelfAttendanceSummarySecondPart(image: "Assets/SelfIcon/late_punch.png", text1: "Total Early", text2:selfAdminAdmin_Get_Monthly_Att_SummaryCountList==null?"":"${selfAdminAdmin_Get_Monthly_Att_SummaryCountList["EARLY_MINUTE"]??""}", image_h: 20, image_w: 20),
                     SelfAttendanceSummarySecondPart(image: "Assets/SelfIcon/late_punch.png", text1: "Total Duration", text2:selfAdminAdmin_Get_Monthly_Att_SummaryCountList==null?"": "${selfAdminAdmin_Get_Monthly_Att_SummaryCountList["WORK_DURATION"]??""}", image_h: 20, image_w: 20),
                     SelfAttendanceSummarySecondPart(image: "Assets/SelfIcon/late_punch.png", text1: "Total OT", text2:selfAdminAdmin_Get_Monthly_Att_SummaryCountList==null?"": "${selfAdminAdmin_Get_Monthly_Att_SummaryCountList["OVER_TIME"]??""}", image_h: 20, image_w: 20),
                  ],
                ),
              ),
              SizedBox(height: apps_div_margin,),

              // CustomCalender(
              //     width: 120, is_share: true, onTap: () {
              // }, is_messsage: true, onTap2message: () {
              // }, is_pdf: true, onTap3pdf: () {
              // },
              // ),


              InkWell(
                onTap: () {
                  _onPressed(context: context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 15,bottom: 10),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: Main_Theme_textColor.withOpacity(0.3),
                      )
                    ),
                    alignment: Alignment.center,
                    child:CustomText(fontSize: 13, fontWeight: FontWeight.w400, text:_selected_pick_month==null?"${DateFormat("MMM-yyyy").format(DateTime.now())}": "${DateFormat("MMM-yyyy").format(_selected_pick_month)}" , letterSpacing:  0.3),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //  itemCount: DateTime(DateTime.now().year, DateTime.now().month+1, 0).day,
                  itemCount:selfOneMonthAttendanceList.length,
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
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                     color:"${selfOneMonthAttendanceList[index].Status}"=="P"?presentsent_color.withOpacity(0.3) : "${selfOneMonthAttendanceList[index].Status}"=="AB"?absent_color.withOpacity(0.3) : "${selfOneMonthAttendanceList[index].Status!.substring(selfOneMonthAttendanceList[index].Status!.length-1, selfOneMonthAttendanceList[index].Status!.length)}"=="H"?holiday_color.withOpacity(0.3) : "${selfOneMonthAttendanceList[index].Status!.substring(selfOneMonthAttendanceList[index].Status!.length-1,selfOneMonthAttendanceList[index].Status!.length )}"=="L"?leave_color.withOpacity(0.3) : Main_Theme_WhiteCollor,
                          //     color:Color((math.sin(index) * 0xFFFFFF).toInt()).withOpacity(0.5)
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(7)),
                                  //  color: Color(0xffF3FCFB)
                                //  color:  CustomButtonColor.withOpacity(0.05),
                                  border: Border(bottom: BorderSide( color: CustomButtonColor.withOpacity(0.5)))
                              ),
                           //   margin: EdgeInsets.only(bottom: 7),
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
                                      ),

                                    ),
                                    width: double.infinity,
                                    child: CustomMySelfJobCard3rdPart1
                                      (selectedindex: selectedindex==index?true:false,
                                      index: "${index + 1}",
                                       text2: "${DateFormat('EEE ').format(DateTime.parse(DateTime.now().month >9 && index+1 >9 ? "${DateTime.now().year}${DateTime.now().month}${index + 1}" : DateTime.now().month >9 && index+1 <10 ?  "${DateTime.now().year}${DateTime.now().month}0${index + 1}" :DateTime.now().month <10 && index+1 >9 ?  "${DateTime.now().year}0${DateTime.now().month}${index + 1}"  :  "${DateTime.now().year}0${DateTime.now().month}0${index + 1}"             ))}",
                                      intime :"${selfOneMonthAttendanceList[index].iNTIME}",
                                      outTime :"${selfOneMonthAttendanceList[index].oUTTIME}",

                                      status:  "${selfOneMonthAttendanceList[index].Status}",
                                      location:  " ",
                                    ),
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
                                            CustomMySelfJobCard3rdPart(late: "${selfOneMonthAttendanceList[index].lATE??""}", Duration:  "${selfOneMonthAttendanceList[index].aCTUALWORKDURATION??""}", OT: "${selfOneMonthAttendanceList[index].oT??""}", Shift_Plane: "${selfOneMonthAttendanceList[index].sHIFTPLAN??""}"),
                                            //  CustomMySelfJobCard3rdPart(late: "   ", Duration:  "    ", OT: " ", Shift_Plane: " "),
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
                                              child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400,maxLines: 2 ,text:   "${selfOneMonthAttendanceList[index].aTTENDANCEREMARK??"You dont have comments Today"}", letterSpacing: 0.3,textAlign: TextAlign.justify, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                              //   child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400,maxLines: 2 ,text:   " You dont have comments Today", letterSpacing: 0.3,textAlign: TextAlign.justify, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0,top: 5),
                                              child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w300, text: "Movement punch", letterSpacing: 0.3,textAlign: TextAlign.left ,textColor: Main_Theme_textColor.withOpacity(0.7)),
                                            ),
                                            // Container(
                                            //   height: 100,
                                            //   margin: EdgeInsets.only(top: 7,left: 10,right: 10),
                                            //   width: double.infinity,
                                            //   child:
                                            //   GridView.builder(
                                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            //         crossAxisCount: 2,mainAxisSpacing:5, crossAxisSpacing: 5,mainAxisExtent: 15),
                                            //     itemCount: 4,
                                            //     physics: NeverScrollableScrollPhysics(),
                                            //     itemBuilder: (context, index) {
                                            //         return ColorCustomText(fontSize:11, fontWeight: FontWeight.w300, text: "10-sep-2024 : 10:20:44 (A-101)", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5));
                                            //       },
                                            //   ),
                                            // )
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                border: Border.all(color: Main_Theme_textColor.withOpacity(0.5)),
                                              ),
                                              margin: EdgeInsets.only(left: 10,right: 10),
                                              padding: EdgeInsets.all(10),
                                              child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400,maxLines: 2 ,text:   "${selfOneMonthAttendanceList[index].mOVEMENTPUNCH??"You dont have movements punch today"}", letterSpacing: 0.3,textAlign: TextAlign.justify, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                              //    child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400,maxLines: 2 ,text:   "You dont have movements punch today", letterSpacing: 0.3,textAlign: TextAlign.justify, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                            ),
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
                      ),
                    );
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///------------------- Month Picker ---------------------------
  DateTime   _selected_pick_month =DateTime.now();
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected_pick_month ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2130),
      locale: localeObj,

    );

    if (selected != null) {
      setState(() {
        _selected_pick_month = selected;
        // Provider.of<HomeProvider>(context,listen: false).dashboardBarChartDataProvider("${GetStorage().read("mobile_id")}", "${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}","$selectedValue", context);
        Provider.of<SelfDashboardController>(context,listen: false).selfAdminAdmin_Get_Monthly_Att_SummaryCountProvider(
            "${DateFormat("MMM-yyyy").format(_selected_pick_month)}",
            context
        );

        Provider.of<SelfDashboardController>(context,listen: false).selfOneMonthAttendanceProvider(
            int.parse(DateFormat('yyyy').format(_selected_pick_month!)),
            int.parse(DateFormat('MM').format(_selected_pick_month!)),
            int.parse(DateFormat('dd').format(_selected_pick_month!)),
            "${GetStorage().read("mobile_id")}",
            "${DateFormat('dd-MMM-yyyy').format(_selected_pick_month)}",
            "${GetStorage().read("IdCardNo")}",
            "GENERAL",
            context
        );
      });
    }
  }
  ///------------------- Month Picker ---------------------------


}
