import 'package:flutter/material.dart';

class FindRide extends StatefulWidget {
  static const routeName = '/findride';
  @override
  _FindRideState createState() => _FindRideState();
}

class _FindRideState extends State<FindRide> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text("Find Ride"),
      ),
    );
  }
}
