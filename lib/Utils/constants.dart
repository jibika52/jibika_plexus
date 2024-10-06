











import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:karmm_callkit/karmm_callkit.dart';
import 'package:web_socket_channel/io.dart';

import '../ViewSelf/SelfBootomNavigatonBar/BackgroundTrackingApiModelClass/background_tracking_api_modelclass.dart';
import '../ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import '../main.dart';

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

const fontSubTitle=14.0;
const font15=15.0;
const fontTitle=16.0;
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


 LinearGradient customGradientBackground() {
  return LinearGradient(
   colors: [
     Main_Theme_textColor_tir_Condition.withOpacity(0.5), CustomButtonColor.withOpacity(0.7),],
  );
 }

/// Title text Style------------------------------------------------------------------
 TextStyle customHeadingTextStyle(Color  ? color) {
  return GoogleFonts.roboto(
   fontSize: fontTitle,
   fontWeight: FontWeight.bold,
   color: color,
   letterSpacing:0.4
  );
 }

/// SubTitle text Style------------------------------------------------------------------
 TextStyle customSubHeadingTextStyle(Color  ? color) {
  return GoogleFonts.roboto(
   fontSize: fontSubTitle,
   fontWeight: FontWeight.bold,
   color: color,
   letterSpacing:0.4
  );
 }

 /// Socket add and connect
socketFunction()async {
 final headers = {
  "Origin":"http://45.114.84.22:8081",
  "Sec-WebSocket-Protocol":"jibika-ws.json"
 };
 // showNotification();
 print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
 final wsUrl = Uri.parse('ws://45.114.84.22:8081/jsocket');
 print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
 // final channel = WebSocketChannel.connect(
 //     wsUrl,
 //     headers,
 //  protocols:
 //
 // );

 final channel = await connectWebSocketWithHeaders(wsUrl, headers);

 print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");

 await channel.ready;
 print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");

 channel.stream.listen((message) {
  print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE ${message.toString()}");
  var notification=jsonDecode(message);
  showNotification( notification["message"]);
  _playRingtone("Assets/SoundAlert/messagealert.mp3");
  Future.delayed(Duration(milliseconds: 700),() {
   _stopRingtone();
  },);
  // Provider.of<CounterProvider>(context,listen: false).setNotificationCounterFunction(message);
  //   channel.sink.close(status.goingAway);
 });
}

connectWebSocketWithHeaders(Uri wsUrl, Map<String, String> headers)
 async {
  // Use the dart:io WebSocket with headers
  final WebSocket socket = await WebSocket.connect(
   wsUrl.toString(),
   headers: headers,
  );

  // Pass the WebSocket to IOWebSocketChannel
  return IOWebSocketChannel(socket);

}





/// -------------- Custom Alert function ----------------------------------
customNotification(BuildContext context,String text1,String text2){
 ElegantNotification(
  borderRadius: BorderRadius.circular(11),
  width: 340,
  iconSize: 25,
  background: presentsent_color,
  progressIndicatorBackground: presentsent_color,
  progressIndicatorColor: absent_color,
  // position: Alignment.center,
  title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "$text1", letterSpacing: 0.3, textColor: Main_Theme_textColor),
  description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "${text2}", letterSpacing: 0.3, textColor: Main_Theme_textColor),
  onDismiss: () {
   print('Message when the notification is dismissed');
  }, icon: Icon(Icons.delete_forever,color:Colors.black,),
 ).show(context);
}



