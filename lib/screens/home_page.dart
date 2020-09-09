import 'package:PoolIIIT_mobileApp/screens/bookingScreens/airport.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/bus_stand.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/metro_station.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/railway_station.dart';
import 'package:PoolIIIT_mobileApp/screens/exploreScreens/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/make_item.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget carousel(String path, String title) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
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
    );
  }

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
            Padding(
              padding: const EdgeInsets.all(10),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 10),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  carousel(
                    "assets/images/carousal1.jpg",
                    "Iconic Bangalore Palace",
                  ),
                  carousel(
                    "assets/images/carousal2.jpg",
                    "Majestic Vidhan Soudha",
                  ),
                  carousel(
                    "assets/images/carousal3.jpg",
                    "Get the taste of the city lights",
                  ),
                  carousel(
                    "assets/images/carousal4.png",
                    "Charming Lal Bagh",
                  ),
                  carousel(
                    "assets/images/carousal5.jpg",
                    "Greenery umm sorry Bangalore",
                  ),
                ],
              ),
            ),
            /*SizedBox(
              height: 300,
            ),*/
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
                          title: "Airport",
                          route: Airport.routeName,
                        ),
                        MakeItem(
                          image: 'assets/images/busstand.jpg',
                          title: 'Bus stand',
                          route: BusStand.routeName,
                        ),
                        MakeItem(
                            image: 'assets/images/train.jpg',
                            title: 'Railway Stations',
                            route: RailwayStation.routeName),
                        MakeItem(
                          image: 'assets/images/metro.jpg',
                          title: 'Metro Stations',
                          route: MetroStation.routeName,
                        ),
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
                          route: Food.routeName,
                        ),
                        MakeItem(
                          image: 'assets/images/mall.png',
                          title: 'Malls',
                          route: Food.routeName,
                        ),
                        MakeItem(
                          image: 'assets/images/waterpark.jpg',
                          title: 'Water Parks',
                          route: Food.routeName,
                        ),
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
