import 'package:PoolIIIT_mobileApp/screens/RideScreens/findRide.dart';
import 'package:PoolIIIT_mobileApp/screens/RideScreens/offerRide.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/airport.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/bus_stand.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/metro_station.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/railway_station.dart';
import 'package:PoolIIIT_mobileApp/screens/exploreScreens/food.dart';
import 'package:PoolIIIT_mobileApp/screens/home_page.dart';
import 'package:PoolIIIT_mobileApp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

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
        fontFamily: 'Lato',
      ),
      home: SplashScreen(),
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        FindRide.routeName: (context) => FindRide(),
        OfferRide.routeName: (context) => OfferRide(),
        Airport.routeName: (context) => Airport(),
        RailwayStation.routeName: (context) => RailwayStation(),
        MetroStation.routeName: (context) => MetroStation(),
        BusStand.routeName: (context) => BusStand(),
        Food.routeName: (context) => Food()
      },
    );
  }
}
