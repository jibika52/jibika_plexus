import 'package:flutter/material.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Utils/constants.dart';

class MyselfCustomCalender extends StatelessWidget {
  MyselfCustomCalender({super.key,
    required this.datetext,
    required this.width,
    required this.height,
     this.onTap,
  });
  String datetext;
  double height;
  double width;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Main_Theme_WhiteCollor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ColorCustomText(fontSize: 11, fontWeight: FontWeight.w400, text: "$datetext", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.7),),
                )),
            Container(
              height: 30,
              width: 30,
              child: Image.asset("Assets/DashBoardIcons/clender_removebg.png",height: 25,width: 25,fit: BoxFit.fill,),
            ),

          ],
        ),
      ),
    );
  }
}
