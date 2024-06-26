import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';
import '../../CustomText/custom_text.dart';

class CustomDefaultAppBar extends StatelessWidget {
   CustomDefaultAppBar({super.key,required this.onTap, required this.text});
  final GestureTapCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: CustomButtonColor,
      child: AppBar(
        centerTitle: true,
        backgroundColor:CustomButtonColor,
        leading: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("Assets/Icons/appbarbackbutton.png",height: 8,width: 11,color: Main_Theme_WhiteCollor,fit: BoxFit.fill,),
          ),
        ),
        title: ColorCustomText(fontSize: 18, fontWeight: FontWeight.w500, text: "$text", letterSpacing: 0.5,textColor: Main_Theme_WhiteCollor,),
      ),
    );
  }
}
