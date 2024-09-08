import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingMapScreen extends StatefulWidget {
   TrackingMapScreen({super.key,required this.lat, required this.lon});
   double lat;
   double lon;
  @override
  State<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends State<TrackingMapScreen> {
  late Position position;
  Completer<GoogleMapController> _controller = Completer(); 
  static late CameraPosition _kGoogle ;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  // list of locations to display polylines
  List<LatLng> latLen = [
    //  LatLng(widget.lat,widget.lon),
    LatLng(23.8100645, 90.4221128),
    LatLng(23.8200145, 90.4321000),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _kGoogle =   CameraPosition(
      target:  LatLng(widget.lat, widget.lon),
      zoom: 16,
    );
    super.initState(); 
    for(int i=0; i<latLen.length; i++){
      _markers.add(
        // added markers
          Marker(
            markerId: MarkerId(i.toString()),
            position: latLen[i],
            infoWindow: InfoWindow(
              title: 'HOTEL',
              snippet: '${latLen[i]}',
            ),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      setState(() {

      });
      _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: latLen,
            width: 2,
            color: Colors.red,
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF0F9D58),
      //   // title of app
      //   title: Text("GFG"),
      // ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            //given camera position
            initialCameraPosition: _kGoogle,
            // on below line we have given map type
            mapType: MapType.normal,
            // specified set of markers below
            markers: _markers,
            // on below line we have enabled location
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // on below line we have enabled compass location
            compassEnabled: true,
            // on below line we have added polylines
            polylines: _polyline,
            // displayed google map
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
