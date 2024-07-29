import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../CustomWidget/CustomText/custom_text.dart';
import '../Utils/constants.dart';

class MyselfNewFaceScreen extends StatelessWidget {
  const MyselfNewFaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top:apps_div_margin ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Main_Theme_WhiteCollor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorCustomText(text: "New Face - ${DateFormat('MMMM yyyy').format(DateTime.now())}",
              fontSize: 13, fontWeight: FontWeight.w500, textColor: Main_Theme_textColor.withOpacity(0.9),letterSpacing: 0.3,),
          ),
          Container(
            height: 175,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 8),
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 170,
                  width: 130,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: CustomButtonColor.withOpacity(0.07),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [

                          Positioned(
                            child: Container(
                              alignment: FractionalOffset.center,
                              transform: new Matrix4.identity()
                                ..rotateZ(4 * 3.1415927 / 180),

                              width: 60,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: absent_color.withOpacity(0.4),
                              ),

                            ),
                          ),
                          Container(
                            width: 60,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(image: AssetImage("Assets/DashBoardIcons/man_picture.png"),fit: BoxFit.fill,)
                            ),

                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 3,),
                                ColorCustomText(text:"Uzzal Biswas", fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4, textColor: Main_Theme_textColor,overflow: TextOverflow.ellipsis, )
                                , SizedBox(height: 1.5,),
                                ColorCustomText(overflow: TextOverflow.ellipsis,fontSize: font11, fontWeight: FontWeight.w400, text:"Hr Admin Manager", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.75) )
                              , SizedBox(height: 1.5,)
                                , ColorCustomText(overflow: TextOverflow.ellipsis,fontSize: 10, fontWeight: FontWeight.w400, text:"uzzal.171.cse@gmail.com", letterSpacing: 0.2,textColor:Main_Theme_textColor.withOpacity(0.75)  )
                              , SizedBox(height: 1.7,),
                                 ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text:"01889173335", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.75)  )

                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}
