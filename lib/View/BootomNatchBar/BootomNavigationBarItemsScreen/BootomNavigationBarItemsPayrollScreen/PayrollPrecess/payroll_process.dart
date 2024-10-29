import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomCheckSection/custom_check_section.dart';

import '../../../../../CustomWidget/CustomCalender/custom_calender.dart';
import '../../../../../CustomWidget/CustomImage/custom_image.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Utils/constants.dart';

class PAyrollProcessScreen extends StatefulWidget {
  const PAyrollProcessScreen({super.key});

  @override
  State<PAyrollProcessScreen> createState() => _PAyrollProcessScreenState();
}

class _PAyrollProcessScreenState extends State<PAyrollProcessScreen> {
  double animatedheight = 0;
  double animatwidth = 130;
  double lineWidth = 7.0;
  double C_height = 5;
  bool _is_click_date = false;
  int selectedmonth = 0;
  List MonthList = [
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
    "Dec"
  ];
  int total_Amount = 100000000;
  final List<String> items = [
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
  ];
  final List<String> itemss = [
    'AAAAAAAA',
    'BBBBBBBBBBBB',
    'CCCCCCC',
    'DDDDDDDDD',
    'EEEEEEE',
    '2027',
    '2028',
    '2029',
  ];
  String? selectedValue;
  String? selectedValue2;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: home_default_color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomDefaultAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Payroll Process")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part-----------------------
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Main_Theme_WhiteCollor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // color: Colors.red,
                        border: Border.all(
                            color: Main_Theme_textColor.withOpacity(0.15),
                            width: 1.5)),
                    padding: EdgeInsets.only(left: 7, right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageSction(
                            height: 24,
                            width: 24,
                            radius: 1,
                            image: "Assets/Icons/share2.png"),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 32,
                        width: animatwidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Main_Theme_WhiteCollor,
                            border: Border.all(
                                color: Main_Theme_textColor.withOpacity(0.7),
                                width: 1)),
                        padding: EdgeInsets.only(
                            left: 7, right: 7, top: 5, bottom: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _is_click_date = !_is_click_date;
                              if (_is_click_date == true) {
                                if (w > 530) {
                                  animatwidth = 530;
                                } else {
                                  animatwidth = w * 0.90;
                                }
                              } else {
                                animatwidth = 100.0;
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _is_click_date == false
                                  ? ColorCustomText(
                                      fontSize: font12header,
                                      fontWeight: FontWeight.w500,
                                      text: "${MonthList[selectedmonth]}",
                                      letterSpacing: 0.3,
                                      textColor: presentsent_color)
                                  : Expanded(
                                      child: ListView.builder(
                                        itemCount: MonthList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  selectedmonth = index;
                                                  _is_click_date =
                                                      !_is_click_date;
                                                  if (_is_click_date == true) {
                                                    animatwidth = w * 0.95;
                                                  } else {
                                                    animatwidth = 130.0;
                                                  }
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0, left: 5, top: 0),
                                              child:
                                                  Text("${MonthList[index]}"),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                              Container(
                                height: 12,
                                width: 1,
                                color: Main_Theme_textColor,
                                margin: EdgeInsets.only(left: 5, right: 7),
                              ),
                              Container(
                                height: 42,
                                width: 50,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: Text(
                                      '${DateTime.now().year}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Main_Theme_textColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: items
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_downward,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Main_Theme_textColor,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      scrollPadding: EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          border: Border.all(
                                              color: Main_Theme_textColor
                                                  .withOpacity(0.5),
                                              width: 1)),
                                      direction:
                                          DropdownDirection.textDirection,
                                      maxHeight: 200,
                                      width: 65,
                                      useRootNavigator: true,
                                      padding:
                                          EdgeInsets.only(left: 2, right: 2),
                                      offset: Offset(-3, -6),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: Radius.circular(11),
                                        trackBorderColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF5D5F6E)),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),

            /// Second part-----------------------
            Container(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 15),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Main_Theme_WhiteCollor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: home_default_color,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ColorCustomText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  text: "From",
                                  letterSpacing: 0.2,
                                  textColor: Main_Theme_textColor),
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Main_Theme_WhiteCollor),
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1.0, left: 10),
                                      child: ColorCustomText(
                                        text: "${selected2Datee}",
                                        textColor:
                                            Main_Theme_textColor.withOpacity(
                                                0.6),
                                        fontSize: font11,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    /// ---------- Custom Calender Part --------- ///
                                    InkWell(
                                        onTap: () {
                                          _select2Date(context);
                                        },
                                        child: Container(
                                            color: Main_Theme_WhiteCollor,
                                            child: CustomImageSction(
                                                height: 30,
                                                width: 25,
                                                radius: 3,
                                                image:
                                                    "Assets/DashBoardIcons/clender.png"))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ColorCustomText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  text: "To",
                                  letterSpacing: 0.2,
                                  textColor: Main_Theme_textColor),
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Main_Theme_WhiteCollor),
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1.0, left: 10),
                                      child: ColorCustomText(
                                        text: "${selected2Datee}",
                                        textColor:
                                            Main_Theme_textColor.withOpacity(
                                                0.6),
                                        fontSize: font11,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    /// ---------- Custom Calender Part --------- ///
                                    InkWell(
                                        onTap: () {
                                          _select2Date(context);
                                        },
                                        child: Container(
                                            color: Main_Theme_WhiteCollor,
                                            child: CustomImageSction(
                                                height: 30,
                                                width: 25,
                                                radius: 3,
                                                image:
                                                    "Assets/DashBoardIcons/clender.png"))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    height: 43,
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColorCustomText(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            text: "Payment Date",
                            letterSpacing: 0.2,
                            textColor: Main_Theme_textColor),
                        Container(
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Main_Theme_WhiteCollor,
                              border: Border.all(
                                  color:
                                      Main_Theme_textColor.withOpacity(0.5))),
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 1.0, left: 10),
                                child: ColorCustomText(
                                  text: "${selected2Datee}",
                                  textColor:
                                      Main_Theme_textColor.withOpacity(0.6),
                                  fontSize: font11,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              /// ---------- Custom Calender Part --------- ///
                              InkWell(
                                  onTap: () {
                                    _select2Date(context);
                                  },
                                  child: Container(
                                      color: Main_Theme_WhiteCollor,
                                      child: CustomImageSction(
                                          height: 30,
                                          width: 25,
                                          radius: 3,
                                          image:
                                              "Assets/DashBoardIcons/clender.png"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 43,
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 22,
                            width: 150,
                            child: CustomSaveInfoSection(text: "Marge Bonus")),
                        Container(
                          height: 32,
                          width: 140,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Main_Theme_textColor.withOpacity(0.4),
                                  width: 1.3)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select bonus',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Main_Theme_textColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: itemss
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue2,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue2 = value;
                                });
                              },
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_downward,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Main_Theme_textColor,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                scrollPadding: EdgeInsets.all(0.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: Main_Theme_textColor.withOpacity(
                                            0.5),
                                        width: 1)),
                                direction: DropdownDirection.textDirection,
                                useRootNavigator: true,
                                padding: EdgeInsets.only(left: 2, right: 2),
                                offset: Offset(-3, -5),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: Radius.circular(11),
                                  trackBorderColor: MaterialStateProperty.all(
                                      Color(0xFF5D5F6E)),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 22,
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: CustomSaveInfoSection(text: "Marge Bonus")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selected_index = 0;
  String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMEd();
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }
}
