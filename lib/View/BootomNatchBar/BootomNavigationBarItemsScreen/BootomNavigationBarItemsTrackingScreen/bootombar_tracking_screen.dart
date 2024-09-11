import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/TrackingController/tracking_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomTrackNowButton/custom_tracknow_button.dart';
import 'package:jibika_plexus/View/BootomNatchBar/BootomNavigationBarItemsScreen/BootomNavigationBarItemsTrackingScreen/EmployeeTrackinScreen/employee_tracking_screen.dart';
import 'package:provider/provider.dart';

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
  void initState() {
  Provider.of<TrackingController>(context,listen: false).GetMovementTrackableEmployeeListProvider("${GetStorage().read("mobile_id")}", "Y", context);
  // TODO: implement initState
    super.initState();
  }
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
                child: Consumer<TrackingController>(
                  builder: (context, value, child) =>
                  value.GetMovementTrackableEmployeeList==null?Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),) :   ListView.builder(
                    itemCount: value.GetMovementTrackableEmployeeList.length,
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
                              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              height: 80,
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
                                              image: DecorationImage(image: NetworkImage("${GetStorage().read("APPS_IMG_BASEURL")}/${value.GetMovementTrackableEmployeeList[index]["EMP_PHOTO_PATH"]}"),fit: BoxFit.fill)
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
                                            child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${value.GetMovementTrackableEmployeeList[index]["EMPCODE"]}", letterSpacing: 0.3,textColor: Main_Theme_WhiteCollor,),
                                          ),
                                          SizedBox(height: 3,),
                                          Text("${value.GetMovementTrackableEmployeeList[index]["EMPLOYEE_NAME"]}",
                                            overflow: TextOverflow.ellipsis
                                            ,style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.3,
                                            ),),
                                          SizedBox(height: 1,),
                                          CustomText(fontSize: 11, fontWeight: FontWeight.w300, text:"${value.GetMovementTrackableEmployeeList[index]["DESIG_NAME"]}", letterSpacing: 0.3,  ),
                                        ],
                                      ),
                                  ),
                                  SizedBox(width: 10,),
                                  CustomTrackNowButton(b_text: "Track history",  onTap: () {

                                    Provider.of<TrackingController>(context,listen: false).GetEmployeeLocaltionInfoProvider("${GetStorage().read("mobile_id")}", "${selected2Datee}","${value.GetMovementTrackableEmployeeList[index]["EMPCODE"]}", context);
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => EmployeeTrackinScreen(image: "${value.GetMovementTrackableEmployeeList[index]["EMP_PHOTO_PATH"]}", name: "${value.GetMovementTrackableEmployeeList[index]["EMPLOYEE_NAME"]}", e_code: "${value.GetMovementTrackableEmployeeList[index]["EMPCODE"]}",
                                        e_deg:"${value.GetMovementTrackableEmployeeList[index]["DESIG_NAME"]}", e_dep: "${value.GetMovementTrackableEmployeeList[index]["DEPT_NAME"]}",
                                        selectedDate: "$selected2Datee",ID_CARD_NO: "${value.GetMovementTrackableEmployeeList[index]["ID_CARD_NO"]}",),));
                                    }, )




                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },),
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
      });
    }
  }
}
