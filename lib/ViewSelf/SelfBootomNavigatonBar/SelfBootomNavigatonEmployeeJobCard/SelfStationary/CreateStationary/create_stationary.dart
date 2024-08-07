import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../../../CustomSelfWedget/MySelfCustomCalender/myself_custom_calender.dart';

class CreateStationaryScreen extends StatefulWidget {
  const CreateStationaryScreen({super.key});

  @override
  State<CreateStationaryScreen> createState() => _CreateStationaryScreenState();
}

class _CreateStationaryScreenState extends State<CreateStationaryScreen> {
  double margin=7;
  double height=40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context), text: "Create Stationary")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: home_default_color,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 345,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Main_Theme_WhiteCollor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "Stationery Entry", letterSpacing: 0.4),
                Divider(
                  color: Main_Theme_textColor.withOpacity(0.4),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 189,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: height,
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "RQ Date", letterSpacing: 0.3)),
                              SizedBox(height: margin,),
                              Container(
                                  height: height,
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Requisition item", letterSpacing: 0.3)),
                              SizedBox(height: margin,),
                              Container(
                                  height: height,
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Requisition Quantity", letterSpacing: 0.3)),
                              SizedBox(height: margin,),
                              Container(
                                  height: height,
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Configuration Details", letterSpacing: 0.3)),

                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyselfCustomCalender(datetext: "${selectedtoDatee}", width: double.infinity, height: height,onTap: () {
                                _selecttoDate(context);
                              },),
                              SizedBox(height: margin,),
                              Container(
                                  height: height,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Main_Theme_WhiteCollor,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: Main_Theme_textColor.withOpacity(0.3),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Enter item",
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(bottom: 10,left: 10)
                                    ),
                                  )
                              ),
                              SizedBox(height: margin,),
                              Container(
                                height: height,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Main_Theme_WhiteCollor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Main_Theme_textColor.withOpacity(0.3),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Enter Quantity",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(bottom: 10,left: 10)
                                  ),
                                )
                                ),
                              SizedBox(height: margin,),
                              Container(
                                height: height,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Main_Theme_WhiteCollor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Main_Theme_textColor.withOpacity(0.3),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter ",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(bottom: 10,left: 10)
                                  ),
                                )
                                ),

                            ],
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: Main_Theme_textColor.withOpacity(0.4),
                ),
                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 30,
                    width: 110,
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline_rounded,size: 20,color: CustomButtonColor,),
                        SizedBox(width: 7,),
                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Add more", letterSpacing: 0.3, textColor: CustomButtonColor)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CustomButtonColor.withOpacity(0.2)
                    ),
                    child: ColorCustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "Apply", letterSpacing: 0.3, textColor: CustomButtonColor)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  String selectedtoDatee = DateFormat('dd-MMMM-yyyy').format(DateTime.now()).toString();
  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedtoDatee) {
      final df = new DateFormat('dd-MMMM-yyyy');
      setState(() {
        selectedtoDatee = df.format(picked);
      });
    }
  }
}
