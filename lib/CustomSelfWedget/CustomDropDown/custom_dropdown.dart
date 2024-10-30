import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.list,
    required this.titletext,
    required this.height,
    required this.width,
    required this.offset,
  });
  List<String> list;
  String titletext;
  double height;
  double width;
  final Offset offset;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          //  '${DateTime.now().year}',
          '${widget.titletext}',
          style: TextStyle(
            fontSize: font12,
            fontWeight: FontWeight.bold,
            color: Main_Theme_textColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: widget.list
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: font12,
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
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                  color: Main_Theme_textColor.withOpacity(0.5), width: 1)),
          direction: DropdownDirection.textDirection,
          maxHeight: widget.height,
          width: widget.width,
          useRootNavigator: true,
          padding: EdgeInsets.only(left: 2, right: 2),
          //   offset:  Offset( -3, -6),
          offset: widget.offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(11),
            trackBorderColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
