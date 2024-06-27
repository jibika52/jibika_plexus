
import 'dart:ui';

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

class HomeFirstPartComponentLeave extends StatefulWidget {
  const HomeFirstPartComponentLeave({super.key});

  @override
  State<HomeFirstPartComponentLeave> createState() => _HomeFirstPartComponentLeaveState();
}

class _HomeFirstPartComponentLeaveState extends State<HomeFirstPartComponentLeave> {
  int  selectedindex=0;
  double animatedheight=0;
  String ? getindex;
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
            Container(
              height: h*.06,
              width: double.infinity,
              padding: EdgeInsets.only(left:  10,right: 10,top: 5,bottom: 5),
              decoration: BoxDecoration(
                color: leave_approval_button_color,
              ),
              child: Consumer<CounterProvider>(
                builder: (context, value, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () {
                        if(index==0){
                          value.leave_waiting();
                        }
                       else if(index==1){
                          value.leave_approval();
                          print("ddddddddddddddddddddddddd");
                        }
                       else{
                          value.leave_Disapproval();
                        }


                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5)  ,
                      color:value.selectindex2==index? CheckOutColor:leave_approval_button_color,
                                      ),
                                      alignment: Alignment.center,
                                      width: w*0.3,
                                      child: ColorCustomText(text: "${Approvallist[index]}",textColor:value.selectindex2==index? Main_Theme_WhiteCollor :Main_Theme_textColor.withOpacity(0.6),fontWeight: FontWeight.w500,fontSize:14 ,letterSpacing: 0.3,),
                                    ),
                    ),),
              )
            ),
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
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Container(
                  height: 45,width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Main_Theme_textColor.withOpacity(0.1)
                  ),
                  margin: EdgeInsets.only(
                      top: 7,bottom: 7,left: 10,right: 10
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              value.clickIn();
                            },
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color:value.isCheckIn==true? CheckInColor:Main_Theme_textColor.withOpacity(0.01),
                              ),
                              alignment: Alignment.center,child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Check In (17)", letterSpacing: 0.3,textColor:value.isCheckIn==true? Main_Theme_WhiteCollor:Main_Theme_textColor.withOpacity(0.70),),
                            ),
                          )),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              value.clickout();
                              setState(() {
                                animatedheight=0;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color:value.isCheckIn==true?Main_Theme_textColor.withOpacity(0.01): CheckOutColor,
                              ),
                              alignment: Alignment.center,child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Check Out (11)", letterSpacing: 0.3,textColor:value.isCheckIn==true?Main_Theme_textColor.withOpacity(0.70): Main_Theme_WhiteCollor,),

                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
            /// ------------------ third part ------------///
            Expanded(
              child: Container(
                width: 400,
                color: Main_Theme_WhiteCollor,
                child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex=index;
                              animatedheight=0;
                              Future.delayed(Duration(milliseconds: 400),() {
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
                                      IconButton(onPressed: () {
                                      }, icon: selectedindex==index? Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down))

                                    ],
                                  ),
                                ),
                                selectedindex==index?
                                AnimatedContainer(
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
                                            height: 45,
                                            width: double.infinity,
                                            padding: EdgeInsets.only(left: 20,right: 20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: absent_color.withOpacity(0.3),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: absent_color
                                                        )
                                                    ),
                                                    child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Disapproved", letterSpacing: 0.3, textColor: absent_color),
                                                  ),
                                                ),


                                                SizedBox(width: 10,),
                                                Expanded(
                                                  child: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: CustomButtonColor.withOpacity(0.3),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: CustomButtonColor
                                                        )
                                                    ),
                                                    child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Approved", letterSpacing: 0.3, textColor: CustomButtonColor),
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

                                )

                                    :Container(),

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

  List Approvallist=[
    "Waiting","Approved","Disapproved"
  ];

}