/// Background processing is running form here below now check the code-----------------------------------------------------------------------------------
void   startService() async {
 await initializeService();
}
void stopService() {
 service.invoke("stopService");
}
void initCallPushListeners() {
 ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);
 ConnectycubeFlutterCallKit.instance.init(
 );
}
void initCallPush() {
 print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz---------------1------------------------");
 ConnectycubeFlutterCallKit.getLastCallId().then((value) {
  ConnectycubeFlutterCallKit.reportCallEnded(sessionId: value);
 });

 var sessionId = DateTime.now().microsecondsSinceEpoch.toString();
 // CallEvent callEvent = CallEvent(
 //     sessionId: sessionId,
 //     callType: 0,
 //     callerId: randomIds(),
 //     callerName: randomString(5),
 //     opponentsIds: {randomIds(), randomIds()},
 //     callPhoto: 'https://i.imgur.com/KwrDil8b.jpg',
 //     userInfo: {'user_id': '${randomIds()}'});
 // ConnectycubeFlutterCallKit.showCallNotification(callEvent);
}
int randomIds() {
 var rng = new Random();
 var randomNumber = rng.nextInt(100000) + 1;
 return randomNumber;
}
String randomString(int length) {
 var rng = new Random();
 var codeUnits =
 List.generate(length, (index) => rng.nextInt(33) + 89); // 33 to 122
 return String.fromCharCodes(codeUnits);
}
void checkFullScreenIntentPermission() async {
 var canUseFullScreenIntent =
 await ConnectycubeFlutterCallKit.canUseFullScreenIntent();
 print("boolValue: $canUseFullScreenIntent");
 if (canUseFullScreenIntent == false) {
  ConnectycubeFlutterCallKit.provideFullScreenIntentAccess();
 }
}
const notificationChannelId = 'my_foreground';
const notificationId = 888;
final service = FlutterBackgroundService();
Future<void> initializeService() async {
 print("--- ----------------------------------${GetStorage().read("SHIFT_IN_TIME")} -----------------------");
 /// OPTIONAL, using custom notification channel id
 const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_foreground', // id
  'MY FOREGROUND SERVICE', // title
  description:
  'This channel is used for important notifications.', // description
  importance: Importance.low, // importance must be at low or higher level
 );

 final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
 FlutterLocalNotificationsPlugin();

 if (Platform.isIOS || Platform.isAndroid) {
  await flutterLocalNotificationsPlugin.initialize(
   const InitializationSettings(
    iOS: DarwinInitializationSettings(),
    android: AndroidInitializationSettings('ic_bg_service_small'),
   ),
  );
 }

 await flutterLocalNotificationsPlugin
     .resolvePlatformSpecificImplementation<
     AndroidFlutterLocalNotificationsPlugin>()
     ?.createNotificationChannel(channel);
 await service.configure(
  androidConfiguration: AndroidConfiguration(
   // this will be executed when app is in foreground or background in separated isolate
   onStart: onStart,

   // auto start service
   autoStart: true,
   isForegroundMode: true,

   notificationChannelId: 'my_foreground',
   initialNotificationTitle: 'AWESOME SERVICE',
   initialNotificationContent: 'Initializing',
   foregroundServiceNotificationId: 888,
  ),
  iosConfiguration: IosConfiguration(
   // auto start service
   autoStart: true,

   // this will be executed when app is in foreground in separated isolate
   onForeground: onStart,
  ),
 );
}
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
 print("--- shift_time ${GetStorage().read("SHIFT_IN_TIME")}---------SHIFT_OUT_TIME --${GetStorage().read("SHIFT_OUT_TIME")}-----ATTENDANCE_Status --${GetStorage().read("ATTENDANCE_Status")}---------IsTrack --${GetStorage().read("IsTrack")}-----------------------");
 DartPluginRegistrant.ensureInitialized();
 if (service is AndroidServiceInstance) {
  service.on('setAsForeground').listen((event) {
   service.setAsForegroundService();
  });

  service.on('setAsBackground').listen((event) {
   service.setAsBackgroundService();

  });
 }

 service.on('stopService').listen((event) {
  service.stopSelf();
 });

 ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);


 late Position position;
 late  Placemark place;
 _getCurrentLocation() async{
  position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude
  );
  place = placemarks[0];
 }

 Timer.periodic(Duration(seconds: 10), (timer) async {

  _getCurrentLocation();
  print( "Location--------------- ${position.latitude} ${position.longitude} ");
  print("select_car_type------------------> ${GetStorage().read("select_car_type")} ");



 });
 // bring to foreground
 socketFunction();
 Timer.periodic(Duration(minutes: 2), (timer) async {

  bool is_internet_available = await InternetConnection().hasInternetAccess;
  print( "Location---------------${position.latitude} ${position.longitude} \n");
  print("is_internet available-- ${is_internet_available}\n--- shift_time ${GetStorage().read("SHIFT_IN_TIME")}\n---------SHIFT_OUT_TIME --${GetStorage().read("SHIFT_OUT_TIME")}\n-----ATTENDANCE_Status --${GetStorage().read("ATTENDANCE_Status")}\n---------IsTrack --${GetStorage().read("IsTrack")}\n--------${timer.tick}----------------------");
  ///---------------------------------------------------------------------------\


  GpstrackingList.add(
      BackgroundTrackingApiModelClass(
          UserId: "${GetStorage().read("mobile_id")}",
          AttendanceDate:  "${DateFormat('yyyyMMdd').format(DateTime.now())}",
          AttendanceTime: "${DateFormat('HHmmss').format(DateTime.now()).toString()}",
          RefCardNo: "${GetStorage().read("RfIdCardNo")}",
          Location: "${place.name}",
          District: "${place.locality}",
          Division: "${place.administrativeArea}",
          PostalCode: "${place.postalCode}",
          SubLocality: "${place.subAdministrativeArea}",
          StreetName:  "${place.street.toString()}",
          lat: "${position.latitude}",
          lng: "${position.longitude}",
          Empcode: int.parse("${"${GetStorage().read("Empcode")}"}"),
          DutyDate: "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}", Remarks: GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track",
          IsTrack:  "true", Note: GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track"));
  Future.delayed(Duration(seconds: 2),() {
   selfOffLineDataSync();
  },);


  // for(int i=0;i<GpstrackingList.length;i++){
  //   print("////////////////////////////////////////////////////////////////////////////////");
  //   print("${GpstrackingList[i].UserId}---${GpstrackingList[i].AttendanceDate}---${GpstrackingList[i].AttendanceTime}--${GpstrackingList[i].RefCardNo}--${GpstrackingList[i].Location}--${GpstrackingList[i].District}");
  //   print("${GpstrackingList[i].PostalCode} --- ${GpstrackingList[i].Division} --- ${GpstrackingList[i].SubLocality}--${GpstrackingList[i].StreetName}--${GpstrackingList[i].lat}---${GpstrackingList[i].lng}");
  //   print("${GpstrackingList[i].Empcode}--${GpstrackingList[i].DutyDate}---${GpstrackingList[i].Remarks}---${GpstrackingList[i].IsTrack}---${GpstrackingList[i].Note}");
  //   print("////////////////////////////////////////////////////////////////////////////////");
  // }
  // CustomHttpSelf().selfCheckInCheckOut(
  //   "${GetStorage().read("mobile_id")}",
  //   "${DateFormat('yyyyMMdd').format(DateTime.now())}",
  //   "${DateFormat('HHmmss').format(DateTime.now()).toString()}",
  //   "${GetStorage().read("RfIdCardNo")}",
  //
  //   "${place.name}",
  //   "${place.locality}",
  //   "${place.administrativeArea}",
  //   "${place.postalCode}",
  //   "${place.subAdministrativeArea}",
  //   "${place.street.toString()}",
  //   // " ",
  //   // " ",
  //   // " ",
  //   // " ",
  //   // " ",
  //   // " ",
  //   "${position.latitude}",
  //   "${position.longitude}",
  //   int.parse("${"${GetStorage().read("Empcode")}"}"),
  //   "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
  //   GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track",
  //   "true",
  //   GetStorage().read("select_car_type") == "-1"?"GPS track":"conveyance track",
  // );

  ///---------------------------------------------------------------------------
  if (service is AndroidServiceInstance) {
   //   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa----------------------------${DateTime.now()}----------");
  }

  /// you can see this log in logcat
  print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

  // test using external plugin
  final deviceInfo = DeviceInfoPlugin();
  String? device;
  if (Platform.isAndroid) {
   final androidInfo = await deviceInfo.androidInfo;
   device = androidInfo.model;
  }

  if (Platform.isIOS) {
   final iosInfo = await deviceInfo.iosInfo;
   device = iosInfo.model;
  }
  service.invoke(
   'update',
   {
    "current_date": DateTime.now().toIso8601String(),
    "device": device,
   },
  );
 });
}
var fmap={};
List ddddddd=[];
selfOffLineDataSync()async{
 dynamic selfCheckInCheckOut ;
 /// ------- for loop ------------------------------------------------------
 for(int i=0;i<GpstrackingList.length;i++){
  fmap["UserId"]="${GpstrackingList[i].UserId}";
  fmap["AttendanceDate"]="${GpstrackingList[i].AttendanceDate}";
  fmap["AttendanceTime"]= "${GpstrackingList[i].AttendanceDate}";
  fmap["RefCardNo"]= "${GpstrackingList[i].RefCardNo}";
  fmap["Location"]="${GpstrackingList[i].Location}";
  fmap["District"]= "${GpstrackingList[i].District}";
  fmap["Division"]="${GpstrackingList[i].Division}";
  fmap["PostalCode"]="${GpstrackingList[i].PostalCode}";
  fmap["SubLocality"]= "${GpstrackingList[i].SubLocality}";
  fmap["StreetName"]= "${GpstrackingList[i].StreetName}";
  fmap["lat"]= "${GpstrackingList[i].lat}";
  fmap["lng"]= "${GpstrackingList[i].lng}";
  fmap["Empcode"]= GpstrackingList[i].Empcode;
  fmap["DutyDate"]= "${GpstrackingList[i].DutyDate}";
  fmap["Remarks"]= "${GpstrackingList[i].Remarks}";
  fmap["IsTrack"]= "${GpstrackingList[i].IsTrack}";
  fmap["Note"]="${GpstrackingList[i].Note}";
 }
 /// ------- for loop ------------------------------------------------------
 try{
  print("Check ---------------- Status----------------- ${jsonEncode([fmap])}");
  var data=await http.post(Uri.parse("${BASEURL}/Attendance/OffSLineDataSync"),
      headers: {
       "Content-Type": "application/json",
       "username": "jibikaapps",
       "password": "20jibika24",
      },
      body: jsonEncode( [fmap]
      )
  ).then((http.Response response) {
   selfCheckInCheckOut =jsonDecode(response.body);
   print("---------------------------------------------------------------------------  ${selfCheckInCheckOut}");
   if(response.statusCode==200){
    GpstrackingList.clear();
   }
  });
  return selfCheckInCheckOut;
 }
 catch(e){
  print("selfCheckInCheckOut Catch error ${e}");
 }
}



/// -------------------------  Flutter Notification -------------------------------------------------------///
 showNotification(String nitification) async {
 print("""""""""""""""1111""""""""""""""");
 const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  'channel_id',
  'channel_name',
  importance: Importance.high,
  priority: Priority.high,
 );

 const NotificationDetails notificationDetails = NotificationDetails(
  android: androidDetails,
 );


 await flutterLocalNotificationsPlugin.show(
  0,
  '$nitification',
  'Static Count from websocket',
  notificationDetails,
 );
 // _playRingtone("Assets/SoundAlert/messagealert.mp3");
 //
 // Future.delayed(Duration(milliseconds: 950),() {
 //  _stopRingtone();
 // },);
}
/// -------------------------  Audio Play -------------------------------------------------------///
StreamSubscription<void>? ringSubscription;
final player = AudioPlayer();
Future<void> _playRingtone( String audioasset) async {
 print('ppppppppppppppppppppppppppp');
 ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
 Uint8List soundbytes =
 bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
 try {
  await player.play(
   BytesSource(soundbytes),
  );
  ringSubscription = player.onPlayerComplete.listen((event) async {
   await player.play(
    BytesSource(soundbytes),
   );
  });
  await player.setVolume(1.0);
 } catch (e) {
  print("Error loading audio source: $e");
 }
}

/// -----------------------------------------------Stop Audio-----------------------------------------
void _stopRingtone() async{
 print("Stop ridddddddddddddddddddddddddddddd");
 await player.stop();
 await ringSubscription!.cancel();

 print("Stop ridddddddddddddddddddddddddddddd");
 if (ringSubscription != null) {
  ringSubscription!.cancel();
 }
 print('ringtone stopped');
}
