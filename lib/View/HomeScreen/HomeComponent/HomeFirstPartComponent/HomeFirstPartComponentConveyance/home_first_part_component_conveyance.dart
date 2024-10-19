import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../../../CustomSelfWedget/ApprovedDisApprovedButton/approve_disapprove_button.dart';
import '../../../../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class HomeFirstPartComponentConveyance extends StatefulWidget {
  const HomeFirstPartComponentConveyance({super.key});

  @override
  State<HomeFirstPartComponentConveyance> createState() => _HomeFirstPartComponentConveyanceState();
}

class _HomeFirstPartComponentConveyanceState extends State<HomeFirstPartComponentConveyance> {
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
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Conveyance Approval"),),
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
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              padding:  EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 0),
              child: AnimatedToggleSwitch<int>.size(
                height: 35,
                current: max(_selectedIndex, 0),
                style: ToggleStyle(
                  backgroundColor: home_default_color,
                  indicatorColor:_selectedIndex==0? Main_Theme_textColor_tir_Condition :  presentsent_color  ,
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
            ColorCustomText(textColor: _selectedIndex==0? Main_Theme_textColor_tir_Condition :  presentsent_color ,fontSize: font12, fontWeight: FontWeight.w500, text: _selectedIndex==0?"Waiting(363)": "Approved(110)", letterSpacing: 0.1),
            SizedBox(height: 5,),
            /// ------------------ third part ------------///
            Expanded(
              flex: 2,
              child: Container(
                width: 400,
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
                                    selectedindex=-1;
                                  }else{
                                    animatedheight=200;
                                    getindex="$index";
                                  }

                                });
                              },);
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                               // color: _selectedIndex==0? Main_Theme_textColor_tir_Condition.withOpacity(0.2) :  presentsent_color.withOpacity(0.2)
                                color: Main_Theme_textColor.withOpacity(0.07),
                                border: Border(
                                  bottom: BorderSide(
                                    color: _selectedIndex==0? Main_Theme_textColor_tir_Condition :  presentsent_color,
                                    width: 2,
                                  ),
                                )
                              ),
                              margin: EdgeInsets.only(
                                bottom: 7,
                              ),
                              padding: EdgeInsets.all( 10),
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
                                          height: 68,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                topRight: Radius.circular(7),
                                                bottomLeft: Radius.circular( selectedindex==index?0:7),
                                                bottomRight:Radius.circular( selectedindex==index?0:7),

                                              )
                                          ),
                                          margin: EdgeInsets.only(right: 10),
                                          child:  Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(1.0),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: CustomImageSction(height: 50, width: 50, radius: 1, image: "Assets/DrawerImage/testperson.png")
                                                ),
                                              ),
                                              ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "54453", letterSpacing: 0.3,
                                                textColor:CustomButtonColor.withOpacity(0.7), ),

                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Hafijur Rahman Mizan",
                                                  overflow: TextOverflow.ellipsis
                                                  ,style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.3,
                                                  ),),
                                                CustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "HR Manager", letterSpacing: 0.3,  ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "Commercial", letterSpacing: 0.3,  ),
                                                  ],
                                                ),
                                                // ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Doj: 10-Oct-2024", letterSpacing: 0.3,
                                                //   textColor: CustomButtonColor.withOpacity(0.7),),
                                              ],
                                            )),
                                        SizedBox(width: 10,),

                                        ///----------------- Third Part ------------------------------///
                                        selectedindex==index? Icon(Icons.keyboard_arrow_up,size: 20, color: Main_Theme_textColor.withOpacity(0.6),):Icon(Icons.keyboard_arrow_down,size: 20, color: Main_Theme_textColor.withOpacity(0.6))
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 52,
                                        width: double.infinity,

                                        child: Row(
                                          children: [
                                            Column(   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24,fit: BoxFit.fill,
                                                //     color: Main_Theme_textColor),

                                                Icon(Icons.location_on_outlined,size: 24,color: Main_Theme_textColor.withOpacity(0.7)),
                                                SizedBox(height: 3,),
                                              //  ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Location"]??"${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["StreetName"]}"}", letterSpacing: 0.2,
                                                //  textColor: Main_Theme_textColor.withOpacity(0.7),),
                                               CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "banani", letterSpacing: 0.2),
                                                SizedBox(height: 6,),
                                              ],
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, j) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      top:14.5,
                                                      right: 2.5,
                                                      bottom: 36.8,
                                                    ),
                                                    width: 5,height:2,
                                                    color:  Main_Theme_textColor_tir_Condition,
                                                  );
                                                },),
                                            ),

                                            Expanded(
                                              child: ListView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, i) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      top:14.5,
                                                      left: 2.5,
                                                      bottom: 36.8,
                                                    ),
                                                    width: 5,height:2,
                                                    color:  Main_Theme_textColor_tir_Condition,
                                                  );
                                                },),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // Image.asset("Assets/DashBoardIcons/location.png",height: 24,width: 24, fit: BoxFit.fill,
                                                //     color: Main_Theme_textColor),
                                                Icon(Icons.location_on_outlined,size: 24,color: Main_Theme_textColor.withOpacity(0.7)),
                                                SizedBox(height: 3,),
                                                // ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Location"]??"${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["tStreetName"]}"}", letterSpacing: 0.2,
                                                //   textColor: Main_Theme_textColor.withOpacity(0.7),),
                                                CustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Gulshan", letterSpacing: 0.2),
                                                SizedBox(height: 6,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        child:   Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            //  Image.asset("Assets/DashBoardIcons/convence.png",height: 27,width: 40,fit: BoxFit.fill,
                                            Image.asset(

                                                "Assets/SelfIcon/helicopter.png"

                                                ,height: 40,width: 40,fit: BoxFit.fill,
                                                color: Main_Theme_textColor),
                                            ColorCustomText(fontSize: 10, fontWeight: FontWeight.w500, text: "", letterSpacing: 0.2,textColor: Main_Theme_textColor.withOpacity(0.7),),

                                          ],
                                        ),)
                                    ],
                                  ),
                                  Divider(
                                    height: 3,
                                    color: Main_Theme_textColor.withOpacity(0.1),
                                  ),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Distance"]??"coming soon"}", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                        // ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Total Amount : ${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Amount"]??"0"}", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                        //
                                        CustomText(fontSize: font12, fontWeight: FontWeight.w500, text: "10-Oct-2024", letterSpacing: 0.2),
                                        CustomText(fontSize: font12, fontWeight: FontWeight.w500, text: "Total Amount : 100", letterSpacing: 0.2),
                                      ],
                                    ),
                                  ),
                                  selectedindex==index  ?  Stack(
                                    children: [
                                      AnimatedContainer(
                                        height: animatedheight,
                                        width: double.infinity,
                                        duration: Duration(milliseconds: 400),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    //   ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Duration : ${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Hour"]??"0"} ${value.showConveyancelist[index]["dailyConveyancels"][dailyConveyancels]["Minute"]??"0"}", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Start : 10:10:30", letterSpacing: 0.2),
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "End : 11:10:30", letterSpacing: 0.2),
                                                    CustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "Duration : 01:00:00", letterSpacing: 0.2),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 2,),
                                              CustomText(fontSize: font13header, fontWeight: FontWeight.w400, text: "Purpose: ", letterSpacing: 0.2),
                                              Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(7),
                                                    border: Border.all(
                                                      color: Main_Theme_textColor.withOpacity(0.2),
                                                      width: 1.5
                                                    )
                                                  ),
                                                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: " dfsidu fsdfh something", letterSpacing: 0.2)
                                              ),
                                              SizedBox(height: 5,),
                                              CustomText(fontSize: font13header, fontWeight: FontWeight.w400, text: "Comments: ", letterSpacing: 0.2),
                                              Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(7),
                                                    border: Border.all(
                                                      color: Main_Theme_textColor.withOpacity(0.2),
                                                      width: 1.5
                                                    )
                                                  ),
                                                  child: SingleChildScrollView(child: CustomText(maxLines: 3,fontSize: 12, fontWeight: FontWeight.w400, text: " dfsidu fsdfh something gfusdygf usd djfhsd fsd fsd fhsdkfhskdh ahifhsdi fisd sdh f shdif hiscxvvxcv xcv xc cx vcx xcv xcv cxhdfishdif sdh fihdsi sid fisdhif sid fisdh fgusd gf ugsd  ufg sudgfu sdgfusgdfugsudgf", letterSpacing: 0.2))
                                              ),
                                              SizedBox(height: 10,),
                                              ApprovedDisapprovedButton(onTap: () {

                                              }, disapproved: () {

                                              },)
                                            ],
                                          ),
                                        ) ,

                                      ),

                                    ],
                                  ) :Container(),
                                ],)
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
