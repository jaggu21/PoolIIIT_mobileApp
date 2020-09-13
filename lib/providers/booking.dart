import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  String get getID {
    return this.id;
  }

  String get getUsername {
    return this.username;
  }

  String get getStart {
    return this.start;
  }

  String get getEnd {
    return this.end;
  }

  String get getDateTime {
    return this.dateTime;
  }

  String get getNotes {
    return this.notes;
  }

  void setID(String id) {
    this.id = id;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setEnd(String end) {
    this.end = end;
  }

  void setDateTime(String dateTime) {
    this.dateTime = dateTime;
  }

  void setNotes(String notes) {
    this.notes = notes;
  }
}
