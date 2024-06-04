
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomCheckSection/custom_check_section.dart';
import 'package:jibika_plexus/CustomWidget/CustomSlideText/custom_slide_tex.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:marquee/marquee.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countruyCode = '+88';
  bool is_check=true;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginbackground.jpg"),fit:BoxFit.fill)
          ),
          child: Column(
            children: [
              SizedBox(height: h*0.050),
              /// Text Slide
              CustomSlideTExt(text: "Revolutionize Your Workforce Management with Our Jibika payscale Mobile App"),
              SizedBox(
                height: h*0.28,
              ),
              /// Login Section
              Container(
                margin: EdgeInsets.only(left: w*0.090,right: w*0.09),
                width: double.infinity,
                child: Column(
                  children: [
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
                              padding: const EdgeInsets.only(top: 10,right: 10.0),
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
                                    Image.asset("Assets/Icons/call.png",height: 27,width: 27,fit: BoxFit.fill,),
                                    SizedBox(width: 20,),
                                    Image.asset("Assets/Icons/bdflaf.png",height: 20,width: 28,fit: BoxFit.fill,),
                                    SizedBox(width: 5,),
                                    CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "$countruyCode", letterSpacing: 0.2)

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
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
                                hintStyle: GoogleFonts.poppins(
                                    color: Main_Theme_textColor.withOpacity(0.5),
                                    fontSize: 16,fontWeight: FontWeight.w400
                                    ,letterSpacing: 0.2
                                ),
                                errorStyle: TextStyle(
                                  fontSize: 0.1,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: icons_green_color
                                  ),
                                ),
                                hintText: 'Mobile Number',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                /// prefix icon ///
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h*0.03,),

                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,right: 10.0),
                            child: Container(
                              height: 60,
                              width: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(11),
                                  bottomLeft: Radius.circular(11),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Image.asset("Assets/Icons/lock.png",height: 28,width: 24,fit: BoxFit.fill,),


                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter  numbers only";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: Main_Theme_textColor.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2
                                ),
                                errorStyle: TextStyle(
                                  fontSize: 0.1,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: icons_green_color
                                  ),
                                ),
                                hintText: 'Password',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                /// prefix icon ///
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h*0.05,),
                    /// Save information section & Forget Password section
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: CustomSaveInfoSection()),
                          Text("Forgot Password",
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                            fontSize: 16,fontWeight: FontWeight.w500,
                            color: Main_Theme_textColor.withOpacity(0.5),
                          ),)
                        ],
                      ),
                    ),
                     SizedBox(height: h*0.05,),
                    CustomButton(onTap: () {
                    }, text: "Login", button_text_fontSize: 17, fontWeight: FontWeight.bold,button_height: 50, custom_button_collor: Main_Theme_buttontextcolor, button_text_color:Main_Theme_SplashScreenColor, borderRadius: 50)
                  ],
                ),
              ),
              SizedBox(height: h*0.04,),
             /// Forget Password section
             Center(
               child: CustomText(fontSize: 17, fontWeight: FontWeight.w500, text: "Forget Password", letterSpacing: 0.2),
             )
            ],
          ),
        ),
      ),
    );
  }
}



