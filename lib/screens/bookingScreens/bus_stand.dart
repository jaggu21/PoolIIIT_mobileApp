import 'package:flutter/material.dart';

class BusStand extends StatefulWidget {
  static const routeName = '/bus-stand';
  @override
  _BusStandState createState() => _BusStandState();
}

class _BusStandState extends State<BusStand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Station"),
      ),
      body: Text("bus stand"),
    );
  }
}
