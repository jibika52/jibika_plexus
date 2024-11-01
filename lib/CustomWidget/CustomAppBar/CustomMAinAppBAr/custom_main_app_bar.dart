import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jibika_plexus/Controller/CounterProvider/counter_provider.dart';
import 'package:jibika_plexus/ViewSelf/SelfBootomNavigatonBar/self_bootom_navigation_bar.dart';
import 'package:jibika_plexus/ViewSelf/SelfNotice/self_notice.dart';
import 'package:provider/provider.dart';

import '../../../Utils/constants.dart';
import '../../CustomImage/custom_image.dart';
import '../../CustomText/custom_text.dart';

class CustomMainAppBar extends StatelessWidget {
  CustomMainAppBar({
    super.key,
    required this.leading_image_route,
    required this.center_appbar_text,
    required this.leading_ontab,
    required this.is_need_trailing,
  });
  String leading_image_route;
  String center_appbar_text;
  final GestureTapCallback? leading_ontab;
  bool is_need_trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppbarColor,
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.only(top: 35, left: 15, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: leading_ontab,
              child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Main_Theme_WhiteCollor,
                  ),
                  child: CustomImageSction(
                      height: 33,
                      width: 35,
                      radius: 2,
                      image: "Assets/Logo/jibikalogo3.png"))),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ColorCustomText(
                fontSize: font18,
                fontWeight: FontWeight.w600,
                text: "$center_appbar_text",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                letterSpacing: 1,
                textColor: Main_Theme_WhiteCollor),
          ),
          SizedBox(
            width: 10,
          ),
          is_need_trailing == false
              ? Container()
              : Container(
                  height: 100,
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SelfNoticeScreen(),
                              ));
                        },
                        child: Consumer<CounterProvider>(
                          builder: (context, socketmessage, child) => Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 10),
                                child: CustomImageSction(
                                    height: 25,
                                    width: 25,
                                    radius: 1,
                                    image:
                                        "Assets/DashBoardIcons/notification_icon.png"),
                              ),
                              Positioned(
                                  top: 5,
                                  left: 9,
                                  child: CircleAvatar(
                                    radius: 7,
                                    child: ColorCustomText(
                                        fontSize: font9,
                                        fontWeight: FontWeight.w700,
                                        text: "${socketmessage.setNotificationCounter.toString()}" ==
                                                "null"
                                            ? "0"
                                            : "${socketmessage.setNotificationCounter.toString()}",
                                        letterSpacing: 1,
                                        textColor: notification_color),
                                  ))
                            ],
                          ),
                        ),
                      ),

                      // InkWell(onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => SalfBootomNatchBarScreen(
                      //     currentIndex: 4,
                      //   ),));
                      // }, child: Icon(Icons.more_vert,size: 30,color: Main_Theme_WhiteCollor.withOpacity(0.8) ,))
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
