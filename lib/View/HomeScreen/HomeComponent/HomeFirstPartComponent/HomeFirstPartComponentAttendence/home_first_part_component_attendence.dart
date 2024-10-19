import 'dart:io';
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
import 'package:provider/provider.dart';

import '../../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';

class HomeFirstPartComponentAttendance extends StatefulWidget {
  const HomeFirstPartComponentAttendance({super.key});

  @override
  State<HomeFirstPartComponentAttendance> createState() => _HomeFirstPartComponentAttendanceState();
}

class _HomeFirstPartComponentAttendanceState extends State<HomeFirstPartComponentAttendance> {
  int  selectedindex=-1;
  int  _selectedIndex=0;
  double animatedheight=0;
  String ? getindex;
  List nameList=["CheckIn", "CheckOut"];
  @override
  Widget build(BuildContext context) {
    final isChekin=Provider.of<CounterProvider>(context).isCheckIn;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),child: CustomDefaultAppBar(onTap: () {
          Navigator.pop(context);
      }, text: "Attendance Approval"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
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

            /// ------------------ Second part ------------///
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),color: Main_Theme_textColor_tir_Condition.withOpacity(0.0)),
              padding:  EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 0),
              child: AnimatedToggleSwitch<int>.size(
                height: 35,
                current: max(_selectedIndex, 0),
                style: ToggleStyle(
                  backgroundColor: home_default_color,
                  indicatorColor: presentsent_color,
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
            CustomText(fontSize: fontSubTitle, fontWeight: FontWeight.w500, text: _selectedIndex==0?"CheckIn 655":"CheckOut 100", letterSpacing: 0.1),
            /// ------------------ third part ------------///
           Expanded(
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
                               animatedheight=270;
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
                           color:isChekin==false?  CheckOutColor.withOpacity(0.08) : CustomButtonColor.withOpacity(0.05),
                           border: Border(bottom: BorderSide( color:isChekin==false?CheckOutColor:  CustomButtonColor))
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
                               child: Stack(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(1.0),
                                     child: ClipRRect(
                                         borderRadius: BorderRadius.circular(100),
                                         child: CustomImageSction(height: 50, width: 50, radius: 1, image: "Assets/DrawerImage/testperson.png")
                                     ),
                                   ),
                                   selectedindex==index || getindex==0? Container():  Positioned(
                                       right: 0,
                                       child: CustomImageSction(height: 18, width: 15, radius: 1, image: "Assets/DrawerImage/chat.png"))

                                 ],
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
                               Expanded(
                                   flex: 4,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Row(
                                         children: [
                                           CustomImageSction(height: 12, width: 15, radius: 1, image: "Assets/DrawerImage/location.png"),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Gulshan Circle-1", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                         ],
                                       ),
                                       Divider(
                                         height: 10,
                                       ),
                                       Row(
                                         children: [
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text:isChekin==false?"Check Out": "Check In", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                           SizedBox(width: 10,),
                                           CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "08:25:00", letterSpacing: 0.3, ),
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text:isChekin==false?"Early" :"Late", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                           SizedBox(width: 5,),
                                           CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "25:00", letterSpacing: 0.3, ),
                                           SizedBox(width: 4,),

                                           isChekin==false?  Container(height: 10,width: 1,color: Main_Theme_textColor,):Container(),
                                           SizedBox(width: 4,),

                                           isChekin==false? Row(
                                             children: [
                                               ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text:"OT", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                               SizedBox(width: 5,),
                                               CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "25:00", letterSpacing: 0.3, ),
                                             ],
                                           ):Container(),

                                         ],
                                       ),

                                     ],
                                   )
                               ),
                               ///----------------- Third Part ------------------------------///
                                selectedindex==index? Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down)
                             ],
                           ),
                         ),
                             selectedindex==index  ?  AnimatedContainer(
                             height: animatedheight,
                             width: double.infinity,
                             duration: Duration(milliseconds: 400),
                             child: Container(
                               child: SingleChildScrollView(
                                 child: Column(
                                   children: [
                                     Divider(),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 10),
                                       child: Row(
                                         children: [
                                           CustomImageSction(height: 18, width: 15, radius: 1, image: "Assets/DrawerImage/chat.png"),
                                           SizedBox(width: 10,),
                                           ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Gulshan Circle-1", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                         ],
                                       ),
                                     ),
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(7),
                                         border: Border.all(
                                             width: 1,
                                             color: Main_Theme_textColor.withOpacity(0.1)
                                         ),
                                       ),
                                       padding: EdgeInsets.all(10),
                                       child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$Loremtext", letterSpacing: 0.3,textAlign: TextAlign.justify,),
                                     ),
                                     SizedBox(height: 7,),
                                     Container(
                                       height: 35,
                                       width: MediaQuery.of(context).size.width,
                                       padding: EdgeInsets.only(left: 20,right: 20),
                                       child: Row(
                                         children: [
                                           Expanded(
                                             child: Container(
                                               height: 35,
                                               width: double.infinity,
                                               alignment: Alignment.center,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: absent_color.withOpacity(1.0),
                                                   border: Border.all(
                                                       width: 1,
                                                       color: absent_color
                                                   )
                                               ),
                                               child:  CustomText(fontSize: 14, fontWeight: FontWeight.w600, text: "Disapproved",
                                                   letterSpacing: 0.3),
                                             ),
                                           ),


                                           SizedBox(width: 10,),
                                           Expanded(
                                             child: Container(
                                               height: 35,
                                               width: double.infinity,
                                               alignment: Alignment.center,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: presentsent_color.withOpacity(1.0),
                                                   border: Border.all(
                                                       width: 1,
                                                       color: CustomButtonColor
                                                   )
                                               ),
                                               child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w600, text: "Approved",
                                                   letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                     SizedBox(height: 10,),
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
