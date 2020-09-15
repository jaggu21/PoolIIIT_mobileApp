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

class Rides with ChangeNotifier {
  List<Booking> _rides = [];

  Future<void> addOrder(Booking b) async {
    const url = 'https://pool-iiit.firebaseio.com/rides.json';
    final response = await http.post(
      url,
      body: json.encode({
        'username': b.getUsername,
        'dateTime': b.getDateTime,
        'destination': b.getEnd,
        'notes': b.getNotes,
      }),
    );
    _rides.insert(
      0,
      Booking(
        id: json.decode(response.body)['name'],
        username: b.getUsername,
        end: b.getEnd,
        dateTime: b.getDateTime,
        notes: b.getNotes,
      ),
    );
    notifyListeners();
  }

  Future<List<Booking>> fetchRides() async {
    const url = 'https://pool-iiit.firebaseio.com/rides.json';
    final response = await http.get(url);
    final List<Booking> bookedRides = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return [];
    }
    extractedData.forEach((key, value) {
      bookedRides.add(
        Booking(
          id: key,
          username: " ",
          end: value['destination'],
          dateTime: value['dateTime'],
          notes: value['notes'],
        ),
      );
    });
    _rides = bookedRides.reversed.toList();
    notifyListeners();
    return bookedRides.reversed.toList();
  }

  Future<void> fetchAndSetOrders() async {
    const url = 'https://pool-iiit.firebaseio.com/rides.json';
    final response = await http.get(url);
    //print(json.decode(response.body));
    final List<Booking> bookedRides = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((key, value) {
      //print(value["dateTime"]);
      Booking card =
          new Booking(id: "", username: "", end: "", dateTime: "", notes: "");
      card.setID(key);
      card.setDateTime(value['dateTime']);
      card.setEnd(value['destination']);
      card.setNotes(value['notes']);
      bookedRides.add(
        card,
      );
    });
    _rides = bookedRides.reversed.toList();
    //print(_rides[0].getDateTime);
    notifyListeners();
  }

  List<Booking> get rides {
    return [..._rides];
  }
}
