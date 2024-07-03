
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomCheckSection/custom_check_section.dart';
import 'package:jibika_plexus/CustomWidget/CustomSlideText/custom_slide_tex.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/CompanyRegistrationFormScreen/company_registration_form_screen.dart';
import 'package:jibika_plexus/View/Auth/ForgetPassword/forget_password_screen.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';
import 'package:jibika_plexus/View/Auth/OtpScreen/otp_screen.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:jibika_plexus/View/HomeScreen/home_screen.dart';
import 'package:marquee/marquee.dart';

import '../../SplashScreen/main_splash_pageview_screen.dart';

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
  String countruyCode = '+880';
  String ? countryFlag;
  bool is_check=true;
  bool is_iconClick=false;
  bool obscureText=true;
  String phone_number_test="001758098111";
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;


    if(phone_number_test.startsWith("00")){

      print("replesssssssssssss  ${phone_number_test.substring(1)}");
    }else{
      print("elseeeeeeeeeeeeeeeeee  $phone_number_test");
    }
    return WillPopScope(
      onWillPop: () {
       return Future(() => false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red.withOpacity(0.0),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: h*0.030),
                  GetStorage().read("val")=="false"?Container(height: 35):  Container(
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
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 7),
                              height: 35,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100,
                                    child: CustomButton(onTap: () {

                                       Navigator.push(context, MaterialPageRoute(builder: (context) => MainSplashPageViewScreen(),));
                                    }, text: "Info", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                                  ),
                                  SizedBox(width: 7,),
                                  Container(
                                    width: 120,
                                    child: CustomButton(onTap: () {

                                    }, text: "Contact Us", button_text_fontSize: 15, button_height: 35, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
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
                              child: CircleAvatar(radius: 18,backgroundColor: CustomButtonColor,backgroundImage: AssetImage("Assets/Icons/i_icon.png"),))
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
                                    padding: const EdgeInsets.only(top: 18),
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
                                  child: JibikaCustomTextFromField(
                                      is_phone: "login",controller: _phoneController, height: 50, img: " ",
                                      hinttext: "Mobile number", keyboardType: TextInputType.number, obscureText: false),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h*0.03,),
                          JibikaCustomTextFromField(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    obscureText == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Main_Theme_textColor.withOpacity(0.5),
                                  )),
                              controller: _passwordController,
                              height: 50,
                              img: "Assets/Icons/lock.png",
                              hinttext: "Password",
                              keyboardType: TextInputType.text,
                              obscureText: obscureText),


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
                                InkWell(
                                  onTap: () {
                                    if(_phoneController.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ColorCustomText(fontSize: 16,textColor: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, text: "Please Enter Your Phone Number", letterSpacing: 0.3)));
                                    }else{

                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(
                                      phone: _phoneController.text,
                                    ),));
                                  }
                                  }
                ,
                                  child: Text("Forgot Password",
                                    style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,fontWeight: FontWeight.w500,
                                      color: Main_Theme_textColor.withOpacity(0.8),
                                      letterSpacing: 0.3
                                    ),),
                                )
                              ],
                            ),
                          ),


                          SizedBox(height: h*0.05,),
                          /// Login

                          CustomButton(onTap: () {
                            if(_formKey.currentState!.validate()){
                              if(countruyCode=="+880"){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>  BootomNatchBarScreen(
                                // ),));

                                CustomHttpRequestClass().loginEmployee(_phoneController.text, _passwordController.text, context);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ColorCustomText(fontSize: 16, textColor: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, text: "wait", letterSpacing: 0.3)));

                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ColorCustomText(fontSize: 16, textColor: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, text: "Please fill all the field", letterSpacing: 0.3)));
                            }
                          }, text: "Login", button_text_fontSize: 17, fontWeight: FontWeight.bold,button_height: 50, custom_button_collor: CustomButtonColor, button_text_color:Main_Theme_WhiteCollor, borderRadius: 50)
                        ],
                      ),
                    ),
                    SizedBox(height: h*0.061,),
                    /// Forget Password section
                    Center(
                      child: InkWell(
                          onTap: () {
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyRegistrationScreen(),));
                          },
                      //    child: CustomText(fontSize: 17, fontWeight: FontWeight.w500, text: "Register as a Company", letterSpacing: 0.2)),
                          child: CustomText(fontSize: 17, fontWeight: FontWeight.w500, text: "", letterSpacing: 0.2)),
                    )   ,


                    SizedBox(height: h*0.118,),

                  ],
                ),
              ),
            ),

          ),

        ),
      ),
    );
  }
}



