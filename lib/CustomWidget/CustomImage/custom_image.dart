import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CustomImageSction extends StatelessWidget {
    CustomImageSction({super.key,
    required this.height,
    required this.width,
    required this.radius,
      required this.image,
    });
  double   height;
  double width;
  double  radius;
  String ? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
         image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill),
      ),
   //   child: Image.asset("$image",fit: BoxFit.fill,color: Colors.white,),
    );
  }
}

class CustomImageSctionNetwork extends StatelessWidget {
  CustomImageSctionNetwork({super.key,
    required this.height,
    required this.width,
    required this.radius,
      required this.image,
    });
  double   height;
  double width;
  double  radius;
  String ? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
         image: DecorationImage(image: NetworkImage("${GetStorage().read("APPS_IMG_BASEURL")}$image"),fit: BoxFit.fill),
      ),
   //   child: Image.asset("$image",fit: BoxFit.fill,color: Colors.white,),
    );
  }
}

class CustomImageSction2 extends StatelessWidget {
    CustomImageSction2({super.key,
    required this.height,
    required this.width,
    required this.radius,
      required this.image,
      required this.img_color,
    });
  double   height;
  double width;
  double  radius;
  String ? image;
  Color img_color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
       child: Image.asset("$image",fit: BoxFit.fill,color: img_color,),
    );
  }
}
