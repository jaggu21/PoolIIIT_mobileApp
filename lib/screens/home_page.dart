import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/make_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "PoolIIIT",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/carousal1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Featured Locations",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        MakeItem(
                            image: 'assets/images/airport.jpg',
                            title: "Airport"),
                        MakeItem(
                            image: 'assets/images/busstand.jpg',
                            title: 'Bus stand'),
                        MakeItem(
                            image: 'assets/images/train.jpg',
                            title: 'Railway Stations'),
                        MakeItem(
                            image: 'assets/images/metro.jpg',
                            title: 'Metro Stations'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Explore!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        MakeItem(
                          image: 'assets/images/food.jpg',
                          title: "Food",
                        ),
                        MakeItem(
                          image: 'assets/images/mall.png',
                          title: 'Malls',
                        ),
                        MakeItem(
                            image: 'assets/images/waterpark.jpg',
                            title: 'Water Parks'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
