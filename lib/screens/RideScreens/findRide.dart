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
  var _init = true;
  Future<void> getRides(BuildContext ctx) async {
    _allRides = await Provider.of<Rides>(context).fetchRides();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<Rides>(context, listen: false).fetchAndSetOrders();
    }
    setState(() {
      _init = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Provider.of<Rides>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text("Some error occured"),
              );
            } else {
              return Consumer<Rides>(
                builder: (ctx, data, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.rides.length,
                    itemBuilder: (_, i) {
                      return BookingCard(
                          title: " ",
                          date: data.rides[i].dateTime.split("T")[0],
                          time: data.rides[i].dateTime.split("T")[1],
                          destination: data.rides[i].end,
                          notes: data.rides[i].notes);
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
