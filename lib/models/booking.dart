import 'package:flutter/material.dart';

class Booking {
  String id;
  String username;
  String start = "IIITB";
  String end;
  String dateTime;
  String notes;

  Booking({
    @required id,
    @required username,
    @required end,
    @required dateTime,
    @required notes,
  });
}
