
import 'package:flutter/material.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
    CustomTextFormField({super.key,
      required this.maxline,
      required this.height,
      required this.hintext,
      required this.controller,
      this.keyboardType,
      this.onChanged,
    });
  String ?  hintext;
  int ? maxline;
 late double  height;
   bool? readOnly;
    final TextEditingController? controller;
     TextInputType? keyboardType;
    final ValueChanged<String>? onChanged;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
class _CustomTextFormFieldState extends State<CustomTextFormField> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: 15,right: 15
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType:widget.keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter  numbers only";
          } else {
            return null;
          }
        },
        // final TextEditingController? controller;
        controller: widget.controller,
        maxLines: widget.maxline,

        decoration: InputDecoration(
            fillColor: icons_orrange_color,
            hintText: "${widget.hintext}",
            errorStyle: TextStyle(
              fontSize: 0.1,
            ),
            contentPadding: EdgeInsets.only(left: 15,right: 0,top: 10,bottom: 0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: icons_green_color,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color:icons_green_color,
                width: 2.0,
              ),
            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: icons_orrange_color,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(9),
            )
        ),
      ),
    );
  }
}
