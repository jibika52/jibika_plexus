import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomButton/custom_button.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/CustomTextFromField/custom_text_from_fild.dart';
import 'package:jibika_plexus/CustomWidget/CustomTExtFormField/custom_text_form_field.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';
import 'package:jibika_plexus/tracking_google_map.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70), child: CustomDefaultAppBar(onTap: () {
        Navigator.pop(context);
      }, text: "Create Conveyance")),

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
                  height:200,
                  width: double.infinity,
                  color: Colors.red,
                  child:  TrackingMapScreen(lat: widget.lat, lon: widget.lon),
                )),

            SizedBox(height: apps_div_margin +5,),
            Container(
              padding: EdgeInsets.all(10),
              child: ColorCustomText(fontSize: 16, fontWeight: FontWeight.w600, text: "Choose your vehicle", letterSpacing: 0.3, textColor: Main_Theme_textColor),
            ),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              padding: EdgeInsets.only(left: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vehicle_image_list.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selected_car_index=index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                        color:selected_car_index==index?presentsent_color: home_default_color
                      ),
                      height: 150,
                      width: 110,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(border: Border.all(color: selected_car_index==index?Main_Theme_WhiteCollor:Main_Theme_textColor.withOpacity(0.3)),borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(7),
                                child: Image.asset("${vehicle_image_list[index]}",color: selected_car_index==index?Main_Theme_WhiteCollor:Main_Theme_textColor,)),
                          ),

                          ColorCustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${care_name_list[index]}", letterSpacing: 0.3, textColor: selected_car_index==index?Main_Theme_WhiteCollor:Main_Theme_textColor,),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(height: apps_div_margin +5,),
          //  CustomTextFormFieldd(maxline: 1, height: 60, hintext: "Enter Amount", controller: _amountController,keyboardType: TextInputType.number, obscureText: false,suffix: Text("data"),onChanged: (value) {
            // },),
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10),
                 child: CustomTExtFromField(controller: _amountController,keyboardType: TextInputType.number,hintText: "Enter amount", fontSize: 12, fontWeight: FontWeight.w400, text_color: Main_Theme_textColor, obscureText: false,),
               ),
               SizedBox(height: apps_div_margin ,),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10),
                 child: CustomTExtFromField(controller: _noteController, hintText: "Enter note", fontSize: 12, fontWeight: FontWeight.w400, text_color: Main_Theme_textColor, obscureText: false,),
               ),
               SizedBox(height: apps_div_margin ,),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10),
                 child: CustomButton(onTap: () {

                 }, text: "End Conveyance", button_text_fontSize: 15, button_height: 50, custom_button_collor: CustomButtonColor, button_text_color: Main_Theme_WhiteCollor, borderRadius: 15),
               ),

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
    "pLANE",
  ];
  int selected_car_index=-1;
}
