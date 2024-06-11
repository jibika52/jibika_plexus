import 'package:flutter/material.dart';

import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../Utils/constants.dart';

class HomeThirdPartBodyLeftSide extends StatelessWidget {
  HomeThirdPartBodyLeftSide({super.key,
  required this.top1,
  required this.top2,
  required this.top3,
  required this.top4,
  required this.color,
  });
  String top1;
  String top2;
  String top3;
  String top4;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "$top1", letterSpacing: 0.1, textColor: color,),
          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "$top2", letterSpacing: 0.1, textColor: color,),
          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "$top3", letterSpacing: 0.1, textColor: color,),
          ColorCustomText(fontSize: 11, fontWeight: FontWeight.w500, text: "$top4", letterSpacing: 0.1, textColor: color,),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
