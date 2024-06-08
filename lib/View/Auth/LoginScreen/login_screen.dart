
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomCheckSection/custom_check_section.dart';
import 'package:jibika_plexus/CustomWidget/CustomSlideText/custom_slide_tex.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'package:jibika_plexus/View/Auth/OtpScreen/otp_screen.dart';
import 'package:marquee/marquee.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;
  late Animation logosize;
  late Animation logoanimation;
  late Animation logo_text_move;

  @override
  void initState() {

  super.initState();

Future.delayed(Duration(
  seconds: 3
),() {
  setState(() {
    GetStorage().write("val", "true");
    print("AAAAAAAAAAAAAAAAAAAAAAAAA");
  });
  controller =
      AnimationController(vsync: this, duration: Duration(milliseconds:2000 ));
  position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  logosize = Tween(begin: 60.0, end: 700.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

  logo_text_move = Tween(begin: 10.0, end:700.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  controller.forward();

  controller.addListener(() {
    setState(() {
      print("DDDDDDDDDDDDDDDD  ${logosize.value}");
    });
  });
},);

  }





  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countruyCode = '+88';
  String ? countryFlag;
  bool is_check=true;
  bool is_iconClick=false;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    print("cccccccccccccccccccccccccccccccc $countryFlag");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red.withOpacity(0.0),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: h*0.030),
              GetStorage().read("val")=="false"?Container():  Container(
                  width: logosize.value,
                  height: 35,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    ),
                    color:is_iconClick==false? Color(0xffE6E6E6):
                    Main_Theme_WhiteCollor
                    ,
                  ),
                  //    padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child:is_iconClick==false? Padding(
                          padding: const EdgeInsets.only(top:4.0),
                          child: Marquee(
                            text: 'Revolutionize Your Workforce Management with Our Jibika payscale Mobile App',
                            style: GoogleFonts.poppins(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,fontSize: 17,
                                color: Main_Theme_textColor
                            ),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 20.0,
                            velocity: 100.0,
                            pauseAfterRound: Duration(seconds: 1),
                            startPadding: 10.0,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 2),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ) :
                        Container(margin: EdgeInsets.symmetric(horizontal: 7),
                          height: 35,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                child: CustomButton(onTap: () {

                                }, text: "Info", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtomColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                              ),
                              SizedBox(width: 7,),
                              Container(
                                width: 120,
                                child: CustomButton(onTap: () {

                                }, text: "Contact Us", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtomColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                              )


                            ],
                          ),
                        )
                        ,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              is_iconClick=!is_iconClick;
                            });
                          },
                          child: CircleAvatar(radius: 18,backgroundColor: CustomButtomColor,backgroundImage: AssetImage("Assets/Icons/i_icon.png"),))
                    ],
                  ),
                ),

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
                                        countryFlag=country.flagEmoji;
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
                                      Image.asset("Assets/Icons/call.png",height: 22,width: 27,fit: BoxFit.fill,),
                                      SizedBox(width: 20,),
                                      countryFlag!=null?    CustomText(
                                          fontSize: 20, fontWeight: FontWeight.w500, text: "$countryFlag", letterSpacing: 0.2):
                                      Image.asset("Assets/Icons/bdflaf.png",height: 16,width: 22,fit: BoxFit.fill,),
                                      SizedBox(width: 5,),
                                      CustomText(
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
                                  hintStyle: GoogleFonts.poppins(
                                      color: Main_Theme_textColor.withOpacity(0.5),
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
                      SizedBox(height: h*0.03,),
                      JibikaCustomTextFromField(controller: _passwordController, height: 40, img: "Assets/Icons/lock.png", hinttext: "Password", keyboardType: TextInputType.text, obscureText: false),
                      //
                      // Container(
                      //   height: 40,
                      //   width: double.infinity,
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 18,right: 10.0),
                      //         child: Container(
                      //           height: 60,
                      //           width: 36,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(11),
                      //               bottomLeft: Radius.circular(11),
                      //             ),
                      //           ),
                      //           alignment: Alignment.center,
                      //           child: Row(
                      //             children: [
                      //               Image.asset("Assets/Icons/lock.png",height: 22,width: 19,fit: BoxFit.fill,),
                      //
                      //
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: TextFormField(
                      //           style: GoogleFonts.poppins(
                      //               color: Main_Theme_textColor,
                      //               fontSize: 16,fontWeight: FontWeight.w500
                      //               ,letterSpacing: 0.2
                      //
                      //           ),
                      //           controller: _passwordController,
                      //           validator: (value) {
                      //             if (value!.isEmpty) {
                      //               return "please enter  numbers only";
                      //             } else {
                      //               return null;
                      //             }
                      //           },
                      //           decoration: InputDecoration(
                      //             hintStyle: GoogleFonts.poppins(
                      //                 color: Main_Theme_textColor.withOpacity(0.5),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w400,
                      //                 letterSpacing: 0.2
                      //             ),
                      //             errorStyle: TextStyle(
                      //               fontSize: 0.1,
                      //             ),
                      //             hintText: 'Password',
                      //             contentPadding: EdgeInsets.symmetric(
                      //                 horizontal: 15, vertical: 5),
                      //             /// prefix icon ///
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //


                      SizedBox(height: h*0.05,),
                      /// Save information section & Forget Password section
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(

                                child: CustomSaveInfoSection()),
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
                      /// Login

                      CustomButton(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(
                          phone_or_email: _phoneController.text,
                        ),));
                      }, text: "Login", button_text_fontSize: 17, fontWeight: FontWeight.bold,button_height: 50, custom_button_collor: CustomButtomColor, button_text_color:Main_Theme_WhiteCollor, borderRadius: 50)
                    ],
                  ),
                ),
                SizedBox(height: h*0.061,),
                /// Forget Password section
                Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyRegistrationScreen(),));
                      },
                      child: CustomText(fontSize: 17, fontWeight: FontWeight.w500, text: "Register as a Company", letterSpacing: 0.2)),
                )   ,


                SizedBox(height: h*0.118,),

              ],
            ),
          ),

        ),

      ),
    );
  }
}



