
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Api/Routes/routes.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCircleDay/custom_circleday.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomImageButton/custom_imagebutton.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../../../Utils/constants.dart';
import 'create_employee2.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  const CreateNewEmployeeScreen({super.key});

  @override
  State<CreateNewEmployeeScreen> createState() => _CreateNewEmployeeScreenState();
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {
  TextEditingController _companyAddressController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _nIDController = TextEditingController();
  TextEditingController _employeeNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _siftplaneController = TextEditingController();
  TextEditingController _growsSalaryController = TextEditingController();
  final _fromKey=GlobalKey<FormState>();
  File ? _image;
  File ? _NID;
  final picker = ImagePicker();
  ///NID font
  Future getNIDImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _NID = File(pickedFile.path);
      }
    });
  }
  ///image font
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double C_height=8;
    double Cwidth=10;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Primary Information")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Primary Information ---------------------------------------------------------
                Container(
                  height: 102,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          getImageFromGallery();
                        },
                        child: Column(
                          children: [
                            _image!=null?ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(_image!.renameSync(_image!.path),height: 80,width: 80, fit: BoxFit.fill,))
                                :  Container(
                              height: 80,
                              width:80,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(7),
                                border: Border.all(
                                  color: Main_Theme_textColor.withOpacity(0.4),
                                  width: 1.2
                                )
                              ),
                              alignment: Alignment.center,
                              child:
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(56),
                                    child: Container(
                                      height: 56,
                                      width: 56,
                                      color:  Main_Theme_textColor.withOpacity(0.07),
                                      padding: EdgeInsets.all(10),
                                      child:

                                      CustomImageSction(height: 20, width: 15, radius: 1, image: "Assets/DashBoardIcons/person1.png" ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -1.5,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(bottom: 1, left: 1.0, right:1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("Assets/Icons/subtract.png"),
                                              fit: BoxFit.fill),
                                        ),
                                        height: 20,
                                        width: 50,
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Upload / Take photo", letterSpacing: 0.3),

                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              getNIDImageFromGallery();
                            },
                            child: _NID!=null?ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.file(_NID!.renameSync(_NID!.path),height: 80,width: 126, fit: BoxFit.fill,))
                                : Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width:126,
                                  decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(7),
                                      border: Border.all(
                                          color: absent_color.withOpacity(0.3),
                                          width: 1.2
                                      )
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7),
                                    color:  Main_Theme_WhiteCollor,
                                    child: CustomImageSction2(height: 27, width: 47, radius: 1, image: "Assets/DashBoardIcons/empoloyee_card.png",img_color: Main_Theme_textColor.withOpacity(0.7),),
                                  ),
                                ),
                                Positioned(
                                    top: 80/2-2 ,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow:[
                                          BoxShadow(
                                            color: absent_color.withOpacity(0.8),
                                            spreadRadius: 1,
                                            blurRadius: 9,
                                            offset: Offset(0, 2), // changes position of shadow
                                          ),
                                        ],
                                        color: absent_color.withOpacity(0.7),
                                      ),
                                  height: 1,
                                  width: 126,

                                )),

                                Positioned(
                                    top: 80/2+2,
                                    child: Container(
                                  height: 1,
                                  width: 126,
                                      color: absent_color.withOpacity(0.7),
                                )),
                                Positioned(
                                    top: 80/2+2,
                                    child: Container(
                                  height: 36.5,
                                  width: 126,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(7),
                                          bottomRight: Radius.circular(7)
                                        ) ,
                                        color: absent_color.withOpacity(0.07),
                                      ),

                                ))
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Scan NID Card", letterSpacing: 0.3),
          
                        ],
                      ),
                    ],
                  ),
                ),




                SizedBox(height: C_height,),
              Padding(padding: EdgeInsets.only(
                left: 0,right: 10,
              ),

                /// Registration part ---------------------------------------------------------


              child: Column(
                children: [
                  JibikaCustomTextFromField(
                        readOnly: false,
                      controller: _nIDController,
                      height: 50,
                      img: "Assets/DashBoardIcons/personalcard.png",
                      hinttext: "Employee NID",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(
                        readOnly: false,
                      controller: _employeeIdController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (1).png",
                      hinttext: "Employee ID",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(
                        readOnly: false,
                      controller: _employeeNameController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (2).png",
                      hinttext: "Employee name",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(
                    onTap: () {
                      _joiningDate(context);
                    },
                      readOnly: true,
                      controller: _companyAddressController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Date of barth",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _phoneController,
                      height: 50,
                      img: "Assets/PrimaryInformation/phone.png",
                      hinttext: "Mobile number",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _siftplaneController,
                      height: 50,
                      img: "Assets/PrimaryInformation/work-shift 1.png",
                      hinttext: "Shift plane",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _growsSalaryController,
                      height: 50,
                      img: "Assets/PrimaryInformation/money_payment.png",
                      hinttext: "Grows Salary",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),

                  JibikaCustomTextFromField(
                    onTap: () {
                      _joiningDate(context);
                    },
                      readOnly: true,
                      controller: _companyAddressController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Joining date",
                      keyboardType: TextInputType.text,
                      obscureText: false),

                ],
              ),
              ),
              SizedBox(height: C_height+18,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Gender", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
              SizedBox(height: C_height,),
              Container(
                  height: 35,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCircleDay(day: "M", onTap: () {
                        setState((){
                          m=true;
                          f=false;
                          o=false;
                        });
                      }, backgroundColor:m==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:m==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                      CustomCircleDay(day: "F", onTap: () {
                        setState((){
                          m=false;
                          f=true;
                          o=false;
                        });
                      }, backgroundColor:f==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:f==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                      CustomCircleDay(day: "O", onTap: () {
                        setState((){
                          m=false;
                          f=false;
                          o=true;
                        });
                      }, backgroundColor:o==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:o==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                      Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                      Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                      Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                      Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),

                    ],
                  )
              ),
              SizedBox(height: C_height+10,),



              Align(
                  alignment: Alignment.centerLeft,
                  child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Weekend", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.5),)),
              SizedBox(height: C_height,),
              Container(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCircleDay(day: "Sa", onTap: () {
                    setState(() =>sat=!sat);
                    }, backgroundColor:sat==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sat==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Su", onTap: () {
                    setState(() =>sun=!sun);
                    }, backgroundColor:sun==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sun==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Mo", onTap: () {
                    setState(() =>mon=!mon);
                    }, backgroundColor:mon==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:mon==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Tu", onTap: () {
                    setState(() =>Tue=!Tue);
                    }, backgroundColor:Tue==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Tue==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                    CustomCircleDay(day: "We", onTap: () {
                    setState(() =>Wed=!Wed);
                    }, backgroundColor:Wed==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Wed==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Th", onTap: () {
                    setState(() =>Thu=!Thu);
                    }, backgroundColor:Thu==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Thu==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),


                    CustomCircleDay(day: "Fr", onTap: () {
                    setState(() =>fri=!fri);
                    }, backgroundColor:fri==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:fri==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),



                  ],
                )
              ),
              SizedBox(height: C_height+10,),
              Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => CreateNewEmployeeScreen2(),)),
                    child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "More info...", letterSpacing: 0.3, textColor: Main_Theme_textColor_tir_Condition)),
              ),
              SizedBox(height: C_height+10,),
              InkWell(
                onTap: () {
                  SaveOnBoarding();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 70.0,right: 70),
                  child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                      textColor: Colors.white, b_color: CustomButtonColor),
                ),
              ),

              SizedBox(height: C_height+20,),

            ],
          ),
        ),
      ),
    );
  }
  bool sat=false;
  bool sun=false;
  bool mon=false;
  bool Tue=false;
  bool Wed=false;
  bool Thu=false;
  bool fri=false;
  /// for gender
  bool m=false;
  bool f=false;
  bool o=false;



  functionval()async{
    var nid_cardd = await http.MultipartFile.fromPath('EmpImageFile', _image!.path.toString());
   // var image = await http.MultipartFile.fromPath('EmpImageFile', _NID!.path.toString());
    request.files.add(nid_cardd);
  //  request.files.add(image);
  }
  dun(){}

  var request = http.MultipartRequest("POST", Uri.parse("${BASEURL}${EmployeeOnBoarding}"));

  SaveOnBoarding() async {
    try{
      request.headers.addAll({
        "accept": "application/json",
        'Authorization': 'Bearer ${GetStorage().read("api_token")}'
      });

      // request.fields['GENDER'] = "M" ;
      // request.fields['ID_CARD_NO'] = "10016" ;
      // request.fields['USERID'] = "01889173335" ;
      // request.fields['EMPLOYEE_NAME_ENGLISH'] = "Uzzal Biswas";
      // request.fields['JOINING_DATE'] = "18-Sep-2024";
      // request.fields['BIRTH_DATE'] = "11-Apr-1997";
      // request.fields['RF_ID_NO'] = "015186812";
      // request.fields['EMPLOYEE_STATUS'] = "3";
      // request.fields['CLIENTBASE_URL'] = "${BASEURL}";

    "${_image}"=="null"?dun(): functionval();
      request.fields["GENDER"] = m==true? "M" :f==true? "F": "O" ;
      request.fields["ID_CARD_NO"] = "01889173335" ;
      request.fields["USERID"] = "01889173335" ;
      request.fields["EMPLOYEE_NAME_ENGLISH"] = "TEST ARMY" ;
      request.fields["JOINING_DATE"] = "18-Sep-2024" ;
      request.fields["BIRTH_DATE"] = "01-Sep-1992" ;
      request.fields["RF_ID_NO"] = "10015" ;
      request.fields["EMPLOYEE_STATUS"] = "3" ;
      request.fields["CLIENTBASE_URL"] = "${GetStorage().read("APPS_IMG_BASEURL")}" ;

      var response = await request.send();
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=============================> ${response.stream}");
      var responseData = await response.stream.toBytes();
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb=============================> ${responseData}");

      var responseString = String.fromCharCodes(responseData);
      print("ccccccccccccccccccccccccccccccccccccccccccc=============================> ${responseData}");
      var  data = jsonDecode(responseString);

    }catch(erroe){
      print("Catch Error $erroe");
    }
  }

  String joiningDate = DateFormat("dd-MMM-yyyy").format(DateTime.now()).toString();
  Future<void> _joiningDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != joiningDate) {
      final df = new DateFormat("dd-MMM-yyyy");
      setState(() {
        joiningDate = df.format(picked);
        _companyAddressController.text=joiningDate;
      });
    }
  }

}
