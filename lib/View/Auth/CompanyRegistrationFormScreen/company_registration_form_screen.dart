import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

import '../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({super.key});

  @override
  State<CompanyRegistrationScreen> createState() =>
      _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String countruyCode = '+88';
    bool is_check=true;

    TextEditingController _passwordController=TextEditingController();
    TextEditingController _phoneController=TextEditingController();
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          /// Custom Default App BAr
          child: CustomDefaultAppBar(
            onTap: () {},
            text: "Company sign up",
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 25,right: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:h*0.04),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 110,
                      width: 110,
                      color: CompanyProfileDefaultColor,
                      padding: EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        'Assets/svgImage/company_image.svg',
                        height: 67.0,
                        width: 67.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 1,left: 0.0,right: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("Assets/Icons/subtract.png"),fit: BoxFit.fill),
                        ),
                        height: 40,
                        width: 50,
          
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    left: 24.5,
                    right: 24.5,
                    child: Container(
                      margin:  EdgeInsets.only(bottom: 5,left:20.0,right: 20.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("Assets/Icons/regisrration_camer.png"),fit: BoxFit.fill),
                      ),
                      height: 15,
                      width: 10,
          
                    ),
                  ),
                ],
              ),
              SizedBox(height:h*0.02),
              JibikaCustomTextFromField(controller: _passwordController, height: 60, img: "Assets/Icons/lock.png", hinttext: "Company Name", keyboardType: TextInputType.text, obscureText: false),
          
              SizedBox(height:h*0.02),
              Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 8.0,top: 7),
                      child: Image.asset("Assets/Icons/lock.png",height: 22,width: 19,fit: BoxFit.fill,),
                    ),

                    
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                       //   border: Border.all(color:icons_green_color,width: 2),
                        ),
                        child: IgnorePointer(
                          ignoring: false,
                          child: DropdownButton(
                            enableFeedback: true,
                            autofocus: false,
                            isExpanded: true,
                            hint: InkWell(
                                onTap: () {}, child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Business Type", letterSpacing: 0.2,textColor:Main_Theme_textColor.withOpacity(0.4))),
                            // Not necessary for Option 1
                            value: busnessid,
                            onChanged: (newValue) {
                              setState(() {
                                busnessid = newValue.toString();
                              });
                            },
                            items: busnessidlist.map((location) {
                              return DropdownMenuItem(
                                child: Text("${location ??""}"),
                                value: "${location}",
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:h*0.01),
              JibikaCustomTextFromField(controller: _passwordController, height: 60, img: "Assets/Icons/lock.png", hinttext: "Number of Employee", keyboardType: TextInputType.text, obscureText: false),
              SizedBox(height:h*0.01),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    InkWell(

                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: Colors.white,
                              textStyle: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              bottomSheetHeight: 500,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: icons_green_color
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),

                            onSelect: (Country country) {

                              print('Select country: ${country.displayName}');
                              print('Select flagEmoji: ${country.flagEmoji}');

                              setState(() {
                                countruyCode =
                                '+${country.phoneCode}';
                              });
                            });
                      },

                      child: Padding(
                        padding: const EdgeInsets.only(top: 18,right: 10.0),
                        child: Container(
                          height: 60,
                          width: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(11),
                              bottomLeft: Radius.circular(11),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Image.asset("Assets/Icons/call.png",height: 20,width: 25,fit: BoxFit.fill,),
                              SizedBox(width: 20,),
                              Image.asset("Assets/Icons/bdflaf.png",height: 20,width: 28,fit: BoxFit.fill,),
                              SizedBox(width: 5,),
                              ColorCustomText(
                                textColor: Main_Theme_textColor.withOpacity(0.4),
                                  fontSize: 16, fontWeight: FontWeight.w500, text: "$countruyCode", letterSpacing: 0.2)

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            color: Main_Theme_textColor,
                            fontSize: 16,fontWeight: FontWeight.w500
                            ,letterSpacing: 0.2

                        ),
                        controller: _phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter  numbers only";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                              color: Main_Theme_textColor.withOpacity(0.4),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2
                          ),
                          hintStyle: GoogleFonts.poppins(
                              color: Main_Theme_textColor.withOpacity(0.4),
                              fontSize: 16,fontWeight: FontWeight.w400
                              ,letterSpacing: 0.2
                          ),
                          errorStyle: TextStyle(
                            fontSize: 0.1,
                          ),
                          labelText: "Mobile Number",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          /// prefix icon ///
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height:h*0.02),
              JibikaCustomTextFromField(controller: _passwordController, height: 60, img: "Assets/Icons/lock.png", hinttext: "Email", keyboardType: TextInputType.text, obscureText: false),
          
              SizedBox(height:h*0.02),
              JibikaCustomTextFromField(controller: _passwordController, height: 60, img: "Assets/Icons/lock.png", hinttext: "New Password", keyboardType: TextInputType.text, obscureText: false),
          
              SizedBox(height:h*0.02),
              JibikaCustomTextFromField(controller: _passwordController, height: 60, img: "Assets/Icons/lock.png", hinttext: "Confirm Password", keyboardType: TextInputType.text, obscureText: false),
              SizedBox(height:h*0.02),
              CustomButton(onTap: () {

              }, text: "Registration", button_text_fontSize: 16, button_height: 55, custom_button_collor: CustomButtomColor, button_text_color: Colors.white, borderRadius: 50)
          
            ],
          ),
        ),
        
      ),
    );
  }
  String ? busnessid;
  List busnessidlist=[
    "A",
    "B",
    "C"
  ];
}
