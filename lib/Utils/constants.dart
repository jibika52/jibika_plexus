










import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const Main_Theme_textColor = Color(0xff333333);
const Main_Theme_textColor_tir_Condition = Color(0xffACC027);


/// Attendance Check out color
const CheckOutColor = Color(0xffEEAF61);
const CheckInColor = CustomButtonColor;


/// All text white color
const Main_Theme_WhiteCollor = Color(0xffffffff);
const th3_CustomButtonColor = Color(0xffD4EDE7);

/// for TextFormField //
const icons_orrange_color = Color(0xff59DBEB);

/// textfield border color
const icons_green_color = Color(0xffd2dfe1);
const textFieldBoarderColorC = Color(0xffeb59a2);
const notification_color = Color(0xffEC4F4F);

///  Button color ///

//  const CustomAppbarColor = Color(0xff267862);
const CustomAppbarColor = Color(0xff075744);

const CustomButtonColor = CustomAppbarColor;
/// Company Profile default Color
const CompanyProfileDefaultColor = Color(0xffE6E6E6);

const home_default_color = Color(0xffF2F2F2);





 ///--------------Dashboard leave absent holidays count ------------------------///
// Color presentsent_color=Color(0xff88DB2E);
Color presentsent_color=Color(0xff16be16);
Color absent_color=Color(0xffEC4F4F);
Color leave_color=Color(0xff685CF0);
Color leave_approval_button_color=Color(0xffe7edbf);
 //  Color holiday_color=Color(0xff2C928C);
Color holiday_color=Color(0xffF9E400);
Color pending_color=Color(0xffE48E29);


///--------------- Custom TExt font size -----------------------///

late double  d_height;
late double  d_width;

const font11=11.0;
const font12header=13.0;
const font13header=13.0;
const font13=13.0;
const font14=14.0;
const font15=15.0;
const font16=16.0;
const font18=18.0;
const font19=19.0;
const font20=20.0;

///---------------- Tab height --------------------- ///
   const apps_div_margin=10.0;

/// ----------- Custom Month List -----------------------///

List MonthList= [
 "Jan",
 "Feb",
 "Mar",
 "Apr",
 "May",
 "Jun",
 "Jul",
 "Aug",
 "Sep",
 "Oct",
 "Nov",
 "Dec",
];


final List<String> yearslist = [
 '2022',
 '2023',
 '2024',
 '2025',
 '2026',
 '2027',
 '2028',
 '2029',
];


String Loremtext="Lorem sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum smahfb asfa ufusdgfu sdu fsudg fusg";


//  GetStorage().write("mobile_id","${_phoneController.text}") ;
//  GetStorage().write("id_token",loginData["loginData"]) ;
//  GetStorage().write("refresh_token",loginData["refresh_token"]) ;

// GetStorage().write("id_token",loginData["id_token"]) ;
// GetStorage().write("refresh_token",loginData["refresh_token"]) ;
// GetStorage().write("Company_name",loginData["Company"]) ;
// GetStorage().write("RfIdCardNo",loginData["RfIdCardNo"]) ;
// GetStorage().write("IdCardNo",loginData["IdCardNo"]) ;
// GetStorage().write("Empcode",loginData["Empcode"]) ;
// GetStorage().write("user_type_id",loginData["user_type_id"]) ; (get management / employee / admin (1001,1002,1003))
// GetStorage().write("APPS_IMG_BASEURL",loginData["AppsBaseUrl"]) ;
// GetStorage().write("APPS_IMG_BASEURL",loginData["AppsBaseUrl"]) ;
// GetStorage().write("APPS_IMG_Path",loginData["PhotoPath"]) ;
//  GetStorage().write("APPS_User_Name",loginData["user_name"]) ;
// GetStorage().write("APPS_User_ID_Card_No",loginData["id_card_no"]) ;
// GetStorage().write("SHIFT_IN_TIME", i.SHIFT_IN_TIME);
// GetStorage().write("SHIFT_OUT_TIME", i.SHIFT_OUT_TIME);
// GetStorage().write("ATTENDANCE_START_TIME", i.ATTENDANCE_START_TIME);
// GetStorage().write("ATTENDANCE_Status", i.Status);
// GetStorage().write("IsTrack", "${self_OR_Admin_Short_Description["IsTrack"]}");
// GetStorage().write("is_Start_Journey","false");
// GetStorage().write("select_conveyance", "");
// GetStorage().write("for_end_conveyance_code","0");
// GetStorage().write("conveyance_car_code","0");
// GetStorage().write("for_create_empcode","empcode");



















class FitnessAppTheme {
 FitnessAppTheme._();
 static const Color nearlyWhite = Color(0xFFFAFAFA);
 static const Color white = Color(0xFFFFFFFF);
 static const Color background = Color(0xFFF2F3F8);
 static const Color nearlyDarkBlue = Color(0xFF2633C5);

 static const Color nearlyBlue = Color(0xFF00B6F0);
 static const Color nearlyBlack = Color(0xFF213333);
 static const Color grey = Color(0xFF3A5160);
 static const Color dark_grey = Color(0xFF313A44);

 static const Color darkText = Color(0xFF253840);
 static const Color darkerText = Color(0xFF17262A);
 static const Color lightText = Color(0xFF4A6572);
 static const Color deactivatedText = Color(0xFF767676);
 static const Color dismissibleBackground = Color(0xFF364A54);
 static const Color spacer = Color(0xFFF2F2F2);
 static const String fontName = 'Roboto';

 static const TextTheme textTheme = TextTheme(
  headline4: display1,
  headline5: headline,
  headline6: title,
  subtitle2: subtitle,
  bodyText2: body2,
  bodyText1: body1,
  caption: caption,
 );

 static const TextStyle display1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 36,
  letterSpacing: 0.4,
  height: 0.9,
  color: darkerText,
 );

 static const TextStyle headline = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.27,
  color: darkerText,
 );

 static const TextStyle title = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0.18,
  color: darkerText,
 );

 static const TextStyle subtitle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: -0.04,
  color: darkText,
 );

 static const TextStyle body2 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.2,
  color: darkText,
 );

 static const TextStyle body1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: -0.05,
  color: darkText,
 );

 static const TextStyle caption = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.2,
  color: lightText, // was lightText
 );
}
