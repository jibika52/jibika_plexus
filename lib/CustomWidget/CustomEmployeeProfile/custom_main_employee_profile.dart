import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../CustomSelfWedget/ShareMessagePdf/share_message_pdf_summary.dart';
import '../../Utils/constants.dart';
import '../CustomImage/custom_image.dart';
import '../CustomText/custom_text.dart';

class customMainEmployeeProfile extends StatelessWidget {
  customMainEmployeeProfile({super.key,
    required this.image,
    required this.employeeCode,
    required this.employeeName,
    required this.employeeDesignation,
    required this.employeeDepartment,
    required this.birthday,
   required this.is_need_edit_button_on_short_profile,
  });
  String image;
  String employeeCode;
  String employeeName;
  String employeeDesignation;
  String employeeDepartment;
  String birthday;
  String is_need_edit_button_on_short_profile;


  double container_Radius=50.0;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(container_Radius),
              bottomRight: Radius.circular(container_Radius),
            ) ,
          ),
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(container_Radius),
                      bottomRight: Radius.circular(container_Radius),
                    ) ,
                    color: Colors.amberAccent,
                    gradient: LinearGradient(
                        colors: [
                      Main_Theme_textColor_tir_Condition,
                      Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                      Main_Theme_textColor_tir_Condition.withOpacity(0.7),
                      Main_Theme_textColor_tir_Condition.withOpacity(0.6),
                      Main_Theme_textColor_tir_Condition.withOpacity(0.5),
                      Main_Theme_textColor_tir_Condition.withOpacity(0.4),
                      Main_Theme_textColor_tir_Condition.withOpacity(0.3),
                      ]
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: presentsent_color,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomImageSctionNetwork(height: 84, width: 84, radius: 100, image:"$image"),
                              )
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Main_Theme_textColor.withOpacity(0.5),
                                      ),
                                      child:

                                      ColorCustomText(fontSize: fontTitle, fontWeight: FontWeight.w700, text: "$employeeCode",
                                        letterSpacing: 0.7, textColor: Main_Theme_WhiteCollor,),
                                    ),
                                    Spacer()
                                  ],
                                ),

                                SizedBox(height:2,),
                                ColorCustomText(fontSize: fontTitle, maxLines: 1,overflow:TextOverflow.ellipsis,fontWeight: FontWeight.w600, text: "$employeeName", letterSpacing: 0.5, textColor: Main_Theme_textColor,),
                                ColorCustomText(fontSize: fontSubTitle, fontWeight: FontWeight.w500, text: "${employeeDesignation}", letterSpacing: 0.5, textColor: Main_Theme_textColor,),

                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          is_need_edit_button_on_short_profile=="false"?Container(width: 2,): Container(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                                backgroundColor:  Main_Theme_textColor.withOpacity(0.5),
                                radius: 20,
                                child: new SvgPicture.asset("Assets/Employee_Profile_Icon/edit.svg",
                                  height: 18,
                                  width: 18,
                                  color: Main_Theme_WhiteCollor,
                                )
                            ),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),

                    Container(
                      height: 84,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:Main_Theme_WhiteCollor.withOpacity(0.2),
                      ),
                      child:   Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Dep : ", style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.7)),),
                              Text( "${employeeDepartment}",overflow: TextOverflow.ellipsis,maxLines: 1,
                                style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.9)),)

                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ColorCustomText(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                text: "Deg : ",
                                letterSpacing: 0.3,
                                textColor:
                                Main_Theme_textColor.withOpacity(0.8),
                              ),
                              Text("$employeeDesignation", style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.9)),)
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ColorCustomText(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                text: "BirthDay : ",
                                letterSpacing: 0.3,
                                textColor:
                                Main_Theme_textColor.withOpacity(0.8),
                              ),
                              Text("$birthday", style: customSubHeadingTextStyle(Main_Theme_textColor.withOpacity(0.9)),)
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 22,)
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            height: 45,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Main_Theme_WhiteCollor,
            ),
            child:  ShareMessagePdfPart(
              width: 170,
              is_share: true, onTap: () {
            }, is_messsage: true, onTap2message: () {
            }, is_pdf: true, onTap3pdf: () {
            },
            ),
          ),
        )
      ],
    );
  }
}
