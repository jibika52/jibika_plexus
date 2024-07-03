import 'dart:async';
import 'package:dio/dio.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/CustomHttp/custom_http.dart';
import 'package:jibika_plexus/CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/LoginScreen/login_screen_screen2.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key,
    required this.package,
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
  String ? package;
  String ? companytype;
  String ? companyname;
  String ? companyAddress;
  String ?  noOfEmployee;
  String ? mobileNumber;
  String ? companyEmail;
  String ? password;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  String? _otp;
  void itmer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print("timeeeee  eee   e eee ${timer.tick}");
      if(timer.tick==120) {
        timer.cancel();
          count=119;
      }else{
        setState(() {
          count--;
        });
      }
    });
  }
@override
  void initState() {
  itmer();
  // TODO: implement initState
    super.initState();
  }
  int count=119;

  @override
  Widget build(BuildContext context) {
    final otp= Provider.of<CounterProvider>(context).setOTP;
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
print("1111111111111111111111111 ========== $count");
    return Scaffold(
      resizeToAvoidBottomInset: false,
         body: Container(
           height: double.infinity,
           width: double.infinity,
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginpage1.jpg"),fit: BoxFit.fill),
             color: Colors.white,
           ),
           child: Stack(
             children: [
               Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                 //  image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginpage1.jpg"),fit: BoxFit.fill),
                   color: Colors.white.withOpacity(0.0),
                 ),
               ),
               Positioned(
                 top: 0,
                 left: 0,
                 child: Container(
                   height: MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         SizedBox(height: h*0.13,),
                         /// Added Logo
                         CustomImageSction(height: 115, width: 115, radius: 7, image: "Assets/Logo/jibikalogo.png"),
                         SizedBox(height: h*0.12,),
                         CustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "Please Enter The 4 Digit Code Sent to", letterSpacing: 0.3),
                         CustomText(fontSize: 18, fontWeight: FontWeight.w600, text: "your Phone : ${widget.mobileNumber}", letterSpacing: 0.4),
                         SizedBox(height: h*0.02,),
                        // ColorCustomText(fontSize: 22, fontWeight: FontWeight.w700, text:"$count".contains("-")?"${count}": "Expire Time: $count s", letterSpacing: 0.4,textColor: Main_Theme_textColor_tir_Condition),
                         ColorCustomText(fontSize: 22, fontWeight: FontWeight.w700, text:"Expire Time: $count s", letterSpacing: 0.4,textColor: Main_Theme_textColor_tir_Condition),
                         SizedBox(height: h*0.01,),
                         ///  CustomPinPut
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             OtpInput(_fieldOne, false), // auto focus
                             OtpInput(_fieldTwo, false),
                             OtpInput(_fieldThree, false),
                             OtpInput(_fieldFour, false)
                           ],
                         ),
                         SizedBox(
                           height: h * 0.010,
                         ),
                         Container(
                             height: 60,
                             width: double.infinity,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 CustomText(fontSize: 16, fontWeight: FontWeight.w400, text:"If you didn’t receive a code!" , letterSpacing: 0.2),
                                 SizedBox(width: 8,),
                                 InkWell(
                                     onTap: () {
                                       if(count==119) {
                                         ElegantNotification(
                                           borderRadius: BorderRadius.circular(
                                               11),
                                           width: 340,
                                           iconSize: 25,
                                           background: presentsent_color,
                                           progressIndicatorBackground: presentsent_color,
                                           progressIndicatorColor: absent_color,
                                           // position: Alignment.center,
                                           title: ColorCustomText(fontSize: 16,
                                               fontWeight: FontWeight.w500,
                                               text: "Re send OTP successfully",
                                               letterSpacing: 0.3,
                                               textColor: Main_Theme_textColor),
                                           description: ColorCustomText(
                                               fontSize: 14,
                                               fontWeight: FontWeight.w400,
                                               text: "Please check your mobile number",
                                               letterSpacing: 0.3,
                                               textColor: Main_Theme_textColor),
                                           onDismiss: () {
                                             print(
                                                 'Message when the notification is dismissed');
                                           },
                                           icon: Icon(Icons.info_outlined,
                                             color: Colors.black,),
                                         ).show(context);
                                         CustomHttpRequestClass()
                                             .sendOtpFunction(
                                           "${widget.package}",
                                           context,
                                           "${widget.mobileNumber}",
                                           "${widget.companytype}",
                                           "${widget.companyname}",
                                           "${widget.companyAddress}",
                                           "${widget.noOfEmployee}",
                                           "${widget.companyEmail}",
                                           "${widget.password}",
                                           "resend",
                                         );
                                         itmer();
                                       }else{
                                         ElegantNotification(
                                           borderRadius: BorderRadius.circular(
                                               11),
                                           width: 340,
                                           iconSize: 25,
                                           background: presentsent_color,
                                           progressIndicatorBackground: presentsent_color,
                                           progressIndicatorColor: absent_color,
                                           // position: Alignment.center,
                                           title: ColorCustomText(fontSize: 16,
                                               fontWeight: FontWeight.w500,
                                               text: "Re send will be after time expire",
                                               letterSpacing: 0.3,
                                               textColor: Main_Theme_textColor),
                                           description: ColorCustomText(
                                               fontSize: 14,
                                               fontWeight: FontWeight.w400,
                                               text: "Please check your mobile number",
                                               letterSpacing: 0.3,
                                               textColor: Main_Theme_textColor),
                                           onDismiss: () {
                                             print(
                                                 'Message when the notification is dismissed');
                                           },
                                           icon: Icon(Icons.info_outlined,
                                             color: Colors.black,),
                                         ).show(context);
                                       }
                                      },
                                     child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w400, text:"Resend", letterSpacing: 0.2,textColor:CustomButtonColor)),
                               ],
                             )),
                         SizedBox(
                           height: h * 0.015,
                         ),
                         Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                           child: CustomButton(onTap: () {
                             setState(() {
                               _otp = _fieldOne.text +
                                   _fieldTwo.text +
                                   _fieldThree.text +
                                   _fieldFour.text;
                             });

                             Future.delayed(Duration(milliseconds: 500),() {
                               if(_otp==otp){
                                 CustomHttpRequestClass().companyRegistrationFunction(
                                   "${widget.package}",
                                   context,
                                   "${widget.mobileNumber}",
                                   "${widget.companytype}",
                                   "${widget.companyname}",
                                   "${widget.companyAddress}",
                                   "${widget.noOfEmployee}",
                                   "${widget.companyEmail}",
                                   "${widget.password}",
                                   "$_otp",
                                 );
                               }else{
                                 ElegantNotification(
                                   borderRadius: BorderRadius.circular(
                                       11),
                                   width: 340,
                                   iconSize: 25,
                                   background: presentsent_color,
                                   progressIndicatorBackground: presentsent_color,
                                   progressIndicatorColor: absent_color,
                                   // position: Alignment.center,
                                   title: ColorCustomText(fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                       text: "Wrong OTP",
                                       letterSpacing: 0.3,
                                       textColor: Main_Theme_textColor),
                                   description: ColorCustomText(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w400,
                                       text: "Please Enter Correct OTP",
                                       letterSpacing: 0.3,
                                       textColor: Main_Theme_textColor),
                                   onDismiss: () {
                                     print(
                                         'Message when the notification is dismissed');
                                   },
                                   icon: Icon(Icons.info_outlined,
                                     color: Colors.black,),
                                 ).show(context);
                               }
                             },);

                           }, text: "Verify", button_text_fontSize: 16, button_height: 50, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
                         ),
                         const SizedBox(
                           height: 30,
                         ),
                         // Display the entered OTP code
                         Text(
                           _otp ?? '',
                           style: const TextStyle(fontSize: 30),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
      /// Bootom Part
      bottomNavigationBar: CustomBootomSplashBar(),
    );
  }


