import 'package:flutter/material.dart';

class OfferRide extends StatefulWidget {
  static const routeName = '/offerride';
  @override
  _OfferRideState createState() => _OfferRideState();
}

class _OfferRideState extends State<OfferRide> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text("Offer Ride"),
      ),
    );
  }
}
