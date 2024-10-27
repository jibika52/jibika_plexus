// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
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
//         _kGoogle = CameraPosition(
//           target: LatLng(_currentPosition!.latitude,_currentPosition!.latitude),
//           zoom: 14,
//         );
//         _currentAddress = "name = ${place.name}, street =${place.street.toString()}, subThoroughfare=${place.subThoroughfare}, subLocality=${place.subLocality}, administrativeArea=${place.administrativeArea}, isoCountryCode=${place.isoCountryCode},locality=${place.locality}, postalCode=${place.postalCode}, subAdministrativeArea=${place.subAdministrativeArea}, thoroughfare${place.thoroughfare}, country=${place.country},";
//         print(_currentAddress);
//       });
//     } catch (e) {
//       print(e);
//     }
//
//   }
//
//
//
//
//
// // created controller to display Google Maps
//   Completer<GoogleMapController> _controller = Completer();
//   //on below line we have set the camera position
//   static late CameraPosition _kGoogle =   CameraPosition(
//     target:  LatLng(23.8100645, 90.4221128),
//     zoom: 12,
//   );
//
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polyline = {};
//
//   // list of locations to display polylines
//   List<LatLng> latLen = [
//     LatLng(23.812989,90.412717),
//     LatLng(23.819585,90.420420),
//     LatLng(23.814421,90.424980),
//     LatLng(23.810402,90.421405),
//     // LatLng(16.166700, 74.833298),
//     //  LatLng(12.971599, 77.594563),
//   ];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     permissionn();
//     _getCurrentLocation();
//
//     // declared for loop for various locations
//     for(int i=0; i<latLen.length; i++){
//       _markers.add(
//         // added markers
//           Marker(
//             markerId: MarkerId(i.toString()),
//             position: latLen[i],
//             infoWindow: InfoWindow(
//               title: 'HOTEL',
//               snippet: '${latLen[i]}',
//             ),
//             icon: BitmapDescriptor.defaultMarker,
//           )
//       );
//       setState(() {
//
//       });
//       _polyline.add(
//           Polyline(
//             polylineId: PolylineId('1'),
//             points: latLen,
//             width: 2,
//             color: Colors.red,
//           )
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0F9D58),
//         // title of app
//         title: Text("GFG"),
//       ),
//       body: Container(
//         child: SafeArea(
//           child: GoogleMap(
//             //given camera position
//             initialCameraPosition: _kGoogle,
//             // on below line we have given map type
//             mapType: MapType.normal,
//             // specified set of markers below
//             markers: _markers,
//             // on below line we have enabled location
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             // on below line we have enabled compass location
//             compassEnabled: true,
//             // on below line we have added polylines
//             polylines: _polyline,
//             // displayed google map
//             onMapCreated: (GoogleMapController controller){
//               _controller.complete(controller);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
// }
