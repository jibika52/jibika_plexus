import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'Controller/TrackingController/tracking_controller.dart';

class TrackingMapScreenTEstPoliline extends StatefulWidget {
  TrackingMapScreenTEstPoliline(
      {super.key, this.list_of_location, required this.lat, required this.lon});
  dynamic list_of_location;
  double lat;
  double lon;

  @override
  State<TrackingMapScreenTEstPoliline> createState() =>
      _TrackingMapScreenTEstPolilineState();
}

class _TrackingMapScreenTEstPolilineState
    extends State<TrackingMapScreenTEstPoliline> {
  late Position position;
  Completer<GoogleMapController> _controller = Completer();
  static late CameraPosition _kGoogle;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  // list of locations to display polylines
  List<LatLng> latLen = [
    //   //  LatLng(widget.lat,widget.lon),
    //   LatLng(23.8101645, 90.4221128),
    //   LatLng(23.8204145, 90.4324000),
  ];
  List aa = [23.8101645, 23.8102645, 23.8103645, 23.8104645, 23.8105645];
  List bb = [90.4326000, 90.4325000, 90.4324000, 90.4323000, 90.4322600];

  int i = 0;
  void latlonglistgret() {
    for (int i = 0; i < latLen.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: latLen[i],
        infoWindow: InfoWindow(
          title: '${widget.list_of_location[i]["datetime"]}',
          snippet:
              '${widget.list_of_location[i]["Address"]} & ${widget.list_of_location[i]["Street"]}',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _polyline.add(Polyline(
        polylineId: PolylineId('1'),
        points: latLen,
        width: 2,
        color: Colors.red,
      ));
      setState(() {});
    }
  }

  _getCurrentLocation() async {
    setState(() {
      _kGoogle = CameraPosition(
        target: LatLng(widget.lat, widget.lon),
        zoom: 16,
      );
      for (i = 0; i < widget.list_of_location.length; i++) {
        latLen.add(LatLng(
            double.parse("${widget.list_of_location[i]["Latitude"]}"),
            double.parse("${widget.list_of_location[i]["Longitude"]}")));
        //   print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS $latLen");
        print(
            "dddddddddddddddd-------------------------------------------------------------------- ${widget.list_of_location[i]["Latitude"]}  --  ${widget.list_of_location[i]["Longitude"]}");
      }
      latlonglistgret();
    });
  }

  @override
  void initState() {
    //  Provider.of<TrackingController>(context,listen: false).GetEmployeeLocaltionInfoProvider("${GetStorage().read("mobile_id")}", "09-Sep-2024","60670", context);
    _getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }

  int count = 0;
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    // timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk  $Position");
    //   if(count==5){
    //     timer.cancel();
    //   }else{
    //     count++;
    //   }
    // });
    dynamic locationdata =
        Provider.of<TrackingController>(context).EmployeeLocaltionInfoList;
    print("$locationdata");

    return Container(
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
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
