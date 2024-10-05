
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomEmployeeProfile/custom_employee_profile.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsTrackingScreen/EmployeeConvinceTrackinScreen/employee_convince_tracking_screen.dart';
import 'package:jibika_plexus/tracking_google_map.dart';
import 'package:jibika_plexus/tracking_google_map_test.dart';
import 'package:provider/provider.dart';
import '../../../../../Controller/TrackingController/tracking_controller.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class EmployeeTrackinScreen extends StatefulWidget {
   EmployeeTrackinScreen({super.key,required this.image,required this.name,required this.e_code,required this.e_deg,required this.e_dep,required this.selectedDate,required this.ID_CARD_NO});
  String image;
  String name;
  String e_code;
  String e_deg;
  String e_dep;
  String selectedDate;
  String ID_CARD_NO;
  @override
  State<EmployeeTrackinScreen> createState() => _EmployeeTrackinScreenState();
}

class _EmployeeTrackinScreenState extends State<EmployeeTrackinScreen> {
  int selected_index=0;
  @override
  void initState() {
    Provider.of<TrackingController>(context,listen: false).GetMovementTrackableEmployeeByAttendanceDateProvider(
        "${GetStorage().read("mobile_id")}",
        "${selected2Datee}", "${widget.ID_CARD_NO}", context);
    Provider.of<TrackingController>(context,listen: false).GetEmployeeLocaltionInfoProvider(
        "${GetStorage().read("mobile_id")}",
        "${selected2Datee}",
        "${widget.e_code}",
        context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "${widget.name}")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part -----------------------------
            Stack(
              children: [
                CustomEmployeeProfile(
                  image: "${widget.image}", id: "${widget.e_code}", name: "${widget.name}", designation: "${widget.e_deg}",
                    time: "${widget.e_dep}", onTap1: () {

                    }, onTap2: () {

                    },
                onTap3: () {
                },
                  need_location: false,
                ),
                Positioned(
                    right: 15,
                    bottom: 8,
                    child: InkWell(
                      onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeConvinceTrackinScreen(
                      // //    list_of_location: Provider.of<TrackingController>(context).EmployeeLocaltionInfoList,
                      //   ),

                        print("aaaaaaaaaaaaaaa ${Provider.of<TrackingController>(context,listen: false).EmployeeLocaltionInfoList}");

                        "${Provider.of<TrackingController>(context,listen: false).EmployeeLocaltionInfoList}"=="null"?alertFunction(context, "You don't have location", "Please Enabled GPS Track"):         Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingMapScreenTEstPoliline(
                              list_of_location: Provider.of<TrackingController>(context).EmployeeLocaltionInfoList,
                          lat: double.parse("${Provider.of<TrackingController>(context).EmployeeLocaltionInfoList.last["Latitude"]}"),
                          lon: double.parse("${Provider.of<TrackingController>(context).EmployeeLocaltionInfoList.last["Longitude"]}"),
                        ),
                        ));
                      },
                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                          Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                          // Main_Theme_textColor_tir_Condition,
                        ]),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Main_Theme_WhiteCollor.withOpacity(0.7),
                        width: 1.5,
                      )
                                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         Icon(Icons.location_on_outlined,size: 17,color: Main_Theme_WhiteCollor.withOpacity(0.7),),
                            //   Image.asset("Assets/DashBoardIcons/location.png",height: 18,width: 18,fit: BoxFit.fill,color: Main_Theme_WhiteCollor,),
                            ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Track Now", letterSpacing: 0.2,textColor: Main_Theme_WhiteCollor,),
                          ],
                        ),
                                      ),
                    ))
              ],
            ),
            InkWell(
              onTap: () {
                _select2Date(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                  ),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    right: 10
                  ),
                  //  child: Icon(Icons.calendar_month,size: 18,color: Main_Theme_textColor.withOpacity(0.4),)
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$selected2Datee", letterSpacing: 0.3),
                      SizedBox(width: 7,),
                      CustomImageSction(height: 30, width: 30, radius: 3, image: "Assets/DashBoardIcons/clender.png"),
                    ],
                  )
              ),
            ),
            /// Second part -----------------------------


            Consumer<TrackingController>(
              builder: (context, value, child) =>
              value.EmployeeLocaltionInfoList==null?Center(child: Text("Please wait searchin tracking info"),):
                  Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Consumer<TrackingController>(
                        builder: (context, value, child) =>value.GetMovementTrackableEmployeeByAttendanceDatelist==null?Center(child: CircularProgressIndicator(),):
                        value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["SHIFT_IN_TIME"]==""?Container():
                            Container(
                          width: double.infinity,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text:value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ACTUAL_IN_TIME"] == ""?"": "Check In -${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ACTUAL_IN_TIME"].toString().substring(12,20)}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                      {value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["IN_LOCNAME"]}==""?Container():    Text( "${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["IN_LOCNAME"]}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.2,
                                          color: Main_Theme_textColor,
                                      ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                          color: Main_Theme_textColor_tir_Condition),
                                      CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
                                    ],
                                  ),
                                  SizedBox(width: 7,)
                                ],
                              ),
                              SizedBox(height: 5,),
                              value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ATTENDANCE_REMARK"]==""? Container() :  Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: home_default_color,
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                                child: Text( "${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ATTENDANCE_REMARK"]}", style: GoogleFonts.poppins(
                                    fontSize: 11, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.EmployeeLocaltionInfoList.length,
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                    color: home_default_color),
                                child: Row(
                                  children: [
                                    /// left part
                                    Container(
                                      height: 89,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    left: 24.5,
                                                    right: 24.5,
                                                    bottom: 2,
                                                  ),
                                                  width: 2,
                                                  height: 5,
                                                  color:
                                                      Main_Theme_textColor_tir_Condition,
                                                );
                                              },
                                            ),
                                          ),
                                          CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Main_Theme_textColor_tir_Condition
                                                      .withOpacity(0.7),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                // child: Image.asset("Assets/DashBoardIcons/location.png",color: Main_Theme_WhiteCollor,),
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  color:
                                                      Main_Theme_WhiteCollor,
                                                  size: 22,
                                                ),
                                              )),
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    left: 24.5,
                                                    right: 24.5,
                                                    bottom: 2,
                                                  ),
                                                  width: 2,
                                                  height: 5,
                                                  color:
                                                      Main_Theme_textColor_tir_Condition,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// Right part
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 5, bottom: 5, left: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Main_Theme_WhiteCollor),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ColorCustomText(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      text:  "${value.EmployeeLocaltionInfoList[index]["datetime"]}",
                                                      letterSpacing: 0.2,
                                                      textColor:
                                                          Main_Theme_textColor
                                                              .withOpacity(
                                                                  0.8)),
                                                  Text(
                                                    "${value.EmployeeLocaltionInfoList[index]["AdArea"]}, ${value.EmployeeLocaltionInfoList[index]["SubLocality"]}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.2,
                                                        color:
                                                            Main_Theme_textColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingMapScreen(
                                                    lat: double.parse("${value.EmployeeLocaltionInfoList[index]["Latitude"]}"),
                                                    lon: double.parse("${value.EmployeeLocaltionInfoList[index]["Longitude"]}"),
                                                     address: "${value.EmployeeLocaltionInfoList[index]["AdArea"]}, ${value.EmployeeLocaltionInfoList[index]["SubLocality"]}",
                                                  time: "${value.EmployeeLocaltionInfoList[index]["datetime"]}",
                                                )));
                                              },
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "Assets/DashBoardIcons/map_view.png",
                                                    height: 25,
                                                    width: 25,
                                                    fit: BoxFit.fill,
                                                    color:
                                                        Main_Theme_textColor_tir_Condition,
                                                  ),
                                                  CustomText(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      text: "View map",
                                                      letterSpacing: 0.3)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                      Consumer<TrackingController>(
                        builder: (context, value, child) =>
                        value.GetMovementTrackableEmployeeByAttendanceDatelist==null?Center(child: CircularProgressIndicator(),):
                        value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ACTUAL_OUT_TIME"]==""?Container(): Container(
                          width: double.infinity,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Check In -${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ACTUAL_OUT_TIME"].toString().substring(12,20)}", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                      Text( "${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["OUT_LOCNAME"]}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.2,
                                          color: Main_Theme_textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Image.asset("Assets/DashBoardIcons/map_view.png",height: 24,width: 24,fit: BoxFit.fill,
                                          color: Main_Theme_textColor_tir_Condition),
                                      CustomText(fontSize: 9, fontWeight: FontWeight.w300, text: "View map", letterSpacing: 0.3)
                                    ],
                                  ),
                                  SizedBox(width: 7,)
                                ],
                              ),
                              SizedBox(height: 5,),
                              value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ATTENDANCE_REMARK"]==""? Container() :     Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: home_default_color,
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                                child: Text( "${value.GetMovementTrackableEmployeeByAttendanceDatelist[0]["ATTENDANCE_REMARK"]}", style: GoogleFonts.poppins(
                                  fontSize: 11, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0,right: 100,top: 10,bottom: 10),
                        child: CustomButton(onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => EmployeeConvinceTrackinScreen(),));
                        }, text: "View convince", button_text_fontSize: 15, button_height: 40, custom_button_collor: CustomButtonColor.withOpacity(0.8), button_text_color: Main_Theme_WhiteCollor, borderRadius: 20),
                      ),

                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ) 
          ],
        ),
      ),
    );
  }
  String selected2Datee = DateFormat("dd-MMM-yyyy").format(DateTime.now()).toString();
  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat("dd-MMM-yyyy");
      setState(() {
        selected2Datee = df.format(picked);
        get_location_info();
      });
    }
  }
  get_location_info(){
    Provider.of<TrackingController>(context,listen: false).GetEmployeeLocaltionInfoProvider(
        "${GetStorage().read("mobile_id")}",
        "${selected2Datee}",
        "${widget.e_code}",
        context);
  }
}
