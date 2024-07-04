

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';

import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';

class BootomNavBarItemsMainFloationHomeScreen extends StatefulWidget {
  const BootomNavBarItemsMainFloationHomeScreen({super.key});

  @override
  State<BootomNavBarItemsMainFloationHomeScreen> createState() => _BootomNavBarItemsMainFloationHomeScreenState();
}

class _BootomNavBarItemsMainFloationHomeScreenState extends State<BootomNavBarItemsMainFloationHomeScreen> {
  double animatedheight=0;
  double animatwidth=117;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  int selectedmonth=0;
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomDefaultAppBar(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(),));
        }, text: "Employee"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container (
              height: 55,
              width: w,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 38,
                    width: 140,
                    padding: EdgeInsets.only(top: 2),
                    child:  Container(
                      height: 38,
                      child: AnimatedToggleSwitch<bool>.size(
                        current:_isActive ,
                        values: [false,true],
                        iconOpacity: 0.2,
                        indicatorSize: Size.fromWidth(100),
                        customIconBuilder: (context,local,global)=>
                            Text(local.value? "Inactive":"Active",style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color:Main_Theme_textColor,
                            ),),
                        borderWidth: 1.0,
                        iconAnimationCurve: Curves.linear,
                        selectedIconOpacity: 1.0,
                        onChanged: (value) => setState(() {
                          _isActive=!_isActive;
                        }),
                        styleBuilder: (b) => ToggleStyle(
                          borderColor: Main_Theme_textColor.withOpacity(0.5),
borderRadius: BorderRadius.circular(10),
                          backgroundColor: b ? Colors.white : Colors.white,
                          indicatorColor: b ? Colors.red : Colors.green,
                          indicatorBorderRadius: BorderRadius.circular(b ? 4.0 : 4.0),
                        ),

                      ),
                    )
                  ),

                  Positioned(
                    top: 0.9,
                      right: 0,
                      bottom: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 50,
                        width: animatwidth,

                        padding: EdgeInsets.only(left: 7,right: 7),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: Container(
                                  height: 55,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color:Color.fromRGBO(245, 245, 245, 1),
                                     border: Border.all(width: 2,color: Main_Theme_textColor.withOpacity(0.1))
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _is_click_date=!_is_click_date;
                                            if(_is_click_date==true){
                                              if(w>530){
                                                animatwidth=530;
                                              }else{
                                                animatwidth=w-13;
                                              }
                                            }else{
                                              animatwidth=117.0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10,right: 10
                                          ),
                                          height: 16,width: 16 ,
                                          child: CustomImageSction(height: 16, width: 16, radius: 1, image: "Assets/DashBoardIcons/searchnormal.png"),
                                        ),
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
                                                  contentPadding: EdgeInsets.only(bottom: 14),
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
                              height: 55,
                              width: 40,
                              margin: EdgeInsets.only(
                                  left: 10,right: 0
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical:2.95
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
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 7),
                width: 400,
                color: Main_Theme_WhiteCollor,
                child: Container(
                    child: ListView.builder(
                      itemCount: 10,
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
                                  borderRadius: BorderRadius.circular(7),

                                  color:  leave_color.withOpacity(0.05),
                                  //  border: Border(bottom: BorderSide(color:_selectedindex==index?CustomButtonColor.withOpacity(0.05): CustomButtonColor))
                                ),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 52,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(7))
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
                                                      image: DecorationImage(image: AssetImage("Assets/DrawerImage/testperson.png"),fit: BoxFit.fill)
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
                                            child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "544532", letterSpacing: 0.3,textColor: Main_Theme_WhiteCollor,),
                                          ),
                                          SizedBox(height: 3,),
                                          Text("Hafijur Rahman Mizan",
                                            overflow: TextOverflow.ellipsis
                                            ,style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.3,
                                            ),),
                                          SizedBox(height: 1,),
                                          CustomText(fontSize: 11, fontWeight: FontWeight.w300, text: "HR Manager", letterSpacing: 0.3,  ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),


                                    Container(
                                      height: 38,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Main_Theme_textColor_tir_Condition.withOpacity(0.7)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Track Now", letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
                                          SizedBox(width: 5,),
                                          Icon(Icons.arrow_forward_ios_rounded,size: 17,color: Main_Theme_WhiteCollor,),
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      },)
                ),
              ),
            )

          ],
        ),
      )
    );
  }
  bool  isActive=true;
  bool _isActive=false;

}
