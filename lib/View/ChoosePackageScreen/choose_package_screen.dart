import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';

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
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Choose Your Package")),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   padding: EdgeInsets.all(10),
      //   child:  ListView.builder(
      //     itemCount: head_text.length,
      //     itemBuilder: (context, index) => InkWell(
      //       onTap: () {
      //         showDialog(context: context, builder: (context) => AlertDialog(
      //           title: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Are you sure to buy...", letterSpacing: 0.3, textColor: CustomButtonColor.withOpacity(0.70),),
      //           content: Container(
      //             height: 100,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Center(child: CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "${head_text[index]}", letterSpacing: 0.3)),
      //                 SizedBox(height: 5,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "0-50 Employee can be enroll", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Monthly charge 30K", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Annual Charges  360K", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //               ],
      //             ),
      //           ),
      //           actions: [
      //           InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: Container(
      //               height: 30,
      //               width: 60,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 border: Border.all(color: absent_color,width: 1.5),
      //                 color: absent_color.withOpacity(0.05),
      //               ),
      //               alignment: Alignment.center,
      //               child: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "No", letterSpacing: 0.3),
      //             ),
      //           ),
      //           InkWell(
      //             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompanyRegistrationScreen(),)),
      //             child: Container(
      //               height: 30,
      //               width: 60,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 border: Border.all(color: CustomButtonColor,width: 1.5),
      //                 color: CustomButtonColor.withOpacity(0.05),
      //               ),
      //               alignment: Alignment.center,
      //               child: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Yes", letterSpacing: 0.3),
      //             ),
      //           ),
      //         ],
      //           ),
      //         );
      //       },
      //       child: Container(
      //       height: 100,
      //       width: double.infinity,
      //       padding: EdgeInsets.all(10),
      //       margin: EdgeInsets.only(bottom: 10),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         color: CustomButtonColor.withOpacity(0.1),
      //       ),
      //       child: Row(
      //         children: [
      //           //    CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/testperson.png"),
      //           Padding(
      //             padding: const EdgeInsets.only(right: 10.0),
      //             child: CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/industry.jpg"),
      //           ),
      //           Expanded(child: Container(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Center(child: CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "${head_text[index]}", letterSpacing: 0.3)),
      //                SizedBox(height: 5,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "0-50 Employee can be enroll", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Monthly charge 30K", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //                 CustomText(fontSize: font11, fontWeight: FontWeight.w500, text: "Annual Charges  360K", letterSpacing: 0.3,textAlign: TextAlign.left,),
      //               ],
      //             ),
      //           ),
      //           ),
      //           CustomImageSction(height: 50, width: 70, radius: 10, image: "Assets/Gif/click.gif")
      //         ],
      //       ),
      //               ),
      //     ),)
      // ),




      body: Container(
        height:double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyRegistrationScreen(
                Package: "50/month/employee",
              ),)),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Main_Theme_WhiteCollor,
                  border: Border.all(
                    color:CustomButtonColor.withOpacity(0.7),
                    width: 1.5
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 50,height: 10,),
                          ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Web & Mobile Application", letterSpacing: 0.3, textColor: absent_color),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.info_outline))
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            //color: Colors.red,
                            child: CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/industry.jpg"),
                          ),
                          Expanded(child: Container(
                            alignment: Alignment.center,
                           // color: Colors.green,
                            child: ColorCustomText(fontSize: 25, fontWeight: FontWeight.bold, text: "TK. 50/month", letterSpacing: 0.4, textColor:CustomButtonColor),
                          )),
                          Container(
                            height: 55,
                            width: 55,
                            alignment: Alignment.center,
                            child: IconButton(onPressed: () {
                            }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 25,)),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0 ,right: 8,),
                      child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w600, text: "Per Employee", letterSpacing: 0.3, textColor: Main_Theme_textColor_tir_Condition),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20,right: 20),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyRegistrationScreen(
                Package: "Customizable",
              ),)),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Main_Theme_WhiteCollor,
                  border: Border.all(
                    color:CustomButtonColor.withOpacity(0.7),
                    width: 1.5
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 50,height: 10,),
                          ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Web & Mobile Application", letterSpacing: 0.3, textColor: absent_color),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.info_outline))
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            //color: Colors.red,
                            child: CustomImageSction(height: image_height, width: image_height, radius: 10, image: "Assets/DrawerImage/industry.jpg"),
                          ),
                          Expanded(child: Container(
                            alignment: Alignment.center,
                           // color: Colors.green,
                            child: ColorCustomText(fontSize: 25, fontWeight: FontWeight.bold, text: "Customizable", letterSpacing: 0.4, textColor:CustomButtonColor),
                          )),
                          Container(
                            height: 55,
                            width: 55,
                            alignment: Alignment.center,
                            child: IconButton(onPressed: () {
                            }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 25,)),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0 ,right: 8,),
                      child: ColorCustomText(fontSize: 20, fontWeight: FontWeight.w600, text: "Contact us to get offer", letterSpacing: 0.3, textColor: Main_Theme_textColor_tir_Condition),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20,right: 20),
              ),
            ),

          ],
        ),
      ),


      bottomSheet: CustomBootomSplashBar(),
    );
  }
  List head_text=[
    "Small Industry",
    "Medium Industry",
    "Large Industry",
    "Small Corporate Industry",
    "Large Corporate Industry",
    "Industry",
  ];
}

