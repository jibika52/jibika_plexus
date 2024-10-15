
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:elegant_notification/elegant_notification.dart';
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
import 'package:jibika_plexus/Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCircleDay/custom_circleday.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomImageButton/custom_imagebutton.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:jibika_plexus/View/BootomNatchBar/bootom_bar_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../../../Utils/constants.dart';
import 'create_employee2.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  const CreateNewEmployeeScreen({super.key});

  @override
  State<CreateNewEmployeeScreen> createState() => _CreateNewEmployeeScreenState();
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {

  TextEditingController _joiningDateController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _employeeRFController = TextEditingController();
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
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _NID = File(pickedFile.path);
        Future.delayed(Duration(seconds: 2),() {
          _extractText(_NID!);
        },);
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


  Future<String?> _extractText(File file) async {
    final textRecognizer = TextRecognizer(
      script: TextRecognitionScript.latin,
    );
    final InputImage inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
    await textRecognizer.processImage(inputImage);
    String text = recognizedText.text.substring(82, recognizedText.text.length).replaceAll(":", "").replaceAll("Nam", "").replaceAll("ID", "").replaceAll("NID", "");
    print("cccccccccccccccccccc------------------ ${text}-----------------------------");
    textRecognizer.close();
    _NID == null ? _employeeNameController :_employeeNameController.text="${text.split('Date of Birth')[0] ?? ""}";
    _NID == null ? _birthDateController : _birthDateController.text="${text.split('Date of Birth')[1].split('N')[0] ?? ""}";
    _NID == null ? _nIDController : _nIDController.text="${text.split('Date of Birth')[1].split('NO')[1] ?? ""}";
    return text;
  }

  @override
  void initState() {
    Provider.of<OnboardingEmployeeController>(context,listen: false).GetDepartmentNDesinationListProvider("${GetStorage().read("mobile_id")}", context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double C_height=8;
    double Cwidth=10;
  //  List  shiftplanelist=Provider.of<OnboardingEmployeeController>(context).GetShiftPlanNWeekendList["shiftplan"];
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
                            CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Upload photo", letterSpacing: 0.3),
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
                          CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Scan NID For Photo & OCR", letterSpacing: 0.3),
                        ],
                      ),
                    ],
                  ),
                ),




                SizedBox(height: C_height,),
              /// Registration part ---------------------------------------------------------


              Padding(padding: EdgeInsets.only(
                left: 0,right: 10,
              ),
              child:
              _NID == null?
              Column(
                children: [
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
                      readOnly: false,
                      controller: _nIDController,
                      height: 50,
                      img: "Assets/DashBoardIcons/personalcard.png",
                      hinttext: "NID No.",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),

                  JibikaCustomTextFromField(
                      onTap: () {
                        _birthdate(context);
                      },
                      readOnly: true,
                      controller: _birthDateController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Date of Birth",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(
                      readOnly: false,
                      controller: _employeeIdController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (1).png",
                      hinttext: "Id Card No.",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(

                      readOnly: false,
                      controller: _employeeRFController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (1).png",
                      hinttext: "RF/FP/Face No.",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _phoneController,
                      height: 50,
                      img: "Assets/PrimaryInformation/phone.png",
                      hinttext: "Mobile Number",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _growsSalaryController,
                      height: 50,
                      img: "Assets/PrimaryInformation/money_payment.png",
                      hinttext: "Grows Salary",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),

                  JibikaCustomTextFromField(
                      onTap: () {
                        _joiningDate(context);
                      },
                      readOnly: true,
                      controller: _joiningDateController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Joining Date",
                      keyboardType: TextInputType.text,
                      obscureText: false),

                ],
              )
                  :

              Column(
                children: [
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
                      readOnly: false,
                      controller: _nIDController,
                      height: 50,
                      img: "Assets/DashBoardIcons/personalcard.png",
                      hinttext: "NID No.",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),

                  JibikaCustomTextFromField(
                      onTap: () {
                        _birthdate(context);
                      },
                      readOnly: true,
                      controller: _birthDateController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Date of Birth",
                      keyboardType: TextInputType.text,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(
                      readOnly: false,
                      controller: _employeeIdController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (1).png",
                      hinttext: "Id Card No.",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField(

                      readOnly: false,
                      controller: _employeeRFController,
                      height: 50,
                      img: "Assets/PrimaryInformation/people (1).png",
                      hinttext: "RF/FP/Face No.",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _phoneController,
                      height: 50,
                      img: "Assets/PrimaryInformation/phone.png",
                      hinttext: "Mobile Number",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),
                  JibikaCustomTextFromField2(
                      controller: _growsSalaryController,
                      height: 50,
                      img: "Assets/PrimaryInformation/money_payment.png",
                      hinttext: "Grows Salary",
                      keyboardType: TextInputType.number,
                      obscureText: false),
                  SizedBox(height: C_height,),

                  JibikaCustomTextFromField(
                      onTap: () {
                        _joiningDate(context);
                      },
                      readOnly: true,
                      controller: _joiningDateController,
                      height: 50,
                      img: "Assets/PrimaryInformation/calendar.png",
                      hinttext: "Joining Date",
                      keyboardType: TextInputType.text,
                      obscureText: false),

                ],
              )
              ),
              SizedBox(height: C_height,),
              Consumer<OnboardingEmployeeController>(

                builder: (context, value, child)
                {
                  List abc=value.GetShiftPlanNWeekendList["shiftplan"];
                  return Container(
              margin: EdgeInsets.only(top: 10),
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: DropdownButton(
            enableFeedback: true,
            autofocus: false,
            isExpanded: true,
            hint: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Shift Plane", letterSpacing: 0.3),
            // Not necessary for Option 1
            value: shiftplan_id,
            onChanged: (newValue) {
              setState(() {
                shiftplan_id = newValue.toString();
              });
            },
            items: abc.map((shift) {
              return DropdownMenuItem(
                child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                value: "${shift['Code']}",
              );
            }).toList(),
          ),
        );
                }

              ),
              SizedBox(height: C_height+10,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Gender", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.7),)),
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
                      }, backgroundColor:o==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:o==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.7),),
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
                  child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Weekend", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.7),)),
              SizedBox(height: C_height,),
              Container(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCircleDay(day: "Sa", onTap: () {
                    setState(() {
                      sat=!sat;
                      if(sat==true){
                        Containsvalue.add(1);
                      }else{
                        Containsvalue.remove(1);
                      }
                    });
                    }, backgroundColor:sat==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sat==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Su", onTap: () {
                    setState((){
                      sun=!sun;
                      if(sun==true){
                        Containsvalue.add(2);
                      }else{
                        Containsvalue.remove(2);
                      }
                    });
                    }, backgroundColor:sun==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:sun==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Mo", onTap: () {
                    setState(() {
                      mon=!mon;
                      if(mon==true){
                        Containsvalue.add(3);
                      }else{
                        Containsvalue.remove(3);
                      }
                    });
                    }, backgroundColor:mon==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:mon==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Tu", onTap: () {
                    setState(() {
                      Tue=!Tue;
                      if(Tue==true){
                        Containsvalue.add(4);
                      }else{
                        Containsvalue.remove(4);
                      }
                    });
                    }, backgroundColor:Tue==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Tue==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                    CustomCircleDay(day: "We", onTap: () {
                    setState(() {
                      Wed=!Wed;
                      if(Wed==true){
                        Containsvalue.add(5);
                      }else{
                        Containsvalue.remove(5);
                      }
                    });
                    }, backgroundColor:Wed==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Wed==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Th", onTap: () {
                    setState(() {
                      Thu=!Thu;
                      if(Thu==true){
                        Containsvalue.add(6);
                      }else{
                        Containsvalue.remove(6);
                      }
                    });
                    }, backgroundColor:Thu==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:Thu==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),

                    CustomCircleDay(day: "Fr", onTap: () {
                    setState(() {
                      fri=!fri;
                      if(fri==true){
                        Containsvalue.add(7);
                      }else{
                        Containsvalue.remove(7);
                      }
                    });
                    }, backgroundColor:fri==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:fri==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),



                  ],
                )
              ),
              SizedBox(height: C_height+10,),
              Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                   onTap: () {
                     Navigator.push(context, CupertinoPageRoute(builder: (context) => CreateNewEmployeeScreen2(
                         employeeID: _employeeIdController.text,
                         employeeNID: _nIDController.text,
                         employeeName: _employeeNameController.text,
                         employeeDateOfBirth: _birthDateController.text,
                         employeeMobileNumber: _phoneController.text,
                         ShiftPlane: _siftplaneController.text,
                         employeeGrowssallary: _growsSalaryController.text,
                         employeeJoiningDate: _joiningDateController.text,
                         joiningDateController: "",
                         employeeRFController: "",
                         fatherNameController: "",
                         gmailController: "",
                         presentAddressController: "",
                         parmenentAddressController: "",
                         siftplaneController: "",
                         StafCategoryController: "",
                         InactiveDateController: "",
                         BasicSalaryController: "",
                         HouserentController: "",
                         MedicalAllowanceController: "",
                         FoodAllowanceController: "",
                         ConvinceAllowanceController: "",
                         OtherAllowanceController: "",
                         OtherDeductionController: "",
                         OverTimeRateController: "",
                         BankBranchNameController: "",
                         AccountnumberController: "",
                         NomineeNameController: "",
                         NomineeAddressController: "",
                         NomineephoneController: "",
                         NomineeEmailController: "",
                         RelationwithNomineeController: ""
                     )
                       ,));
                     },
                    child: ColorCustomText(fontSize: 13, fontWeight: FontWeight.w500, text: "More info...", letterSpacing: 0.3, textColor: Main_Theme_textColor_tir_Condition)),
              ),
              SizedBox(height: C_height+10,),
              InkWell(
                onTap: () {
                  if(_nIDController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter NID ")));
                  }else{
                    if(_employeeIdController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter Employee ID ")));
                    }else{
                      if(_employeeNameController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter Employee Name")));
                      }else{
                        if(_birthDateController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter Employee BirthDate")));
                        }else{
                          if(_growsSalaryController.text.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter Grows Salary")));
                          }else{
                            if(_joiningDateController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Ennter Joinning Date")));
                            }else{
                              if(shiftplan_id==""){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Select Shift plane")));
                              }else{
                                if(m==false && o==false && f==false){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Select Genger")));
                                }else{
                                  if(Containsvalue.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Select Weekend")));
                                  }else{
                                    if(_phoneController.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Enter Phone Number")));
                                    }else{
                                      if(_employeeRFController.text.isEmpty){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 500),content: Text("Enter Phone Number")));
                                      }else{
                                        SaveOnBoarding();
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }

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

  var shiftplan_id;

  functionval()async{
    var nid_cardd = await http.MultipartFile.fromPath('EmpImageFile', "${_image!.path.toString()}");
   // var image = await http.MultipartFile.fromPath('EmpImageFile', _NID!.path.toString());
    request.files.add(nid_cardd);
  //  request.files.add(image);
  }
  dun(){}

  var request = http.MultipartRequest("POST", Uri.parse("${BASEURL}/${EmployeeOnBoarding}"));

  SaveOnBoarding() async {
    try{
      request.headers.addAll({
        "accept": "application/json",
      //  'Authorization': 'Bearer ${GetStorage().read("api_token")}'
      });


      request.fields["GENDER"] = m==true? "M" :f==true? "F": "O" ;
      request.fields["ID_CARD_NO"] =  _employeeIdController.text;
      request.fields["MOBILE_NO "] =  _phoneController.text;
      request.fields["NID_NO"] =  _nIDController.text;
      request.fields["SHIFT_PLAN"] = "${shiftplan_id}";
      request.fields["WEEKEND1"] = "${Containsvalue[0]}";
      request.fields["WEEKEND2"] =  Containsvalue.length >= 2?"${Containsvalue[1]}" :"";
      request.fields["USERID"] = "${GetStorage().read("mobile_id")}";
      request.fields["EMPLOYEE_NAME_ENGLISH"] = _employeeNameController.text;
      request.fields["JOINING_DATE"] = _joiningDateController.text;
      request.fields["BIRTH_DATE"] = _birthDateController.text;
      request.fields["RF_ID_NO"] = _employeeRFController.text;
      request.fields["EMPLOYEE_STATUS"] = "3";
      request.fields["CLIENTBASE_URL"] = "${GetStorage().read("APPS_IMG_BASEURL")}" ;
      "${_image}"=="null"?dun(): functionval();
      var response = await request.send();
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=============================> ${response.stream}");
      var responseData = await response.stream.toBytes();
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb=============================> ${responseData}");
      var responseString = String.fromCharCodes(responseData);
      print("ccccccccccccccccccccccccccccccccccccccccccc=============================> ${responseData}");
      var  data = jsonDecode(responseString);
      print("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd${data}");
  if(data["msg"]=="success"){
    ElegantNotification(
      borderRadius: BorderRadius.circular(11),
      width: 340,
      iconSize: 25,
      background: presentsent_color,
      progressIndicatorBackground: presentsent_color,
      progressIndicatorColor: absent_color,
      // position: Alignment.center,
      title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Employee added successfully", letterSpacing: 0.3, textColor: Main_Theme_textColor),
      description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Thanks for registration", letterSpacing: 0.3, textColor: Main_Theme_textColor),
      onDismiss: () {
        print('Message when the notification is dismissed');
      }, icon: Icon(Icons.delete_forever,color:Colors.black,),
    ).show(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BootomNatchBarScreen(
      index: 0,
    ),));
  }else{
//    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewEmployeeScreen(),));
    ElegantNotification(
      borderRadius: BorderRadius.circular(11),
      width: 340,
      iconSize: 25,
      background: presentsent_color,
      progressIndicatorBackground: presentsent_color,
      progressIndicatorColor: absent_color,
      // position: Alignment.center,
      title:  ColorCustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "${data["status"]}", letterSpacing: 0.3, textColor: Main_Theme_textColor),
      description: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "PLease Try Again ..", letterSpacing: 0.3, textColor: Main_Theme_textColor),
      onDismiss: () {
        print('Message when the notification is dismissed');
      }, icon: Icon(Icons.delete_forever,color:Colors.black,),
    ).show(context);
  }


    }catch(erroe){
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewEmployeeScreen(),));
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
        _joiningDateController.text=joiningDate;
      });
    }
  }
  String birthdate = DateFormat("dd-MMM-yyyy").format(DateTime.now()).toString();
  Future<void> _birthdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != birthdate) {
      final df = new DateFormat("dd-MMM-yyyy");
      setState(() {
        birthdate = df.format(picked);
        _birthDateController.text=birthdate;
      });
    }
  }

  List<int> Containsvalue=[];


}
