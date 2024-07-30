import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';

class CustomCalender extends StatefulWidget {
 CustomCalender({super.key,
  required this.width,
  required this.is_share,
  required this.onTap,
  required this.is_messsage,
  required this.onTap2message,
  required this.is_pdf,
  required this.onTap3pdf,
});
double width;
bool is_share;
final GestureTapCallback? onTap;
bool is_messsage;
final GestureTapCallback? onTap2message;
bool is_pdf;
final GestureTapCallback? onTap3pdf;


  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  double animatedheight=0;
  double animatwidth=130;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  bool _is_tear_date=false;
  int selectedmonth=0;
  String? selectedValue;
  int key=0;

  int  selectedindex=-1;
  String ? getindex;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return  Container (
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
        color: Main_Theme_WhiteCollor,
      ),
      child: Stack(
        children: [
          ShareMessagePdfPart(width: widget.width, is_share: widget.is_share, onTap: widget.onTap, is_messsage: widget.is_messsage, onTap2message: widget.onTap2message, is_pdf: widget.is_pdf, onTap3pdf: widget.onTap3pdf),
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
    ) ;
  }
}
