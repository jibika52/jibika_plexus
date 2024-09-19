
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/View/Auth/OtpScreen/otp_screen.dart';

import '../../../CustomWidget/CustomBootomSplashBar/custom_bootom_splash_bar.dart';
class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key,required this.phone});
  String phone;
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>

with SingleTickerProviderStateMixin {
late AnimationController controller;
late AnimationController logoanimathion;
late Animation<Offset> position;
late Animation logosize;
late Animation logoanimation;
late Animation logoanimation_text;
late Animation info_text;

@override
void initState() {
  GetStorage().write("val", "false");
  super.initState();
  controller =
      AnimationController(vsync: this, duration: Duration(milliseconds:2000 ));
  position = Tween<Offset>(begin: Offset(-0.0, 4.0), end: Offset.zero)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  logosize = Tween(begin: 0.0, end: 150.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  logoanimation = Tween(begin: 600.0, end: 120.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  controller.forward();
  controller.addListener(() {

    setState(() {

    });
  });

}

final _foromkey=GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _con_passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/LoginScreenIMG/loginpage1.jpg"),fit:BoxFit.fill)
          ),

          child: Stack(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                margin: EdgeInsets.only(top: h*0.36),
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _foromkey,
                    child: Column(
                      children: [
                        CustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "User mobile : ${widget.phone}", letterSpacing: 0.3),
                        SizedBox(
                          height: 20,
                        ),
                        JibikaCustomTextFromField(
                        readOnly: false,
                            suffixIcon: IconButton(
                                onPressed: () {
                                },
                                icon: Icon(Icons.visibility,)),
                            controller: _passwordController,
                            height: 50,
                            img: "Assets/Icons/lock.png",
                            hinttext: "Confirm Password",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(
                          height: 20,
                        ),
                        JibikaCustomTextFromField(
                        readOnly: false,
                            suffixIcon: IconButton(
                                onPressed: () {
                                },
                                icon: Icon(Icons.visibility,)),
                            controller: _con_passwordController,
                            height: 50,
                            img: "Assets/Icons/lock.png",
                            hinttext: "Confirm Password",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(
                          height: h*0.05,
                        ),
                        CustomButton(onTap: () {
                          if(_foromkey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(
                              package: "",
                                previous_route_name: "ForgetPassword",
                              companytype :"",
                              companyname:"",
                              companyAddress:"",
                              noOfEmployee:"",
                              mobileNumber:"01889173335",
                              companyEmail:"",
                              password:"",
                            ),));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: ColorCustomText(fontSize: 16, textColor: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, text: "Please fill all the field", letterSpacing: 0.3)));
                          }

                        }, text: "Submit", button_text_fontSize: 16, button_height: 50, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor,fontWeight: FontWeight.w500, borderRadius: 50),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: logoanimation.value,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'Assets/Logo/jibikalogo.png',
                      height: logosize.value,
                      width: logosize.value,
                    ),
                  )),
            ],
          )

        ),
        bottomNavigationBar: CustomBootomSplashBar(),
      ),
    );
  }
}
