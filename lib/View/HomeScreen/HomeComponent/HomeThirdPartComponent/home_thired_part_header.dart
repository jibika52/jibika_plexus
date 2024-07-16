import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../Controller/HomeController/home_controller.dart';
import '../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';
import 'barchat_heder_part.dart';
import 'package:intl/intl.dart';

class HomeThiredPartHeader extends StatefulWidget {
  HomeThiredPartHeader({super.key, required this.PayableMony, required this.DailyMony, required this.CumulativeMony});
  String PayableMony;
  String DailyMony;
  String CumulativeMony;
  @override
  State<HomeThiredPartHeader> createState() => _HomeThiredPartHeaderState();
}

class _HomeThiredPartHeaderState extends State<HomeThiredPartHeader> {
  double animatwidth=60;
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return   Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          height: 68 ,child: Row(
          children: [
            BarchatHeaderPart(
              name: "Today",
              money: '${widget.PayableMony}',
              parpose: "Manpower",
            ),
            Container(height: 50,width:1,color: Main_Theme_textColor.withOpacity(0.3),),
            BarchatHeaderPart(
              name: "Today",
              money: '${widget.DailyMony}',
              parpose: "Salary",
            ),
            Container(height: 50,width:1,color: Main_Theme_textColor.withOpacity(0.3),),
            BarchatHeaderPart(
              name: "Cumulative",
              money: '${widget.CumulativeMony}',
              parpose: "Salary",
            ),
            Container(height: 50,width:1,color: Main_Theme_textColor.withOpacity(0.3),),
            SizedBox(width: 5,),
            Container(
              height: 68,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    topLeft: Radius.circular(11)
                ),
                color: Main_Theme_WhiteCollor,
              ),
              padding: EdgeInsets.symmetric(vertical: 6),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Stack(
              //       children: [
              //         CustomCalender(onTap: () {
              //           _select2Date(context);
              //         },),
              //
              //       ],
              //     ),
              //     ColorCustomText(text: "$selected2Datee", fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.3,textColor: Main_Theme_textColor.withOpacity(0.6),)
              //   ],
              // ),
            )
          ],
        ),
        ),
        Positioned(
            right: 5,
            bottom: 2,
            top:  1,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 75,
              width: animatwidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Main_Theme_WhiteCollor,
                  // border: Border.all(
                  //     color: Main_Theme_textColor.withOpacity(0.5),
                  //     width: 1
                  // )
              ),
              padding: EdgeInsets.only(left:15,right: 0,top: 5,bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _is_click_date=!_is_click_date;
                    if(_is_click_date==true){
                      if(w>530){
                        animatwidth=530;
                      }else{
                        animatwidth=w*0.90;
                      }
                    }else{
                      animatwidth=60.0;
                    }
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _is_click_date==false?
                    Container(
                      margin: EdgeInsets.only(right: 7),
                      child: ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "${monthList[selectedmonth]}  ", letterSpacing: 0.3,
                          textColor: Main_Theme_textColor),
                    ) :
                    Expanded(
                      child: ListView.builder(
                        itemCount: MonthList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                           "${monthList[index]}"=="" ?invalidfunction():   setState(() {
                                selectedmonth=index;
                                _is_click_date=!_is_click_date;
                                if(_is_click_date==true){
                                  animatwidth=w*0.95;
                                }else{
                                  animatwidth=60.0;
                                }
                              },);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 7.0),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  color:"${MonthList[index]}"==""?Main_Theme_WhiteCollor: home_default_color,
                                  borderRadius: BorderRadius.circular(7)),
                              padding: const EdgeInsets.only(right: 6.0,left: 6,top: 0),
                              child: Text("${MonthList[index]}",style: TextStyle(fontSize: 10),),
                            ),
                          ) ;
                        },),
                    ),
                    SizedBox(height: 1,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 18,
                        width: 50,
                        child: DropdownButtonHideUnderline(

                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              '${DateTime.now().year}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Main_Theme_textColor.withOpacity(0.6),
                                letterSpacing: 0.3
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                  color: Main_Theme_textColor.withOpacity(0.6),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                                animatwidth=60.0;
                                Provider.of<HomeProvider>(context,listen: false).dashboardBarChartDataProvider("${GetStorage().read("mobile_id")}", "${DateFormat('dd-MMMM-yyyy').format(DateTime.now())}","$selectedValue", context);
                              });
                            },

                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_downward,
                              ),
                              iconSize: 1,
                              iconEnabledColor: Main_Theme_WhiteCollor,
                            //  iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              elevation: 0,
                              scrollPadding: EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: Main_Theme_textColor.withOpacity(0.5),
                                      width: 1
                                  )
                              ),
                              direction: DropdownDirection.textDirection,
                              maxHeight: 200,
                              width: 70,
                              useRootNavigator: true,
                              padding: EdgeInsets.only(left: 2,right: 2),
                              offset:  Offset(   -20,  -6),
                              scrollbarTheme: ScrollbarThemeData(
                                radius:  Radius.circular(7),
                                trackBorderColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
                               // thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 17,
                        color: Main_Theme_textColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
  int selected_index = 0;


  final List<String> items = [
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
  ];
  String? selectedValue;
  double animatedheight=0;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  int selectedmonth=0;
  List MonthList=[
    "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","","",""
  ];
  invalidfunction (){}


}
