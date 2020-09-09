import 'package:PoolIIIT_mobileApp/screens/bookingScreens/airport.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/bus_stand.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/metro_station.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/railway_station.dart';
import 'package:PoolIIIT_mobileApp/screens/exploreScreens/food.dart';
import 'package:PoolIIIT_mobileApp/screens/home_page.dart';
import 'package:PoolIIIT_mobileApp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoolIIIT',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.lime,
        accentColor: Colors.lime,
      ),
      home: SplashScreen(),
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        Airport.routeName: (context) => Airport(),
        RailwayStation.routeName: (context) => RailwayStation(),
        MetroStation.routeName: (context) => MetroStation(),
        BusStand.routeName: (context) => BusStand(),
        Food.routeName: (context) => Food()
      },
    );
  }
}
