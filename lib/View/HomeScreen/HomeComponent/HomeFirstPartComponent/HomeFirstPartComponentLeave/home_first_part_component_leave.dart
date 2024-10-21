
import 'dart:math';
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../CustomSelfWedget/ApprovedDisApprovedButton/approve_disapprove_button.dart';
import '../../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';

class HomeFirstPartComponentLeave extends StatefulWidget {
 HomeFirstPartComponentLeave({super.key,this.tag});
  String ? tag;
  @override
  State<HomeFirstPartComponentLeave> createState() => _HomeFirstPartComponentLeaveState();
}

class _HomeFirstPartComponentLeaveState extends State<HomeFirstPartComponentLeave> {
  int  selectedindex=0;
  double animatedheight=0;
  double animatwidth=100;
  String ? getindex;
  bool _is_click_date=false;
  int selectedmonth=0;
  int _selectedIndex=0;
  List nameList=['Waiting','Approved','Disapproved'];
  @override
  Widget build(BuildContext context) {
    final isChekin=Provider.of<CounterProvider>(context).isCheckIn;
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Leave Approval"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// ------------------------ Waiting approved and disApproved ---------------------------
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
                            Expanded(
                              child: Container(
                                  child: TextFormField(
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: 10,left: 10),
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
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10
                              ),
                              height: 12,
                              width: 2,
                              color: Main_Theme_textColor.withOpacity(0.1),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10,right: 10
                              ),
                              height: 16,width: 16 ,
                              child: CustomImageSction2(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png",img_color: Main_Theme_textColor.withOpacity(0.5),),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      _onPressed(context: context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Main_Theme_textColor.withOpacity(0.1),width: 1.5)
                      ),
                      height: 40,
                      width: 110,
                      child: Row(
                        children: [
                          Spacer(),
                          CustomText(fontSize: font12, fontWeight: FontWeight.w400, text: "${DateFormat("MMM-yyyy").format(DateTime.parse("$selected_pick_month"))}", letterSpacing: 0.1),
                          Spacer(),
                          Padding(
                            padding:   EdgeInsets.all(3.0),
                            child: Image.asset("Assets/DashBoardIcons/clender.png",fit: BoxFit.fill,height: 40,width: 30,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// Check in &&& CheckOut ----------------------------------------------------------------///
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              padding:  EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 5),
              child: AnimatedToggleSwitch<int>.size(
                height: 35,
                current: max(_selectedIndex, 0),
                style: ToggleStyle(
                  backgroundColor: home_default_color,
                  indicatorColor:_selectedIndex==0? CheckOutColor :_selectedIndex==1? presentsent_color : absent_color ,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  indicatorBorderRadius: BorderRadius.circular(30),

                ),
                values:  [0, 1],
                iconOpacity: 1.0,
                selectedIconScale: 1.0,
                indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width/2),
                iconAnimationType: AnimationType.onHover,
                styleAnimationType: AnimationType.onHover,
                spacing: 2.0,
                customSeparatorBuilder: (context, local, global) {
                  final opacity =
                  ((global.position - local.position).abs() - 0.5)
                      .clamp(0.0, 1.0);
                  return VerticalDivider(
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Colors.white38.withOpacity(opacity));
                },
                customIconBuilder: (context, local, global) {
                  final text = nameList[local.index];
                  return Center(
                      child: Text(text,
                          style: GoogleFonts.poppins(
                              fontSize : 13,
                              fontWeight : FontWeight.w400,
                              letterSpacing :  0.3,
                              color: Color.lerp(Colors.black, Colors.white,
                                  local.animationValue))));
                },
                borderWidth: 1.0,
                onChanged: (i) => setState(() => _selectedIndex = i),
              ),
            ),
            SizedBox(height: 5,),
            ColorCustomText(textColor: _selectedIndex==0? CheckOutColor :_selectedIndex==1? presentsent_color : absent_color ,fontSize: font12, fontWeight: FontWeight.w500, text: _selectedIndex==0?"Waiting(655)":_selectedIndex==1?"Approved(100)":"Disapproved(100)", letterSpacing: 0.1),
            SizedBox(height: 5,),

            /// ------------------ third part ------------///
            Expanded(
              flex: 2,
              child: Container(
                width: 400,
                color: Main_Theme_WhiteCollor,
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: Container(
                    child: ListView.builder(
                      itemCount: 10,
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
                                    animatedheight=155;
                                    getindex="$index";
                                  }

                                });
                              },);

                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all( Radius.circular(7)),
                                //  color: Color(0xffF3FCFB)
                                color:  _selectedIndex==0? CheckOutColor.withOpacity(0.1) : presentsent_color.withOpacity(0.1),
                                border: Border(bottom: BorderSide( color: _selectedIndex==0? CheckOutColor : presentsent_color,))
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
                                    //  color: Color(0xffF3FCFB)
                                    //   color: CustomButtonColor.withOpacity(0.05),
                                    //  border: Border(bottom: BorderSide(color:_selectedindex==index?CustomButtonColor.withOpacity(0.05): CustomButtonColor))
                                  ),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(7),
                                              topRight: Radius.circular(7),
                                              bottomLeft: Radius.circular( selectedindex==index?0:7),
                                              bottomRight:Radius.circular( selectedindex==index?0:7),

                                            )
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child:  Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: CustomImageSction(height: 50, width: 50, radius: 1, image: "Assets/DrawerImage/testperson.png")
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "ID: 544532", letterSpacing: 0.3, textColor: CustomButtonColor.withOpacity(0.7),),
                                              Text("Hafijur Rahman Mizan",
                                                overflow: TextOverflow.ellipsis
                                                ,style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.3,
                                                ),),
                                              CustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "HR Manager", letterSpacing: 0.3,  ),
                                            ],
                                          )),
                                      SizedBox(width: 10,),
                                      // Expanded(
                                      //     flex: 4,
                                      //     child: Column(
                                      //       crossAxisAlignment: CrossAxisAlignment.center,
                                      //       mainAxisAlignment: MainAxisAlignment.center,
                                      //       children: [
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "CL-02", letterSpacing: 0.3, textColor: CustomButtonColor,),
                                      //           ],
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "From : " , letterSpacing: 0.3, textColor: Main_Theme_textColor,),
                                      //             CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "10 Apr 2023", letterSpacing: 0.3, ),
                                      //           ],
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "To : ", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                      //             CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "10 Apr 2023", letterSpacing: 0.3, ),
                                      //             SizedBox(width: 4,),
                                      //
                                      //           ],
                                      //         ),
                                      //
                                      //       ],
                                      //     )
                                      // ),
                                      ///----------------- Third Part ------------------------------///
                                      selectedindex==index? Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                                selectedindex==index  ?  AnimatedContainer(
                                  height: animatedheight,
                                  width: double.infinity,
                                  duration: Duration(milliseconds: 400),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 60),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Divider(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "02-Oct-2024 To 05-Oct-2024", letterSpacing: 0.3),
                                              CustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "Total : CL-05 Days", letterSpacing: 0.3),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          CustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Remarks", letterSpacing: 0.3),
                                          SizedBox(height: 5,),
                                          Container(
                                              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                border: Border.all(width: 1.5,color: Main_Theme_textColor.withOpacity(0.2))
                                              ),
                                              child: CustomText(maxLines:2,fontSize: 12, fontWeight: FontWeight.w400, text: "$Loremtext", letterSpacing: 0.2,textAlign: TextAlign.justify,)),
                                          SizedBox(height: 10,),
                                          ApprovedDisapprovedButton(onTap: () {

                                          }, disapproved: () {

                                          },)
                                        ],
                                      ),
                                    ),
                                  ) ,

                                ) :Container(),

                              ],
                            ),
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
  DateTime?  selected_pick_month=DateTime.now() ;
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate:  selected_pick_month ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2130),
      locale: localeObj,
    );

    if (selected != null) {
      setState(() {
        selected_pick_month = selected;

      });
    }
  }
}
