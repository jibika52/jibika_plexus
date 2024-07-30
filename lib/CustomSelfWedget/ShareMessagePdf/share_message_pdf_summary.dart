import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class ShareMessagePdfPart extends StatelessWidget {
  ShareMessagePdfPart({super.key,
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
  Widget build(BuildContext context) {
    return  Container(
      height: 42,
      width: width,
      //120
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
          is_share?   InkWell(
              onTap: onTap,
              child: CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/share2.png")):Container(),
          is_share?  Container(
            height: 20,
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ):Container(),
          is_messsage?   InkWell(
              onTap: onTap2message,
              child: CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/sms.png")):Container(),
          is_pdf?  Container(
            height: 20,
            width: 1,
            color: Main_Theme_textColor.withOpacity(0.3),
          ):Container(),
          is_pdf? InkWell(
              onTap: onTap3pdf,
              child: CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/pdf.png")):Container(),


        ],
      ),
    );
  }
}
