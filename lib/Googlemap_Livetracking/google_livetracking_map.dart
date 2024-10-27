// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// ///------------second map------------------///
// class TestMapScreen extends StatefulWidget {
//
//
//
//   TestMapScreen({Key? key,required this.lattt,required this.lannn,required this.startLatitude, required this.startLongitude}) : super(key: key);
//   double lattt;
//   double lannn;
//   double startLatitude;
//   double startLongitude;
//   @override
//   _TestMapScreenState createState() => _TestMapScreenState();
// }
//
// class _TestMapScreenState extends State<TestMapScreen> {
//   late GoogleMapController googleMapController;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   ///-------current location...................
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       height: height,
//       width: width,
//       child: Scaffold(
//         key: _scaffoldKey,
//         body: Stack(
//           children: <Widget>[
//             // Map View
//             GoogleMap(
//               markers: Set<Marker>.from(markers),
//               initialCameraPosition: _initialLocation,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: false,
//               mapType: MapType.normal,
//               zoomGesturesEnabled: true,
//               zoomControlsEnabled: false,
//               polylines: Set<Polyline>.of(polylines.values),
//               onMapCreated: (GoogleMapController controller) {
//                 mapController = controller;
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//
//   CameraPosition _initialLocation = CameraPosition(
//       target: LatLng(23.8223, 90.3654));
//   late GoogleMapController mapController;
//
//   String _startAddress = '';
//   String _destinationAddress = '';
//   String? _placeDistance;
//
//   Set<Marker> markers = {};
//
//   late PolylinePoints polylinePoints;
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   // Method for calculating the distance between two places
//   Future<bool> _calculateDistance() async {
//     try {
//       ///--------------------------startLatitude---------------------///
//       double startLatitude=double.parse("${widget.startLatitude}");
//       double startLongitude=double.parse("${widget.startLongitude}");
//
//       //   double destinationLatitude=double.parse("${GetStorage().read("receivedRideRequestData")["user"]["desLat"]}");
//       //       double destinationLongitude= double.parse("${GetStorage().read("receivedRideRequestData")["user"]["deLon"]}");
//       double destinationLatitude=double.parse("${widget.lattt}");
//       double destinationLongitude=double.parse("${widget.lannn}");
//
//
//
//
//       ///-----------------------------------------------------------------
//       String startCoordinatesString = '($startLatitude, $startLongitude)';
//       String destinationCoordinatesString =
//           '($destinationLatitude, $destinationLongitude)';
//
//       // Start Location Marker
//       Marker startMarker = Marker(
//         markerId: MarkerId(startCoordinatesString),
//         position: LatLng(startLatitude, startLongitude),
//         infoWindow: InfoWindow(
//           title: 'Start $startCoordinatesString',
//           snippet: _startAddress,
//         ),
//         //   icon:Icon(Icons.account_balance_sharp),
//       );
//
//       // Destination Location Marker
//       Marker destinationMarker = Marker(
//         markerId: MarkerId(destinationCoordinatesString),
//         position: LatLng(destinationLatitude, destinationLongitude),
//         infoWindow: InfoWindow(
//           title: 'Destination $destinationCoordinatesString',
//           snippet: _destinationAddress,
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//       );
//
//       // Adding the markers to the list
//       markers.add(startMarker);
//       markers.add(destinationMarker);
//
//       print(
//         'START COORDINATES: ($startLatitude, $startLongitude)',
//       );
//       print(
//         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
//       );
//
//       // Calculating to check that the position relative
//       // to the frame, and pan & zoom the camera accordingly.
//       double miny = (startLatitude <= destinationLatitude)
//           ? startLatitude
//           : destinationLatitude;
//       double minx = (startLongitude <= destinationLongitude)
//           ? startLongitude
//           : destinationLongitude;
//       double maxy = (startLatitude <= destinationLatitude)
//           ? destinationLatitude
//           : startLatitude;
//       double maxx = (startLongitude <= destinationLongitude)
//           ? destinationLongitude
//           : startLongitude;
//
//       double southWestLatitude = miny;
//       double southWestLongitude = minx;
//
//       double northEastLatitude = maxy;
//       double northEastLongitude = maxx;
//
//       // Accommodate the two locations within the
//       // camera view of the map
//       mapController.animateCamera(
//         CameraUpdate.newLatLngBounds(
//           LatLngBounds(
//             northeast: LatLng(northEastLatitude, northEastLongitude),
//             southwest: LatLng(southWestLatitude, southWestLongitude),
//           ),
//           100.0,
//         ),
//       );
//       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
//           destinationLongitude);
//
//       double totalDistance = 0.0;
//       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//         totalDistance += _coordinateDistance(
//           polylineCoordinates[i].latitude,
//           polylineCoordinates[i].longitude,
//           polylineCoordinates[i + 1].latitude,
//           polylineCoordinates[i + 1].longitude,
//         );
//       }
//
//       setState(() {
//         _placeDistance = totalDistance.toStringAsFixed(2);
//         print('DISTANCE:================================================================ ');
//         print('DISTANCE:================================================================ $_placeDistance km');
//       });
//
//       return true;
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }
//
//   // Formula for calculating distance between two coordinates
//   // https://stackoverflow.com/a/54138876/11910277
//   // double _coordinateDistance(lat1, lon1, lat2, lon2) {
//   double _coordinateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//
//     return 12742 * asin(sqrt(a));
//
//   }
//
//   // Create the polylines for showing the route between two places
//   _createPolylines(
//       double startLatitude,
//       double startLongitude,
//       double destinationLatitude,
//       double destinationLongitude,
//       ) async {
//     polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: "AIzaSyDMnTS3Bada4m_-coPcG46JMShU1GOsRIc", request: PolylineRequest(
//         origin: PointLatLng(startLatitude, startLongitude),
//         destination:  PointLatLng(destinationLatitude, destinationLongitude),
//         mode: TravelMode.driving,
//         wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
//     ),
//     );
//
//
//
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//
//     PolylineId id = PolylineId('poly');
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.green.shade300,
//       points: polylineCoordinates,
//       width: 3,
//     );
//     polylines[id] = polyline;
//   }
//
//   @override
//   void initState() {
//     _startAddress="dhaka";
//     _destinationAddress="dhaka";
//     super.initState();
//     Future.delayed(Duration(
//       seconds: 2,
//     ),(){
//       getroute();
//     });
//
//   }
//
//
//
//
//
//   getroute(){
//
//     _calculateDistance().then((isCalculated) {
//       if (isCalculated) {
//         double totalDistance = 0;
//         print(totalDistance);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(
//           SnackBar(content: Text('Distance Calculated Sucessfully'),),
//         );
//       } else {
//         // ScaffoldMessenger.of(context)
//         //     .showSnackBar(
//         //   SnackBar(
//         //     content: Text(
//         //         'Error Calculating Distance'),
//         //   ),
//         // );
//       }
//     });
//   }
//
// }
// ///------------second map------------------///
