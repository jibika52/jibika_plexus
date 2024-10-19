import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

import '../../Utils/constants.dart';

class ApprovedDisapprovedButton extends StatelessWidget {

    ApprovedDisapprovedButton({super.key,required this.onTap,required this.disapproved});
    final GestureTapCallback? onTap;
    final GestureTapCallback? disapproved;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/7,right: MediaQuery.of(context).size.width/7),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: disapproved,
              child: Container(
                height: 35,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: absent_color.withOpacity(1.0),
                    border: Border.all(
                        width: 1,
                        color: absent_color
                    )
                ),
                child:  ColorCustomText(textColor: Main_Theme_WhiteCollor,fontSize: font13header, fontWeight: FontWeight.w500, text: "Disapprove",
                    letterSpacing: 0.3),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 35,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: presentsent_color.withOpacity(1.0),
                    border: Border.all(
                        width: 1,
                        color: CustomButtonColor
                    )
                ),
                child: ColorCustomText(fontSize: font13header, fontWeight: FontWeight.w500, text: "Approve",
                    letterSpacing: 0.3, textColor: Main_Theme_WhiteCollor),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
