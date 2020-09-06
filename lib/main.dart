import 'package:PoolIIIT_mobileApp/screens/home_page.dart';
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
      home: MyHomePage(),
    );
  }
}
