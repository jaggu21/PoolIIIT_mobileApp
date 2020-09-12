import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String destination;
  final String notes;

  BookingCard({
    @required this.title,
    @required this.date,
    @required this.time,
    @required this.destination,
    @required this.notes,
  });

  Widget Line(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 1.0,
        width: MediaQuery.of(ctx).size.width,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.date_range,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Date : " + this.date,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Line(context),
                  ListTile(
                    leading: Icon(
                      Icons.timer,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Time : " +
                          this.time.split(":")[0] +
                          ":" +
                          this.time.split(":")[1],
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Line(context),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Theme.of(context).accentColor,
                    ),
                    title: Text(
                      "Start : " + "IIITB",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Line(context),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Destination : " + destination,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Line(context),
                  ListTile(
                    leading: Icon(
                      Icons.note_add,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Notes :",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      notes,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
