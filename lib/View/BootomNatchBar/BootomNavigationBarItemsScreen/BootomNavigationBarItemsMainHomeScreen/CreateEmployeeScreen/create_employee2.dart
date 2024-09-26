
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/OnboardingEmployeeController/on_boarding_employee_controller.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCircleDay/custom_circleday.dart';
import 'package:jibika_plexus/CustomWidget/CustomImage/custom_image.dart';
import 'package:jibika_plexus/CustomWidget/CustomImageButton/custom_imagebutton.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:provider/provider.dart';
import '../../../../../Controller/CounterProvider/counter_provider.dart';
import '../../../../../CustomWidget/CustomTExtFormField/Jibika_custom_text_from_field.dart';
import '../../../../../Utils/constants.dart';

class CreateNewEmployeeScreen2 extends StatefulWidget {
  CreateNewEmployeeScreen2({super.key,
    required this.employeeID,
    required this.employeeNID,
    required this.employeeName,
    required this.employeeDateOfBirth,
    required this.employeeMobileNumber,
    required this.ShiftPlane,
    required this.employeeGrowssallary,
    required this.employeeJoiningDate,

  });
  String employeeID;
  String employeeNID;
  String employeeName;
  String employeeDateOfBirth;
  String employeeMobileNumber;
  String ShiftPlane;
  String employeeGrowssallary;
  String employeeJoiningDate;
  @override
  State<CreateNewEmployeeScreen2> createState() => _CreateNewEmployeeScreen2State();
}

class _CreateNewEmployeeScreen2State extends State<CreateNewEmployeeScreen2> {
  TextEditingController _joiningDateController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _nIDController = TextEditingController();
  TextEditingController _employeeNameController = TextEditingController();
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _gmailController = TextEditingController();
  TextEditingController _presentAddressController = TextEditingController();
  TextEditingController _parmenentAddressController = TextEditingController();
  TextEditingController _maraitalStatus = TextEditingController();
  TextEditingController _siftplaneController = TextEditingController();
  TextEditingController _StafCategoryController = TextEditingController();
  TextEditingController _workStationController = TextEditingController();
  TextEditingController _InactiveDateController = TextEditingController();
  TextEditingController _RosterTypeController = TextEditingController();
  TextEditingController _EmployeestatusController = TextEditingController();
  TextEditingController _GrossSalaryController = TextEditingController();
  TextEditingController _BasicSalaryController = TextEditingController();
  TextEditingController _HouserentController = TextEditingController();
  TextEditingController _MedicalAllowanceController = TextEditingController();
  TextEditingController _FoodAllowanceController = TextEditingController();
  TextEditingController _ConvinceAllowanceController = TextEditingController();
  TextEditingController _OtherAllowanceController = TextEditingController();
  TextEditingController _OtherDeductionController = TextEditingController();
  TextEditingController _OverTimeRateController = TextEditingController();
  TextEditingController _BankBranchNameController = TextEditingController();
  TextEditingController _AccountnumberController = TextEditingController();
  TextEditingController _NomineeNameController = TextEditingController();
  TextEditingController _NomineeAddressController = TextEditingController();
  TextEditingController _NomineephoneController = TextEditingController();
  TextEditingController _NomineeEmailController = TextEditingController();
  TextEditingController _RelationwithNomineeController = TextEditingController();
  final _fromKey=GlobalKey<FormState>();
  File ? _image;
  File ? signature;
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

  ///Signature
  Future getSignatureFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        signature = File(pickedFile.path);
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
  int _selectedIndex=0;

