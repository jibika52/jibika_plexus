import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/PrivacyPolicyController/privacy_policy.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/CustomTextFromField/custom_text_from_fild.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Model/PrivacyPolicyModelClass/privacy_policy_model_class.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/OtpScreen/otp_screen.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  PrivacyPolicyScreen({super.key,
    required this.Package,
    required this.companytype,
    required this.companyname,
    required this.companyAddress,
    required this.noOfEmployee,
    required this.mobileNumber,
    required this.companyEmail,
    required this.password,
    required this.previous_route_name,
  });
  String ? previous_route_name;
  String ? Package;
  String ? companytype;
  String ? companyname;
  String ? companyAddress;
  String ?  noOfEmployee;
  String ? mobileNumber;
  String ? companyEmail;
  String ? password;
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool is_agree=false;
  bool obscureText=false;
  @override
  void initState() {
    Provider.of<PrivacyPolicyProvider>(context,listen: false).getPrivacyPolicyProvider("");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Rows> prvacyPolicylist=Provider.of<PrivacyPolicyProvider>(context).prvacyPolicylist;
    print("${prvacyPolicylist}");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          /// Custom Default App BAr
          child: CustomDefaultAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: "PRIVACY POLICY ${widget.mobileNumber}",
          )),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            color:Main_Theme_WhiteCollor,
            child: Consumer<PrivacyPolicyProvider>(
              builder: (context, value, child) {
               return ListView.builder(
                  itemCount: value.prvacyPolicylist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Main_Theme_WhiteCollor
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(fontSize: 14, fontWeight: FontWeight.w600, text: "${value.prvacyPolicylist[index].itemName}", letterSpacing: 0.32,fontStyle: FontStyle.italic,),
                          SizedBox(height: 10,),
                         // CustomText(fontSize: 13, fontWeight: FontWeight.w400, textAlign: TextAlign.justify,text: "Jibika Intelligic Ltd. (“us”, “we”, or “our”) operates www.jibikaplexus.com (hereinafter referred to as “Service”). Our Privacy Policy governs your visit to www.jibikaplexus.com, and explains how we collect, safeguard and disclose information that results from your use of our Service. We use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions. Our Terms and Conditions (“Terms”) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (“agreement”).", letterSpacing: 0.3)
                          CustomText(fontSize: 13, fontWeight: FontWeight.w400, textAlign: TextAlign.justify,text: "${Bidi.stripHtmlIfNeeded("${value.prvacyPolicylist[index].itemValue}")}", letterSpacing: 0.3)
                        ],
                      ),
                    );
                  },);
              },
            ),

          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                  left: 15,right: 15
              ),    padding: EdgeInsets.all(10),
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        is_agree=!is_agree;
                      });
                    },
                    child: Container(
                      color: Colors.white.withOpacity(0.0),
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        children: [
                          is_agree==false?    Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Main_Theme_textColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ):

                          CustomImageSction(height: 20, width: 20, radius: 50, image: "Assets/Icons/done_simble.png"),

                          SizedBox(width: 10,),
                          Expanded(
                              child:  Text("I Agree with Privacy-Police, and Teams-Conditions",style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400,letterSpacing: 0.4,
                                  color: Main_Theme_textColor,
                              ),))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomButton(onTap: () {
                    if(is_agree==false){
                    function();
                    }else{
                     CustomHttpRequestClass().sendOtpFunction(
                       "${widget.Package}",
                       context,
                       "${widget.mobileNumber}",
                       "${widget.companytype}",
                       "${widget.companyname}",
                        "${widget.companyAddress}",
                        "${widget.noOfEmployee}",
                         "${widget.companyEmail}",
                        "${widget.password}",
                        "${widget.previous_route_name}",
                     );
                    }

                  }, text: "Finish", button_text_fontSize: 14, fontWeight: FontWeight.w500,button_height: 50, custom_button_collor:is_agree==false?Colors.grey :CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  function(){}
}
