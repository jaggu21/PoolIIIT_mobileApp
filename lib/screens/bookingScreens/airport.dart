import 'package:flutter/material.dart';

class Airport extends StatefulWidget {
  static const routeName = '/airport';
  @override
  _AirportState createState() => _AirportState();
}

class _AirportState extends State<Airport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Airport"),
      ),
      body: Text("airport"),
    );
  }
}
