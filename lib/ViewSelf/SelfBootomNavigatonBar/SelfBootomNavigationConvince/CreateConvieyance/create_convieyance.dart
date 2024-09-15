import 'dart:async';
import 'dart:math';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'package:jibika_plexus/Controller/TrackingController/tracking_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/CustomTextFromField/custom_text_from_fild.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/custom_text_form_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import 'package:jibika_plexus/tracking_google_map.dart';
import 'package:jibika_plexus/tracking_google_map_test.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/CounterProvider/counter_provider.dart';
import '../../../../CustomWidget/CustomClockAnglebar/clock_angle_bar.dart';
import '../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../CustomWidget/CustomTExtFormField/custom_text_formfield.dart';

class CreateConveyanceScreen extends StatefulWidget {
   CreateConveyanceScreen({super.key});

  @override
  State<CreateConveyanceScreen> createState() => _CreateConveyanceScreenState();
}

class _CreateConveyanceScreenState extends State<CreateConveyanceScreen> {

  late Position position;
  Completer<GoogleMapController> _controller = Completer();
  static late CameraPosition _kGoogle ;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  // list of locations to display polylines
  List<LatLng> latLen = [
    //   //  LatLng(widget.lat,widget.lon),
    //   LatLng(23.8101645, 90.4221128),
    //   LatLng(23.8204145, 90.4324000),
  ];
  List aa=[23.8101645,23.8102645,23.8103645,23.8104645,23.8105645];
  List bb=[90.4326000,90.4325000,90.4324000,90.4323000,90.4322600];

  int i=0;
  void latlonglistgret(){
    for(i=0;i<aa.length;i++){
      latLen.add(LatLng(aa[i], bb[i]));
      print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS $latLen");
    }
  }

  _getCurrentLocation() async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _kGoogle =   CameraPosition(
        target:  LatLng(position.latitude, position.longitude),
        zoom: 16,
      );
      latlonglistgret();

