import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Googlemap extends StatefulWidget {
  const Googlemap({super.key});

  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap> {

  Position ? _currentPosition;
  String ?  _currentAddress;
  void permissionn()async{
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }
  late Position position;
  _getCurrentLocation() async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${_currentPosition!.longitude}");
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${_currentPosition}");
    });
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude,
          _currentPosition!.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "name = ${place.name},\n street =${place.street.toString()},\n subThoroughfare=${place.subThoroughfare},\n subLocality=${place.subLocality},\n administrativeArea=${place.administrativeArea},\n isoCountryCode=${place.isoCountryCode},\nlocality=${place.locality},\n postalCode=${place.postalCode},\n subAdministrativeArea=${place.subAdministrativeArea},\n thoroughfare${place.thoroughfare},\n country=${place.country},\n ${place},";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red.shade50,
        padding: EdgeInsets.only(
          left: 20,right: 20
        ),
        child: Center(
          child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                permissionn();
                _getCurrentLocation();
              }, child: Text("Click to get location")),

              Text("${_currentAddress}"),
            ],
          ),
        ),
      ),
    );
  }
}
