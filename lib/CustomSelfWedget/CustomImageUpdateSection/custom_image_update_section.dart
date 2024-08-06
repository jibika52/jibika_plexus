import 'package:flutter/material.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../Utils/constants.dart';

class CustomImageUpdateScetion extends StatelessWidget {
   CustomImageUpdateScetion({super.key,
   required this.image,
   required this.heddintext,
   required this.Browse_file,
   required this.is_lasttext,

   });
String image;
String heddintext;
String Browse_file;
bool is_lasttext=false;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 139,
      width: 139,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "$heddintext", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
          Container(
            height: 80,
            width: 146,
            margin: EdgeInsets.only(top: 5,bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: presentsent_color.withOpacity(0.4)),
              // color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("$image",height: 31,width: 45,fit: BoxFit.fill,),
                ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "$Browse_file", letterSpacing: 0.1, textColor: presentsent_color),
              ],
            ),
          ),
          ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Accepted File Types: .jpeg and .png", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

        ],
      ),
    ) ;
  }
}

class CustomImageUpdateScetion2 extends StatelessWidget {
   CustomImageUpdateScetion2({super.key,
   required this.image,
   required this.heddintext,
   required this.width,
   required this.height,

   });
String image;
String heddintext;
double width;
double height;
  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 120,
      width: 139,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w400, text: "$heddintext", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
          Container(
            height: 80,
            width: 129,
            margin: EdgeInsets.only(top: 5,bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: presentsent_color.withOpacity(0.4)),
              // color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("$image",height: height,width: width,fit: BoxFit.fill,),
              ],
            ),
          ),

        ],
      ),
    ) ;
  }
}
