
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

class HomeFirstPartComponentLeave extends StatefulWidget {
 HomeFirstPartComponentLeave({super.key,required this.tag});
  String tag;
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
    return Hero(
      tag: widget.tag,
      child: Scaffold(
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
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10,right: 10
                                ),
                                height: 16,width: 16 ,
                                child: CustomImageSction2(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png",img_color: Main_Theme_textColor.withOpacity(0.5),),
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
                  ],
                ),
              ),
              SizedBox(height: 6,),
              /// ------------------ Calender part ------------///
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
                color: leave_approval_button_color,
                child: Stack(
                  children: [
                    Container(
                      height: 42,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          // color: Colors.red,
                          border: Border.all(
                              color: Main_Theme_textColor.withOpacity(0.15),
                              width: 1.5
                          )
                      ),
                      padding: EdgeInsets.only(left: 7,right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/share2.png"),
                          Container(
                            height: 20,
                            width: 1,
                            color: Main_Theme_textColor.withOpacity(0.3),
                          ),
                          CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/sms.png"),
                          Container(
                            height: 20,
                            width: 1,
                            color: Main_Theme_textColor.withOpacity(0.3),
                          ),
                          CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/pdf.png"),

                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 2,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 32,
                          width: animatwidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: leave_approval_button_color,
                              border: Border.all(
                                  color: Main_Theme_textColor.withOpacity(0.7),
                                  width: 1
                              )
                          ),
                          padding: EdgeInsets.all(7),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _is_click_date=!_is_click_date;
                                if(_is_click_date==true){
                                  animatwidth=w*0.95;
                                }else{
                                  animatwidth=100.0;
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _is_click_date==false?  ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "${MonthList[selectedmonth]}", letterSpacing: 0.3,
                                    textColor: CustomButtonColor) :
                                Expanded(child: ListView.builder(
                                  itemCount: MonthList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedmonth=index;
                                          _is_click_date=!_is_click_date;
                                          if(_is_click_date==true){
                                            animatwidth=w*0.95;
                                          }else{
                                            animatwidth=100.0;
                                          }

                                        },);


                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0,left: 5),
                                        child: Text("${MonthList[index]}"),
                                      ),
                                    ) ;
                                  },)),
                                Container(
                                  height: 12,
                                  width: 1,
                                  color: Main_Theme_textColor,
                                  margin: EdgeInsets.only(left: 5,right: 5),
                                ),
                                ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "2023", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),color: Main_Theme_textColor_tir_Condition.withOpacity(0.5)),
                padding:  EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                child: AnimatedToggleSwitch<int>.size(
                  height: 35,
                  current: max(_selectedIndex, 0),
                  style: ToggleStyle(
                    backgroundColor: home_default_color,
                    indicatorColor:_selectedIndex==0? Main_Theme_textColor_tir_Condition :_selectedIndex==1? presentsent_color : absent_color ,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                    indicatorBorderRadius: BorderRadius.circular(30),

                  ),
                  values:  [0, 1, 2],
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
              CustomText(fontSize: font12, fontWeight: FontWeight.w500, text: _selectedIndex==0?"Waiting : 655":_selectedIndex==1?"Approved : 100":"Disapproved : 100", letterSpacing: 0.1),


              /// ------------------ third part ------------///
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 400,
                  color: Main_Theme_WhiteCollor,
                  padding: EdgeInsets.only(
                    left: 10,right: 10
                  ),
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
                                      animatedheight=130;
                                      getindex="$index";
                                    }
      
                                  });
                                },);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(7)),
      
                                  // color:  CustomButtonColor.withOpacity(0.05),
                                  color: _selectedIndex==0? Main_Theme_textColor_tir_Condition.withOpacity(0.1) :_selectedIndex==1? presentsent_color.withOpacity(0.1) : absent_color.withOpacity(0.1),
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
      
                                       color:selectedindex==index?leave_color.withOpacity(0.1) : leave_color.withOpacity(0.05),
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
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                  ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "CL-02", letterSpacing: 0.3, textColor: CustomButtonColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "From : " , letterSpacing: 0.3, textColor: Main_Theme_textColor,),
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "10 Apr 2023", letterSpacing: 0.3, ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "To : ", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "10 Apr 2023", letterSpacing: 0.3, ),
                                                    SizedBox(width: 4,),
      
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
                                    margin: EdgeInsets.only(top: 7),
                                    height: animatedheight,
                                    width: double.infinity,
                                    duration: Duration(milliseconds: 400),
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            // Divider(),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 10),
                                            //   child: Row(
                                            //     children: [
                                            //       CustomImageSction(height: 18, width: 15, radius: 1, image: "Assets/DrawerImage/chat.png"),
                                            //       SizedBox(width: 10,),
                                            //       ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Gulshan Circle-1", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.6),),
                                            //     ],
                                            //   ),
                                            // ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Main_Theme_textColor.withOpacity(0.1)
                                                ),
                                              ),
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.all(7),
                                              child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$Loremtext", letterSpacing: 0.3,textAlign: TextAlign.justify,),
                                            ),
                                            SizedBox(height: 7,),
                                            Container(
                                              height: 40,
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
  List MonthList=[
    "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
  ];

}
