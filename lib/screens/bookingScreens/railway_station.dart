import 'package:flutter/material.dart';

class RailwayStation extends StatefulWidget {
  static const routeName = '/railway_station';
  @override
  _RailwayStationState createState() => _RailwayStationState();
}

class _RailwayStationState extends State<RailwayStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Railway Stations"),
      ),
      body: Text("railway station"),
    );
  }
}