//
//   final pinController = TextEditingController();
//   final focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   final focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
//   final fillColor = Color.fromRGBO(243, 246, 249, 0);
//
//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle:  TextStyle(
//       fontSize: 22,
//       color: Color.fromRGBO(30, 60, 87, 1),
//     ),
//     decoration: BoxDecoration(
//        border: Border(
//          bottom: BorderSide(
//            color: Main_Theme_textColor.withOpacity(0.5),
//            width: 1.5,
//          )
//        )
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//        double h=MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//                            /// Added Logo
//                            CustomImageSction(height: 100, width: 140, radius: 7, image: "Assets/Logo/jibikalogo.png"),
//                            SizedBox(height: h*0.16,),
//                            CustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "Please Enter The 4 Digit Code Sent to", letterSpacing: 0.3),
//                            CustomText(fontSize: 18, fontWeight: FontWeight.w700, text: "yourmail@gmail.com", letterSpacing: 0.4),
//               SizedBox(height: h*0.02,),
//
//               Row(
//                 children: [
//                   Spacer(),
//                   Pinput(
//                     controller: pinController,
//                     focusNode: focusNode,
//                     androidSmsAutofillMethod:
//                     AndroidSmsAutofillMethod.smsUserConsentApi,
//                     listenForMultipleSmsOnAndroid: true,
//                     defaultPinTheme: defaultPinTheme,
//                     length: 4,
//                     validator: (value) {
//                       return value;
//                     },
//                     // onClipboardFound: (value) {
//                     //   debugPrint('onClipboardFound: $value');
//                     //   pinController.setText(value);
//                     // },
//                     hapticFeedbackType: HapticFeedbackType.lightImpact,
//                     onCompleted: (pin) {
//                       debugPrint('onCompleted: $pin');
//                     },
//                     onChanged: (value) {
//                       debugPrint('onChanged: $value');
//                     },
//                     cursor: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 9),
//                           width: 100,
//                           height: 1,
//                           color: focusedBorderColor,
//                         ),
//                       ],
//                     ),
//                     focusedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                      //  border: Border.all(color: focusedBorderColor),
//                       ),
//                     ),
//                     submittedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: fillColor,
//                       ),
//                     ),
//                     errorPinTheme: defaultPinTheme.copyBorderWith(
//                       border: Border.all(color: Colors.redAccent),
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//               SizedBox(height: 15),
//              Padding(
//                padding: const EdgeInsets.all(28.0),
//                child: CustomButton(onTap: () {
//
//                }, text: "Confirm", button_text_fontSize: 16, button_height: 50, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 50),
//              )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
  f()async{
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    try{
      final response = await Dio().post('http://45.114.84.22:8081/useridentity/registration',
        data: {'aa': 'bb' * 22},
        onSendProgress: (int sent, int total) {
          print('$sent $total');
        },
      );
      print(response.data);
    }catch(e){
      print("errorrrrrrrrrrrrr $e");
    }
  }
 }




// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(5),
      height: 70,
      width: 70,
      child: TextField(
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: Main_Theme_textColor,
          fontWeight: FontWeight.w600
        ),
         autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          //  border: OutlineInputBorder(),
            counterText: '',
            hintStyle: GoogleFonts.poppins(color: Main_Theme_textColor, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

}