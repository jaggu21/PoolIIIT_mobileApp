import 'package:PoolIIIT_mobileApp/screens/RideScreens/findRide.dart';
import 'package:PoolIIIT_mobileApp/screens/RideScreens/offerRide.dart';
import 'package:PoolIIIT_mobileApp/screens/authScreens/auth.dart';
import 'package:PoolIIIT_mobileApp/screens/authScreens/login.dart';
import 'package:PoolIIIT_mobileApp/screens/authScreens/signup.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/airport.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/bus_stand.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/metro_station.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/railway_station.dart';
import 'package:PoolIIIT_mobileApp/screens/exploreScreens/food.dart';
import 'package:PoolIIIT_mobileApp/screens/home_page.dart';
import 'package:PoolIIIT_mobileApp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/booking.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Rides(),
        ),
      ],
      child: MaterialApp(
        title: 'PoolIIIT',
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.lime,
          accentColor: Colors.lime,
          fontFamily: 'Lato',
        ),
        home: AuthScreen(),
        routes: {
          MyHomePage.routeName: (context) => MyHomePage(),
          AuthScreen.routeName: (context) => AuthScreen(),
          LoginPage.routeName: (context) => LoginPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          FindRide.routeName: (context) => FindRide(),
          OfferRide.routeName: (context) => OfferRide(),
          Airport.routeName: (context) => Airport(),
          RailwayStation.routeName: (context) => RailwayStation(),
          MetroStation.routeName: (context) => MetroStation(),
          BusStand.routeName: (context) => BusStand(),
          Food.routeName: (context) => Food()
        },
      ),
    );
  }
}
