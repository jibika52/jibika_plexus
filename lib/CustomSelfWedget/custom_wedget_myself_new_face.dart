import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jibika_plexus/Controller/SelfDashboardController/self_dashboard_controller.dart';
import 'package:provider/provider.dart';
import '../CustomWidget/CustomText/custom_text.dart';
import '../Utils/constants.dart';

class MyselfNewFaceScreen extends StatefulWidget {
  const MyselfNewFaceScreen({super.key});

  @override
  State<MyselfNewFaceScreen> createState() => _MyselfNewFaceScreenState();
}

class _MyselfNewFaceScreenState extends State<MyselfNewFaceScreen> {
  @override
  void initState() {
    Provider.of<SelfDashboardController>(context,listen: false).selfAdminAdmin_Get_Emp_New_FaceListProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SelfDashboardController>(
      builder: (context, value, child) =>
      Container(
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
              child: ColorCustomText(text:value.selfAdminAdmin_Get_Emp_New_FaceList==null?"New Date ${DateFormat('MMMM yyyy').format(DateTime.now())} Not found": "New Face - ${DateFormat('MMMM yyyy').format(DateTime.now())}",
                fontSize: 13, fontWeight: FontWeight.w500, textColor: Main_Theme_textColor.withOpacity(0.9),letterSpacing: 0.3,),
            ),
            value.selfAdminAdmin_Get_Emp_New_FaceList==null?Container():    Container(
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
                   //   color: CustomButtonColor.withOpacity(0.07),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                          CustomButtonColor.withOpacity(0.3),
                          CustomButtonColor.withOpacity(0.2),
                          CustomButtonColor.withOpacity(0.1),
                        ])
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
                                  image: DecorationImage(image: NetworkImage("${GetStorage().read("APPS_IMG_BASEURL")}${value.selfAdminAdmin_Get_Emp_New_FaceList[index]["EmployeeImage"]}"),fit: BoxFit.fill,)
                              ),

                            ),
                          ],
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 3,right: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3,),
                                  Align(alignment: Alignment.center, child: ColorCustomText(text:"${value.selfAdminAdmin_Get_Emp_New_FaceList[index]["EmployeeNameEnglish"]??""}", fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4, textColor: Main_Theme_textColor,overflow: TextOverflow.ellipsis, ))
                                  , SizedBox(height: 1.5,),
                                  ColorCustomText(overflow: TextOverflow.ellipsis,fontSize: font11, fontWeight: FontWeight.w400, text:"Des.: ${value.selfAdminAdmin_Get_Emp_New_FaceList[index]["DesignationEnglish"]??""}", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.75) )
                                , SizedBox(height: 1.5,)
                                  , ColorCustomText(overflow: TextOverflow.ellipsis,fontSize: 10, fontWeight: FontWeight.w400, text:"Dep.: ${value.selfAdminAdmin_Get_Emp_New_FaceList[index]["DepartmentEnglish"]??""}", letterSpacing: 0.2,textColor:Main_Theme_textColor.withOpacity(0.75)  )
                                , SizedBox(height: 1.7,),
                                   ColorCustomText(fontSize: 10, fontWeight: FontWeight.w400, text:"Phone: ${value.selfAdminAdmin_Get_Emp_New_FaceList[index]["MobileNo"]??""}", letterSpacing: 0.2, textColor:Main_Theme_textColor.withOpacity(0.75)  )

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
      ),
    );
  }
}