      Future.delayed(Duration(seconds: 3),() {
        print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        for(int i=0; i<latLen.length; i++){
          _markers.add(
            // added markers
              Marker(
                markerId: MarkerId(i.toString()),
                position: latLen[i],
                infoWindow: InfoWindow(
                  title: 'HOTEL',
                  snippet: '${latLen[i]}',
                ),
                icon: BitmapDescriptor.defaultMarker,
              )
          );
          setState(() {

          });
          _polyline.add(
              Polyline(
                polylineId: PolylineId('1'),
                points: latLen,
                width: 2,
                color: Colors.red,
              )
          );
        }
      },);
    });
  }

  int count22 = 0;
  late Timer timer22;
  ///////////////////////////////
  TextEditingController _amountController=TextEditingController();
  TextEditingController _noteController=TextEditingController();
  Timer? timer;
  double increase_punch_progress_bar=0.0001;

  @override
  void initState() {
    Provider.of<TrackingController>(context,listen: false).GetEmployeeLocaltionInfoProvider("${GetStorage().read("mobile_id")}", "09-Sep-2024","60670", context);
    _getCurrentLocation();
   _amountController.text= GetStorage().read("select_conveyance")??"00";
   selected_car_index= int.parse("${GetStorage().read("select_car_type")}");
    // TODO: implement initState
    super.initState();
  }
  createConveyance()async{
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude
    );
    Placemark place = placemarks[0];
    Provider.of<SelfDashboardController>(context,listen: false).selfcreateConveyanceProvider(
        "${DateFormat('yyyyMMdd').format(DateTime.now())}",
        "${DateFormat('HHmmss').format(DateTime.now()).toString()}",
        "${place.name}",
        "${place.locality}",
        "${place.administrativeArea}",
        "${place.postalCode}",
        "${place.subAdministrativeArea}",
        "${place.street.toString()}",
        "${position.latitude}",
        "${position.longitude}",
        int.parse("${GetStorage().read("Empcode")}"),
        "conveyance track",
        "true",
        int.parse("${GetStorage().read("select_conveyance")}"),
        int.parse("${GetStorage().read("conveyance_car_code")}"),
        int.parse("${GetStorage().read("for_end_conveyance_code")}"),
        0,
        context
    );
  }

  @override
  Widget build(BuildContext context) {
  print("conveyance_car_code--------------------------------------- conveyance_car_code---->  ${GetStorage().read("conveyance_car_code")}");
    timer22 = Timer.periodic(Duration(seconds: 1), (timer) {
      if(count22==5){
        timer22.cancel();
      }else{
        count22++;
      }
    });
    return Scaffold(
  backgroundColor: Main_Theme_WhiteCollor,
         appBar:  PreferredSize(preferredSize:GetStorage().read("is_Start_Journey")=="true" ?
         Size.fromHeight(1) :Size.fromHeight(60) , child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Conveyance")),

      body: Container(
        height: double.infinity,
        width: double.infinity,
      //  margin: EdgeInsets.only(left: 10,right: 10,),
        decoration: BoxDecoration(
          color: Main_Theme_WhiteCollor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:count22<4?Center(child: CircularProgressIndicator(),): GoogleMap(
                //given camera position
                initialCameraPosition: _kGoogle,
                // on below line we have given map type
                mapType: MapType.normal,
                // specified set of markers below
                markers: _markers,
                // on below line we have enabled location
                myLocationEnabled: true,

                myLocationButtonEnabled: true,
                // on below line we have enabled compass location
                compassEnabled: true,
                // on below line we have added polylines
                polylines: _polyline,
                // displayed google map
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                // GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?Container():
                // Container(
                //   height: 100,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                //     image: DecorationImage(image: AssetImage("Assets/SelfIcon/jibika_conveyancegiff.gif"),fit: BoxFit.fill),
                //   ),
                // ),
                  SizedBox(height: 10) ,
                Consumer<TrackingController>(
                  builder: (context, value, child) =>
                      Container(
                        height:d_height>700? 100 : 85,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                           // itemCount: 6,
                               itemCount:value.GetVehicleList==null?0: value.GetVehicleList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  GetStorage().read("select_car_type")=="-1"?
                                  selected_car_index=index:selected_car_index=int.parse("${GetStorage().read("select_car_type")}");

                                  GetStorage().read("conveyance_car_code")=="0"?
                                  selected_car_code_index=int.parse("${value.GetVehicleList[index]["Code"]}")
                                      :
                                  selected_car_code_index=int.parse("${GetStorage().read("conveyance_car_code")}");
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  //    color:  home_default_color
                                ),
                                height: 150,
                                width: d_height>700?85:70,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right:d_height>700?  10 :0),
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
                                    SizedBox(height: 3,),
                                    ColorCustomText(fontSize:d_height>700? 13:11, fontWeight: FontWeight.w400,
                                      text: "${value.GetVehicleList[index]["VehicleName"]}", letterSpacing: 0.3, textColor:  Main_Theme_textColor,),
                                  ],
                                ),
                              ),
                            )),
                      ),
                ),
                SizedBox(height: apps_div_margin),
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
                          fontSize:d_height>700? 30:20,
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
                              fontSize:d_height>700? 30:20,
                              fontWeight: FontWeight.w600,
                              color: Main_Theme_textColor.withOpacity(0.5)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:d_height>700?  15:8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: _noteController,
                        decoration: InputDecoration(
                          enabledBorder:UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Main_Theme_textColor.withOpacity(0.3),
                              )
                          ),
                          hintText: "Enter Note",
                          hintStyle: TextStyle(
                              fontSize:d_height>700? 16:11,
                              fontWeight: FontWeight.w400,
                              color: Main_Theme_textColor.withOpacity(0.5)
                          ),
                          contentPadding: EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                    SizedBox(height:d_height>700? apps_div_margin+20:apps_div_margin+5),

                    /// Start Conveyance and End Conveyance Punch Section  ----------------------
                    GestureDetector(
                      onLongPress: () => setState(() {
                        timer22.cancel();
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
                                if(GetStorage().read("is_Start_Journey")=="false" || GetStorage().read("is_Start_Journey")==null)  {
                                  createConveyance();
                                  GetStorage().write("is_Start_Journey","true");
                                  GetStorage().write("select_car_type", "$selected_car_index");
                                  GetStorage().write("conveyance_car_code","${selected_car_code_index}");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SalfBootomNatchBarScreen(currentIndex: 3),));

                                }else{
                                  createConveyance();

                                Future.delayed(Duration(seconds: 1),() {
                                  GetStorage().write("conveyance_car_code","0");
                                  GetStorage().write("for_end_conveyance_code","0");
                                  GetStorage().write("is_Start_Journey","false");
                                  GetStorage().write("select_conveyance", "0");
                                  GetStorage().write("select_car_type", "-1");
                                  _amountController.text="";
                                  selected_car_index=-1;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SalfBootomNatchBarScreen(currentIndex: 3),));

                                },);
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height:d_height>700? 120:90,
                              width: d_height>700? 120 :90,
                              decoration: GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?
                              BoxDecoration():
                              BoxDecoration(image: DecorationImage(image: AssetImage("Assets/SelfIcon/jibika_conveyancegiff.gif"))),
                              padding: EdgeInsets.all(25),
                              // child:
                              // GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?Container():
                              // Container(
                              //   height: 100,
                              //   width: double.infinity,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                              //     image: DecorationImage(image: AssetImage("Assets/SelfIcon/circle_conveyancegiff.gif"),fit: BoxFit.fill),
                              //   ),
                              // ),
                              // child: CustomImageSction2(height: 70, width: 70, radius: 50, image: "Assets/DashBoardIcons/b_bar_attendence.png", img_color: Main_Theme_textColor.withOpacity(0.5)),

                            ),
                            Container(
                              alignment: Alignment.center, //  color: Colors.green,
                              child: CircularPercentIndicator(
                                radius:d_height>700? 70.0:60,
                                lineWidth:d_height>700? 9.5:7.5,
                                //    percent:0.7,
                                percent:increase_punch_progress_bar,
                                //   backgroundColor: Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                                backgroundColor: Main_Theme_textColor.withOpacity(0.2),
                                progressColor: presentsent_color,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   // Text(GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?"End":"End",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                   //    fontWeight: FontWeight.w600,fontSize: 22,
                                   //    color:CustomAppbarColor,
                                   //  ),),
                                   //  Text("Journey",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                   //    fontWeight: FontWeight.w600,fontSize: 16,
                                   //  ),),
                                    GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?Container():   SizedBox(
                                      height: 62,
                                    ),
                                    Text(GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?"Start":"End",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                       fontWeight: FontWeight.w600,fontSize: 22,
                                       color:CustomAppbarColor,
                                     ),),
                                    GetStorage().read("is_Start_Journey")==null || GetStorage().read("is_Start_Journey")=="false"?    Text("Journey",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                       fontWeight: FontWeight.w600,fontSize: 16,
                                     ),):Container(),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height:d_height>700? 30:15,
                    )
              ],),
              //SizedBox(height: 30) ,


               ],
                         ),
            ),

          ],
        ),

      ),
    );
  }
  List vehicle_image_list=[
    "Assets/SelfIcon/taxi.png",
    "Assets/SelfIcon/cng.png",
    "Assets/SelfIcon/bus.png",
    "Assets/SelfIcon/car.png",
    "Assets/SelfIcon/rickshaw.png",
    "Assets/SelfIcon/bike.png",
    "Assets/SelfIcon/transport.png",
    "Assets/SelfIcon/man-in-canoe.png",
    "Assets/SelfIcon/launch.png",
    "Assets/SelfIcon/ferry-boat.png",
    "Assets/SelfIcon/airplane.png",
    "Assets/SelfIcon/helicopter.png",

  ];
  int selected_car_index=-1;
  int selected_car_code_index=-1;
}
