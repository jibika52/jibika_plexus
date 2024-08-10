// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class Googlemap extends StatefulWidget {
//   const Googlemap({super.key});
//
//   @override
//   State<Googlemap> createState() => _GooglemapState();
// }
//
// class _GooglemapState extends State<Googlemap> {
//
//   Position ? _currentPosition;
//   String ?  _currentAddress;
//   void permissionn()async{
//     LocationPermission permission = await Geolocator.requestPermission();
//     print(permission);
//   }
//   late Position position;
//   _getCurrentLocation() async{
//     position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//       print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${_currentPosition!.longitude}");
//       print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${_currentPosition}");
//     });
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           _currentPosition!.latitude,
//           _currentPosition!.longitude
//       );
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress = "name = ${place.name}, street =${place.street.toString()}, subThoroughfare=${place.subThoroughfare}, subLocality=${place.subLocality}, administrativeArea=${place.administrativeArea}, isoCountryCode=${place.isoCountryCode},locality=${place.locality}, postalCode=${place.postalCode}, subAdministrativeArea=${place.subAdministrativeArea}, thoroughfare${place.thoroughfare}, country=${place.country},";
//         print(_currentAddress);
//       });
//     } catch (e) {
//       print(e);
//     }
//
//   }
//
//   @override
//   void initState() {
//     permissionn();
//     _getCurrentLocation();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.red,
//       ),
//     );
//   }
// }
