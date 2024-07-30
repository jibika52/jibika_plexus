import 'package:flutter/material.dart';

import '../CustomWidget/CustomText/custom_text.dart';
import '../Utils/constants.dart';

class SelfProfileSummaryPart extends StatelessWidget {
  const SelfProfileSummaryPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      color: Main_Theme_WhiteCollor,
      child: Row(
        children: [
          Container(
            height: 110,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color: Main_Theme_textColor.withOpacity(0.1))),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                            "Assets/DashBoardIcons/man_picture.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorCustomText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: "ID : ",
                      letterSpacing: 0.3,
                      textColor:
                      Main_Theme_textColor.withOpacity(0.5),
                    ),
                    CustomText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "171045",
                        letterSpacing: 0.3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 170,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CustomText(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    text: "UZZAL KUMAR BISWAS ",
                    letterSpacing: 0.3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      ColorCustomText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "Dep : ",
                        letterSpacing: 0.3,
                        textColor:
                        Main_Theme_textColor.withOpacity(0.5),
                      ),
                      CustomText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          text: "Finishing",
                          letterSpacing: 0.3),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      ColorCustomText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "Deg : ",
                        letterSpacing: 0.3,
                        textColor:
                        Main_Theme_textColor.withOpacity(0.5),
                      ),
                      CustomText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          text: "Sr. Operator",
                          letterSpacing: 0.3),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      ColorCustomText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "Age : ",
                        letterSpacing: 0.3,
                        textColor:
                        Main_Theme_textColor.withOpacity(0.5),
                      ),
                      CustomText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          text: "25Y 8M",
                          letterSpacing: 0.3),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