  @override
  void initState() {
    _employeeIdController.text =widget.employeeID;
     _nIDController.text =widget.employeeNID;
    _employeeNameController.text =widget.employeeName;
      _birthDateController.text =widget.employeeDateOfBirth;
     _phoneController.text =widget.employeeMobileNumber;
    _siftplaneController.text =widget.ShiftPlane;
    _GrossSalaryController.text =widget.employeeGrowssallary;
   _joiningDateController.text =widget.employeeJoiningDate;


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List  shiftplanelist=Provider.of<OnboardingEmployeeController>(context).GetShiftPlanNWeekendList["shiftplan"];
    List  religionlist=Provider.of<OnboardingEmployeeController>(context).GetShiftPlanNWeekendList["religion"];

    List  departments=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["departments"];
    List  designations=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["designations"];
    List  section=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["section"];
    List  workstation=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["workstation"];
    List  rostertype=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["rostertype"];
    List  rostergroup=Provider.of<OnboardingEmployeeController>(context).GetDepartmentNDesinationList["rostergroup"];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double C_height=8;
    double Cwidth=10;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context),
          text: "Primary Information")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 10,top: 10),
            child: AnimatedToggleSwitch<int>.size(
              height: 35,
              current: max(_selectedIndex, 0),
              style: ToggleStyle(
                backgroundColor: home_default_color,
                indicatorColor: presentsent_color,
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                indicatorBorderRadius: BorderRadius.circular(30),

              ),
              values:  [0, 1, 2, 4],
              iconOpacity: 1.0,
              selectedIconScale: 1.0,
              indicatorSize: Size.fromWidth(100),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              spacing: 2.0,
              customSeparatorBuilder: (context, local, global) {
                final opacity =
                ((global.position - local.position).abs() - 0.5)
                    .clamp(0.0, 1.0);
                return VerticalDivider(
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.white38.withOpacity(opacity));
              },
              customIconBuilder: (context, local, global) {
                final text = nameList[local.index];
                return Center(
                    child: Text(text,
                        style: GoogleFonts.poppins(
                          fontSize : 13,
                            fontWeight : FontWeight.w400,
                            letterSpacing :  0.3,
                            color: Color.lerp(Colors.black, Colors.white,
                                local.animationValue))));
              },
              borderWidth: 1.0,
              onChanged: (i) => setState(() => _selectedIndex = i),
            ),
          ),


          _selectedIndex==0?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10
              ),
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------

                    SizedBox(height: C_height,),
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
                                  :
                                 Container(
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
                                          child: CustomImageSction(height: 20, width: 15, radius: 1, image: "Assets/DashBoardIcons/person1.png" ),
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
                                child:
                                _NID!=null?ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.file(_NID!.renameSync(_NID!.path),height: 80,width: 126, fit: BoxFit.fill,))
                                    :
                                Stack(
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
                    SizedBox(height: C_height,),   /// Registration part ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                    child: Column(
                      children: [
                        JibikaCustomTextFromField(
                            readOnly: false,
                            controller: _employeeIdController,
                            height: 50,
                            img: "Assets/DashBoardIcons/personalcard.png",
                            hinttext: "Id Card No.",
                            keyboardType: TextInputType.number,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            readOnly: false,
                            controller: _nIDController,
                            height: 50,
                            img: "Assets/PrimaryInformation/people (1).png",
                            hinttext: "NID Card No",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),
                        JibikaCustomTextFromField(
                            readOnly: false,
                            controller: _employeeNameController,
                            height: 50,
                            img: "Assets/PrimaryInformation/people (2).png",
                            hinttext: "Employee Name",
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
                            controller: _fatherNameController,
                            height: 50,
                            img: "Assets/PrimaryInformation/father.png",
                            hinttext: "Father Name",
                            keyboardType: TextInputType.text,
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
                            controller: _gmailController,
                            height: 50,
                            img: "Assets/DashBoardIcons/messagetext.png",
                            hinttext: "Enter Email",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _presentAddressController,
                            height: 50,
                            img: "Assets/DashBoardIcons/location.png",
                            hinttext: "Present Address",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                        JibikaCustomTextFromField2(
                            controller: _parmenentAddressController,
                            height: 50,
                            img: "Assets/DashBoardIcons/location.png",
                            hinttext: "Permanent Address",
                            keyboardType: TextInputType.text,
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
                            hinttext: "Joining date",
                            keyboardType: TextInputType.text,
                            obscureText: false),
                        SizedBox(height: C_height,),

                      ],
                    ),
                    ),
                    Consumer<OnboardingEmployeeController>(
                    builder: (context, value, child) =>
                    Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: DropdownButton<String>(
                    underline: Container(height: 1.7,color: Main_Theme_textColor.withOpacity(0.1),),
                    value: shiftplan_id,
                    hint: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Shift Plane", letterSpacing: 0.3),
                    // Create the dropdown items using the list of maps
                    items: shiftplanelist.map((shift) {
                    return DropdownMenuItem<String>(
                    value: "${shift['Code']}",
                    child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3), // Display the EnglishName
                    );
                    }).toList(),

                    // Handle change in selected value
                    onChanged: (String? newValue) {
                    setState(() {
                    shiftplan_id = newValue;
                    });
                    },
                    ),
                    ),
                    ),
                    Consumer<OnboardingEmployeeController>(
                    builder: (context, value, child) =>
                    Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: DropdownButton<String>(
                    underline: Container(height: 1.7,color: Main_Theme_textColor.withOpacity(0.1),),
                    value: relijion_id,
                    hint: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Religion", letterSpacing: 0.3),
                    // Create the dropdown items using the list of maps
                    items: religionlist.map((shift) {
                    return DropdownMenuItem<String>(
                    value: "${shift['Code']}",
                    child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3), // Display the EnglishName
                    );
                    }).toList(),

                    // Handle change in selected value
                    onChanged: (String? newValue) {
                    setState(() {
                    shiftplan_id = newValue;
                    });
                    },
                    ),
                    ),
                    ),
                    SizedBox(height: C_height),
                    /// Weekend-----------------------------------------
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
                    SizedBox(height: C_height),
                    /// Gender------------------------------------------
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
                            }, backgroundColor:o==true?Main_Theme_textColor_tir_Condition : home_default_color,textColor:o==true?Main_Theme_WhiteCollor: Main_Theme_textColor.withOpacity(0.4),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                            Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),

                          ],
                        )
                    ),
                    SizedBox(height: C_height+10,),
                    /// Marital Status------------------------------------------
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Marital Status", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.7),)),
                    SizedBox(height: C_height,),
                    Consumer<CounterProvider>(
                      builder: (context, value, child) =>
                       Container(
                          height: 35,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<CounterProvider>(context,listen: false).getSingleStatus();
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(radius: 11,backgroundColor: value.is_single==true? Main_Theme_textColor:home_default_color ,),
                                    SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 13, fontWeight:FontWeight.w500, text: "Single", letterSpacing: 0.4,textColor: Main_Theme_textColor,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<CounterProvider>(context,listen: false).getMarriedStatus();
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(radius: 11,backgroundColor: value.is_single==false? Main_Theme_textColor :home_default_color ,),
                                    SizedBox(width: 7,),
                                    ColorCustomText(fontSize: 13, fontWeight:FontWeight.w500, text: "Married", letterSpacing: 0.4,textColor:  Main_Theme_textColor,)
                                  ],
                                ),
                              ),


                              Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),
                              Container(height: 30,width: 30,margin: EdgeInsets.only(right: 10),),

                            ],
                          )
                      ),
                    ),
                    SizedBox(height: C_height+10,),
                    /// Signature------------------------------------------
                    Container(
                      height: 139,width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Signature", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                InkWell(
                                  onTap: () {
                                    getSignatureFromGallery();
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 146,
                                    margin: EdgeInsets.only(top: 5,bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: presentsent_color.withOpacity(0.4)),
                                     // color: Colors.blue,
                                    ),
                                    child:signature!=null? ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: Image.file(signature!.renameSync(signature!.path),height: 80,width: 80, fit: BoxFit.fill,))
                                        :
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("Assets/PrimaryInformation/email.png",height: 31,width: 45,fit: BoxFit.fill,),
                                        ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Browse file", letterSpacing: 0.1, textColor: presentsent_color),
                                      ],
                                    ),
                                  ),
                                ),
                                ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text: "Accepted File Types: .jpeg and .png", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),

                              ],
                            ),
                           ),
                          ),

                          Expanded(
                              child: Container(
                                // child: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "QR code", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                //     Container(
                                //       height: 80,
                                //       width: 146,
                                //       margin: EdgeInsets.only(top: 5,bottom: 5),
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(7),
                                //         border: Border.all(color: presentsent_color.withOpacity(0.4)),
                                //         // color: Colors.blue,
                                //       ),
                                //       child:  Column(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: [
                                //           Image.asset("Assets/PrimaryInformation/qrcode.png",height: 47,width: 48,fit: BoxFit.fill,),
                                //       //    ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Browse file", letterSpacing: 0.1, textColor: presentsent_color),
                                //         ],
                                //       ), ),
                                //     ColorCustomText(fontSize: 14, fontWeight: FontWeight.w400, text: " ", letterSpacing: 0.1, textColor: Main_Theme_textColor.withOpacity(0.8)),
                                //
                                //   ],
                                // ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),
            
                  ],
                ),
              ),
            ),
          )
              :
          _selectedIndex==1?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          JibikaCustomTextFromField(
                              readOnly: false,
                              controller: _StafCategoryController,
                              height: 50,
                              img: "Assets/PrimaryInformation/father.png",
                              hinttext: "Staff Category",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Department", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: department_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        department_id = newValue.toString();
                                      });
                                    },
                                    items: departments.map((shift) {
                                      return DropdownMenuItem(
                                        child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                                        value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Designation", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: designation_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        designation_id = newValue.toString();
                                      });
                                    },
                                    items: designations.map((shift) {
                                      return DropdownMenuItem(
                                       child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),

                                      value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Section", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: section_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        section_id = newValue.toString();
                                      });
                                    },
                                    items: section.map((shift) {
                                      return DropdownMenuItem(
                                        child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                                        value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Work Station", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: workstation_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        workstation_id = newValue.toString();
                                      });
                                    },
                                    items: workstation.map((shift) {
                                      return DropdownMenuItem(
                                        child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                                        value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Section", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: section_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        section_id = newValue.toString();
                                      });
                                    },
                                    items: section.map((shift) {
                                      return DropdownMenuItem(
                                        child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                                        value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),
                          Consumer<OnboardingEmployeeController>(
                            builder: (context, value, child) =>
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                    enableFeedback: true,
                                    autofocus: false,
                                    isExpanded: true,
                                    hint: InkWell(
                                      onTap: () {},
                                      child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Roster Type", letterSpacing: 0.3), // Display the EnglishName

                                    ),
                                    // Not necessary for Option 1
                                    value: rostertype_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rostertype_id = newValue.toString();
                                      });
                                    },
                                    items: rostertype.map((shift) {
                                      return DropdownMenuItem(
                                        child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),
                                        value: "${shift['Code']}",
                                      );
                                    }).toList(),
                                  ),
                                ),
                          ),


                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: DropdownButton(
                              enableFeedback: true,
                              autofocus: false,
                              isExpanded: true,
                              hint: InkWell(
                                  onTap: () {},
                                child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "Select Roster Group", letterSpacing: 0.3), // Display the EnglishName

                              ),
                              // Not necessary for Option 1
                              value: rostergroup_id,
                              onChanged: (newValue) {
                                setState(() {
                                  rostergroup_id = newValue.toString();
                                });
                              },
                              items: rostergroup.map((shift) {
                                return DropdownMenuItem(
                                  child: CustomText(fontSize: 13, fontWeight: FontWeight.w400, text: "${shift['EnglishName']}", letterSpacing: 0.3),

                                  value: "${shift['Code']}",
                                );
                              }).toList(),
                            ),
                          ),
                          JibikaCustomTextFromField2(
                              controller: _InactiveDateController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Inactive Date",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )
          :
          _selectedIndex==2?
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _GrossSalaryController,
                              height: 50,
                              img: "Assets/PrimaryInformation/money_payment.png",
                              hinttext: "Gross Salary",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _BasicSalaryController,
                              height: 50,
                              img: "Assets/PrimaryInformation/money_payment.png",
                              hinttext: "Basic Salary",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _HouserentController,
                              height: 50,
                              img: "Assets/PrimaryInformation/home-svgrepo-com 1.png",
                              hinttext: "House rent",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _MedicalAllowanceController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people.png",
                              hinttext: "Medical Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _FoodAllowanceController,
                              height: 50,
                              img: "Assets/PrimaryInformation/gender-7 1.png",
                              hinttext: "Food Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),


                          JibikaCustomTextFromField2(
                              controller: _ConvinceAllowanceController,
                              height: 50,
                              img: "Assets/PrimaryInformation/convienceallowence.png",
                              hinttext: "Convince Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _OtherAllowanceController,
                              height: 50,
                              img: "Assets/PrimaryInformation/other_allowence.png",
                              hinttext: "Other Allowance",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),


                          JibikaCustomTextFromField2(
                              controller: _OtherDeductionController,
                              height: 50,
                              img: "Assets/PrimaryInformation/other_deduction.png",
                              hinttext: "Other Deduction",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _OverTimeRateController,
                              height: 50,
                              img: "Assets/PrimaryInformation/clock.png",
                              hinttext: "Over Time Rate",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),

                          JibikaCustomTextFromField2(
                              controller: _BankBranchNameController,
                              height: 50,
                              img: "Assets/PrimaryInformation/bank.png",
                              hinttext: "Bank & Branch Name",
                              keyboardType: TextInputType.text,
                              obscureText: false),

                          JibikaCustomTextFromField2(
                              controller: _AccountnumberController,
                              height: 50,
                              img: "Assets/PrimaryInformation/calendar.png",
                              hinttext: "Account number",
                              keyboardType: TextInputType.text,
                              obscureText: false),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )
              :
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10
              ),
              padding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Primary Information ---------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(left: 0,right: 10,),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            height: 102,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getImageFromGallery();
                                      },
                                      child: Container(
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
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
    _image==null ?   ClipRRect(
                                              borderRadius: BorderRadius.circular(56),
                                              child: Container(
                                                height: 56,
                                                width: 56,
                                                color:  Main_Theme_textColor.withOpacity(0.07),
                                                padding: EdgeInsets.all(10),
                                                child: CustomImageSction(height: 20, width: 15, radius: 1, image: "Assets/DashBoardIcons/person1.png")


                                              ),
                                            ):
    Container(
      height: 56,
        width: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image:FileImage(_image!.renameSync(_image!.path)),fit: BoxFit.fill)
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
                                    ),
                                    SizedBox(height: 5,),
                                    CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "Upload / Take Nominee photo", letterSpacing: 0.3),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _NomineeNameController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (2).png",
                              hinttext: "Nominee Name",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _NomineeAddressController,
                              height: 50,
                              img: "Assets/PrimaryInformation/people (1).png",
                              hinttext: "Nominee Address",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _NomineephoneController,
                              height: 50,
                              img: "Assets/PrimaryInformation/phone.png",
                              hinttext: "Mobile number",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField(
                        readOnly: false,
                              controller: _NomineeEmailController,
                              height: 50,
                              img: "Assets/PrimaryInformation/sms.png",
                              hinttext: "Nominee E-mail",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height,),
                          JibikaCustomTextFromField2(
                              controller: _RelationwithNomineeController,
                              height: 50,
                              img: "Assets/PrimaryInformation/relation.png",
                              hinttext: "Relation with Nominee",
                              keyboardType: TextInputType.text,
                              obscureText: false),
                          SizedBox(height: C_height+5,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70),
                      child: CustomImageButton(height: 45, img: "Assets/PrimaryInformation/save 1.png", text: "Save",
                          textColor: Colors.white, b_color: CustomButtonColor),
                    ),
                    SizedBox(height: C_height+20,),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
List nameList=[
  "Personal",
  "Official",
  "Salary",
  "Nominee",
];
  /// for gender
  bool m=false;
  bool f=false;
  bool o=false;
  /////////////////////////
  bool sat=false;
  bool sun=false;
  bool mon=false;
  bool Tue=false;
  bool Wed=false;
  bool Thu=false;
  bool fri=false;

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
  String?  shiftplan_id;
  String?  department_id;
  String?  relijion_id;
  String?  designation_id;
  String ? section_id;
  String ? workstation_id;
  String ? rostertype_id;
  String ? rostergroup_id;
  List<int> Containsvalue=[];
}
