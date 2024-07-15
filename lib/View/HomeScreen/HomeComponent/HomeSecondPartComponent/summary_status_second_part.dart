import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../Utils/constants.dart';
class SummaryStatusSecondPart extends StatelessWidget {
  SummaryStatusSecondPart({super.key,
    required this.CapitalTExt,
    required this.SmallTExt,
    required this.value,
    required this.backColor,
    required this.CapitaltextColor,

  });
  String CapitalTExt;
  String SmallTExt;
  String value;
  Color  backColor;
  Color CapitaltextColor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backColor,
      ),
      padding: EdgeInsets.only(
          left: 5
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  ColorCustomText(
                    text: "$CapitalTExt",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    textColor: CapitaltextColor,
                  ),
                  Padding(
                    padding:EdgeInsets.only(bottom: 2.5),
                    child: ColorCustomText(
                      text: "$SmallTExt",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                      textColor: Main_Theme_textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              )),
          Container(
             // flex: 3,
             // height: ,
            width: 65,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 18,
                    width: 1.8,
                    margin: EdgeInsets.only(bottom: 3),
                    color: Main_Theme_textColor.withOpacity(0.2),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: ColorCustomText(
                      text: "$value",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                      textColor:CapitaltextColor,
                    ),
                  ),
                  Spacer(),
                ],
              )),
        ],
      ),
    );
  }
}
