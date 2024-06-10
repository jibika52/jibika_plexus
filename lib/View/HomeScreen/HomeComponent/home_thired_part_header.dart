import 'package:flutter/material.dart';

import '../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';
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
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.only(right: 10),
      height: 68 ,child: Row(
      children: [
        BarchatHeaderPart(
          name: "Payable",
          mony: '${widget.PayableMony}',
          parpose: "Manpower",
        ),
        Container(height: 50,width:1,color: Main_Theme_textColor.withOpacity(0.3),),
        BarchatHeaderPart(
          name: "Daily",
          mony: '${widget.DailyMony}',
          parpose: "Salary",
        ),
        Container(height: 50,width:1,color: Main_Theme_textColor.withOpacity(0.3),),
        BarchatHeaderPart(
          name: "Cumulative",
          mony: '${widget.CumulativeMony}',
          parpose: "Salary bd",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCalender(onTap: () {
                _select2Date(context);
              },),
              ColorCustomText(text: "$selected2Datee", fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.3,textColor: Main_Theme_textColor.withOpacity(0.6),)
            ],
          ),
        )
      ],
    ),
    );
  }
  int selected_index = 0;
  String selected2Datee = DateFormat.yMMM().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMM();
      setState(() {
        selected2Datee = df.format(picked);
        /// Date Wise Data filter here when we make  Api Call request///
        print(" Date Wise Data filter   when we make  Api Call request for Thired part header calender click ");
      });
    }
  }
}
