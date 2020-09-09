import 'package:flutter/material.dart';

class MetroStation extends StatefulWidget {
  static const routeName = '/metro-station';
  @override
  _MetroStationState createState() => _MetroStationState();
}

class _MetroStationState extends State<MetroStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metro Station"),
      ),
      body: Text("metro"),
    );
  }
}
