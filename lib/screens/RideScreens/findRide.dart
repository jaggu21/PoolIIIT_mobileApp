import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/booking.dart';
import '../../widgets/bookingCard.dart';

class FindRide extends StatefulWidget {
  static const routeName = '/findride';
  @override
  _FindRideState createState() => _FindRideState();
}

class _FindRideState extends State<FindRide> {
  List<Booking> _allRides = [];
  Future<void> getRides(BuildContext ctx) async {
    _allRides = await Provider.of<Rides>(context).fetchRides();
  }

  @override
  Widget build(BuildContext context) {
    getRides(context);
    print(_allRides);
    return Center(
      child: SingleChildScrollView(
          child: Text(
              "data") /*ListView.builder(
          itemCount: _allRides.length,
          itemBuilder: (BuildContext c, int index) {
            return /*BookingCard(
                title: _allRides[index].getUsername,
                date: _allRides[index].getDateTime.split("T")[0],
                time: _allRides[index].getDateTime.split("T")[0],
                destination: _allRides[index].getEnd,
                notes: _allRides[index].getNotes);*/
                Text(_allRides[index].getNotes);
          },
        ),*/
          ),
    );
  }
}
