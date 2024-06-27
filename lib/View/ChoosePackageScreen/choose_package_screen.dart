import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class ChoosePackageScreen extends StatefulWidget {
  const ChoosePackageScreen({super.key});

  @override
  State<ChoosePackageScreen> createState() => _ChoosePackageScreenState();
}

class _ChoosePackageScreenState extends State<ChoosePackageScreen> {
  double image_height=70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Choose Your Package")),
      body: Container(
        height: double.infinity,
        width: double.infinity, 
        padding: EdgeInsets.all(10),
        child:  ListView.builder(
          itemCount: head_text.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                title: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Are you sure to buy...", letterSpacing: 0.3, textColor: CustomButtonColor.withOpacity(0.70),),
              actions: [
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: absent_color,width: 1.5),
                    color: absent_color.withOpacity(0.05),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "No", letterSpacing: 0.3),
                ),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: CustomButtonColor,width: 1.5),
                    color: CustomButtonColor.withOpacity(0.05),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Yes", letterSpacing: 0.3),
                ),
              ],
                ),
              );
            },
            child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomButtonColor.withOpacity(0.1),
            ),
            child: Row(
              children: [
                //    CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/testperson.png"),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/industry.jpg"),
                ),
                Expanded(child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "${head_text[index]}", letterSpacing: 0.3)),
                     SizedBox(height: 5,),
                      CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "0-50 Employee can be enroll", letterSpacing: 0.3,textAlign: TextAlign.left,),
                      CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Monthly charge 30K", letterSpacing: 0.3,textAlign: TextAlign.left,),
                      CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Annual Charges  360K", letterSpacing: 0.3,textAlign: TextAlign.left,),
                    ],
                  ),
                ))
              ],
            ),
                    ),
          ),)
      ),
    );
  }
  List head_text=[
    "Small Industry",
    "Large Industry",
    "Small Corporate Industry",
    "Large Corporate Industry",
    "Industry",
  ];
}

