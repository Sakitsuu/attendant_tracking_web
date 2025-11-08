import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:attendant_tracking_web/info_employee/request_permission.dart';

class HomeEmployee extends StatefulWidget {
  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  String statusMessage = "Getting location...";

  // Predefined coordinates of the office/location
  final double officeLatitude = 10.6264729;
  final double officeLongitude = 104.1813209;
  final double allowedDistanceInMeters = 50; // Acceptable distance

  void checkLocation() async {
    Position? position = await getCurrentLocation();

    if (position == null) {
      setState(() {
        statusMessage = "Cannot access location or permissions denied.";
      });
      return;
    }

    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      officeLatitude,
      officeLongitude,
    );

    setState(() {
      if (distance <= allowedDistanceInMeters) {
        statusMessage = "Checked ✅";
      } else {
        statusMessage = "You cannot get attendant ❌";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Employee Home',
          style: TextStyle(fontFamily: 'MomoTrustDisplay', color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black, height: 5),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          statusMessage,
          style: TextStyle(fontSize: 20, fontFamily: 'MomoTrustDisplay'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
