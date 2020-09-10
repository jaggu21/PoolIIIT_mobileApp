import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  "IIITB",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
