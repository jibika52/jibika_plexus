 import 'dart:math' as math;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../CustomWidget/CustomImage/custom_image.dart';

class SelfBootomNavigatonJobCard extends StatefulWidget {
  const SelfBootomNavigatonJobCard({super.key});

  @override
  State<SelfBootomNavigatonJobCard> createState() => _SelfBootomNavigatonJobCardState();
}

class _SelfBootomNavigatonJobCardState extends State<SelfBootomNavigatonJobCard> {
  double animatedheight=0;
  double animatwidth=130;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  bool _is_tear_date=false;
  int selectedmonth=0;
  String? selectedValue;
  int key=0;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: home_default_color,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 132,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
              color: Main_Theme_WhiteCollor,

              child: Row(
                children: [
                  Container(
                    height: 117,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Main_Theme_textColor.withOpacity(0.1)
                      )
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 92, width: 126,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(7),
                               topRight: Radius.circular(7),
                             ),
                             image: DecorationImage(image: AssetImage("Assets/DashBoardIcons/man_picture.png"),fit: BoxFit.fill),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "ID : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                            CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "171045", letterSpacing: 0.3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          CustomText(fontSize: 13, fontWeight: FontWeight.w500,maxLines: 2,text: "Uzzal Biswas jsagfda as asg fa ", letterSpacing: 0.3,overflow: TextOverflow.ellipsis,),
                          SizedBox(height:4,),
                          Row(
                            children: [
                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Dep : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Finishing", letterSpacing: 0.3),
                            ],
                          ),
                          SizedBox(height:3,),
                          Row(
                            children: [
                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Deg : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Sr. Operator", letterSpacing: 0.3),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Age : ", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "25Y 8M", letterSpacing: 0.3),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
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
                          dataMap: {"P": 5, "A": 2, "L": 3, "H": 2,},
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 10,
                          chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300), // radius komay baray
                          colorList: [
                            presentsent_color, absent_color, holiday_color, leave_color
                          ],
                          initialAngleInDegree: 0,
                          ringStrokeWidth: -4,
                          baseChartColor: Colors.transparent,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: apps_div_margin,),
            Container (
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 42,
                    width: 120,
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
                            color: Main_Theme_WhiteCollor,
                            border: Border.all(
                                color: Main_Theme_textColor.withOpacity(0.7),
                                width: 1
                            )
                        ),
                        padding: EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
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
                                animatwidth=100.0;
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _is_click_date==false?  ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "${MonthList[selectedmonth]}", letterSpacing: 0.3,
                                  textColor: CustomButtonColor) :
                              Expanded(
                                child: ListView.builder(
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
                                            animatwidth=130.0;
                                          }
                                        },);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0,left: 5,top: 0),
                                        child: Text("${MonthList[index]}"),
                                      ),
                                    ) ;
                                  },),
                              ),
                              Container(
                                height: 12,
                                width: 1,
                                color: Main_Theme_textColor,
                                margin: EdgeInsets.only(left: 5,right: 7),
                              ),
                              Container(
                                height: 42,
                                width: 50,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: Text(
                                      '${DateTime.now().year}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Main_Theme_textColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: yearslist
                                        .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },

                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_downward,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Main_Theme_textColor,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      scrollPadding: EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          border: Border.all(
                                              color: Main_Theme_textColor.withOpacity(0.5),
                                              width: 1
                                          )
                                      ),
                                      direction: DropdownDirection.textDirection,
                                      maxHeight: 200,
                                      width: 65,
                                      useRootNavigator: true,
                                      padding: EdgeInsets.only(left: 2,right: 2),
                                      offset:  Offset( -3, -6),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius:  Radius.circular(11),
                                        trackBorderColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
                                        thickness: MaterialStateProperty.all<double>(6),
                                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                                      ),
                                    ), 
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              )


                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                width: double.infinity,
                color: Colors.red,
              );
            },))
          ],
        ),
      ),
    );
  }
}
