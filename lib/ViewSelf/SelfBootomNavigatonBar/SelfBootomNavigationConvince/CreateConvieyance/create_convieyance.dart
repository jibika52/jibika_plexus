import 'dart:async';
import 'dart:math';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jibika_plexus/Controller/TrackingController/tracking_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/CustomTextFromField/custom_text_from_fild.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/custom_text_form_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/tracking_google_map.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/CounterProvider/counter_provider.dart';
import '../../../../CustomWidget/CustomClockAnglebar/clock_angle_bar.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomTExtFormField/custom_text_formfield.dart';

class CreateConveyanceScreen extends StatefulWidget {
   CreateConveyanceScreen({super.key,required this.lat,required this.lon});
  double lat;
  double lon;
  @override
  State<CreateConveyanceScreen> createState() => _CreateConveyanceScreenState();
}

class _CreateConveyanceScreenState extends State<CreateConveyanceScreen> {
  TextEditingController _amountController=TextEditingController();
  TextEditingController _noteController=TextEditingController();
  Timer? timer;
  double increase_punch_progress_bar=0.0001;
  @override
  void initState() {
   _amountController.text= GetStorage().read("select_conveyance")??"00";
   selected_car_index= int.parse("${GetStorage().read("select_car_type")}");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Main_Theme_WhiteCollor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70), child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Conveyance")),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Main_Theme_WhiteCollor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  height:200,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10),
                  child:  TrackingMapScreen(lat: widget.lat, lon: widget.lon),
                )),


            //SizedBox(height: 30) ,
            GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?Container(): Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                image: DecorationImage(image: AssetImage("Assets/SelfIcon/car_conveyance_gif.gif"),fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 10) ,
            Consumer<TrackingController>(
              builder: (context, value, child) =>
                  Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
                ),
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //    itemCount: vehicle_image_list.length,
                  itemCount:value.GetVehicleList==null?0: value.GetVehicleList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          GetStorage().read("select_car_type")=="-1"?
                          selected_car_index=index:selected_car_index=int.parse("${GetStorage().read("select_car_type")}");
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //    color:  home_default_color
                        ),
                        height: 150,
                        width: 85,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color:selected_car_index==index?presentsent_color: home_default_color,
                                      border: Border.all(
                                      color:  Main_Theme_textColor.withOpacity(0.3)
                                  ),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(7),
                                  child: Image.asset("${vehicle_image_list[index]}"
                                    ,
                                    color: Main_Theme_textColor,

                                  )
                              ),
                            ),

                            ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${care_name_list[index]}", letterSpacing: 0.3, textColor:  Main_Theme_textColor,),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(height: apps_div_margin+20),
          //  CustomTextFormFieldd(maxline: 1, height: 60, hintext: "Enter Amount", controller: _amountController,keyboardType: TextInputType.number, obscureText: false,suffix: Text("data"),onChanged: (value) {
            // },),
           Column(
             children: [

               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3),
                 child: TextFormField(

                   controller: _amountController,
                   onChanged: (value) {
                     setState(() {
                       GetStorage().write("select_conveyance", "${_amountController.text}");
                     });
                   },
                   style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Main_Theme_textColor,
                    ),
                   keyboardType: TextInputType.number,
                   textAlign: TextAlign.center,
                   decoration: InputDecoration(
                     enabledBorder:UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Main_Theme_textColor.withOpacity(0.3),
                         )
                     ),
                     hintText: "Fare",
                     hintStyle: GoogleFonts.poppins(
                       fontSize: 30,
                       fontWeight: FontWeight.w600,
                       color: Main_Theme_textColor.withOpacity(0.5)
                     ),
                     contentPadding: EdgeInsets.only(left: 10),
                   ),
                 ),
               ),
               SizedBox(height: 15),
               TextFormField(
                 controller: _noteController,
                 decoration: InputDecoration(
                 enabledBorder:UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: Main_Theme_textColor.withOpacity(0.3),
                   )
                 ),
                   hintText: "Enter Note",
                   hintStyle: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Main_Theme_textColor.withOpacity(0.5)
                   ),
                   contentPadding: EdgeInsets.only(left: 10),
                 ),
               ),
               SizedBox(height: apps_div_margin+30),

               /// Start Conveyance and End Conveyance Punch Section  ----------------------
                GestureDetector(
                 onLongPress: () => setState(() {
                  if(selected_car_index==-1 &&   GetStorage().read("is_Start_Journey")=="false"){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text("Please Select vehicle")));
                   }
                  else if(_amountController.text.isEmpty &&   GetStorage().read("is_Start_Journey")=="true"){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text("Enter Fare Amount")));
                  }
                   else{
                     timer = Timer.periodic(Duration(microseconds: 1), (timer) {
                       setState(() {
                         if(increase_punch_progress_bar>=0.9999999){
                           increase_punch_progress_bar=0.0;
                           if(GetStorage().read("is_Start_Journey")=="false" || GetStorage().read("is_Start_Journey")==null){
                             GetStorage().write("is_Start_Journey","true");
                             GetStorage().write("select_car_type", "$selected_car_index");
                           }else{
                             GetStorage().write("is_Start_Journey","false");
                             GetStorage().write("select_conveyance", "");
                             GetStorage().write("select_car_type", "-1");
                            _amountController.text="";
                             selected_car_index=-1;
                             Navigator.pop(context);
                           }
                           ElegantNotification(
                             borderRadius: BorderRadius.circular(11),
                             width: 380,
                             iconSize: 25,
                             background: presentsent_color,
                             progressIndicatorBackground: presentsent_color,
                             progressIndicatorColor: absent_color,
                             // position: Alignment.center,
                             title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text:
                             "Start Journey Successful",
                                 letterSpacing: 0.3, textColor: Main_Theme_textColor),
                             description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks from JIBIKA PAYSCALE!..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
                             onDismiss: () {
                               print('Message when the notification is dismissed');
                             }, icon: Icon(Icons.info_outlined,color:Colors.black,),
                           ).show(context);
                           timer.cancel();
                         }else{
                           increase_punch_progress_bar=increase_punch_progress_bar+0.0001;
                         }
                       });
                     } );
                   }
                 }
                 ),
                 onLongPressEnd: (_) => setState(() {
                   increase_punch_progress_bar=0.0;
                   timer?.cancel();
                 }),
                 child: Container(
                   padding: const EdgeInsets.only(bottom: 0.0),
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       Container(
                         height: 120,
                         width: 120,
                         padding: EdgeInsets.all(25),
                         // child: CustomImageSction2(height: 70, width: 70, radius: 50, image: "Assets/DashBoardIcons/b_bar_attendence.png", img_color: Main_Theme_textColor.withOpacity(0.5)),
                       ),
                       Container(
                         alignment: Alignment.center, //  color: Colors.green,
                         child: CircularPercentIndicator(
                           radius: 70.0,
                           lineWidth: 9.5,
                           //    percent:0.7,
                           percent:increase_punch_progress_bar,
                           //   backgroundColor: Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                           backgroundColor: Main_Theme_textColor.withOpacity(0.2),
                           progressColor: presentsent_color,
                           center: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Text(GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?"Start":"End",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,fontSize: 22,
                                color:CustomAppbarColor,
                              ),),
                              Text("Journey",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,fontSize: 16,
                              ),)
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(
                 height: 50,
               )

             ],
           ),

          ],
        ),

      ),
    );
  }
  List vehicle_image_list=[
    "Assets/SelfIcon/rickshaw.png",
    "Assets/SelfIcon/bike.png",
    "Assets/SelfIcon/cng.png",
    "Assets/SelfIcon/conveyance.png",
    "Assets/SelfIcon/bus.png",
    "Assets/SelfIcon/transport.png",
    "Assets/SelfIcon/plane.png",

  ];
  List care_name_list=[
    "RICKSHAW",
    "BIKE",
    "CNG",
    "CAR",
    "BUS",
    "TRAIN",
    "BOAT",
    "LAUNCH",
    "FERRY",
    "HELICOPTER"
    "PLANE",
  ];
  int selected_car_index=-1;
}
