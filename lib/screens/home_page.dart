import 'package:PoolIIIT_mobileApp/screens/RideScreens/findRide.dart';
import 'package:PoolIIIT_mobileApp/screens/RideScreens/offerRide.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/airport.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/bus_stand.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/metro_station.dart';
import 'package:PoolIIIT_mobileApp/screens/bookingScreens/railway_station.dart';
import 'package:PoolIIIT_mobileApp/screens/exploreScreens/food.dart';
import 'package:PoolIIIT_mobileApp/widgets/carousel.dart';
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
  int _index = 0;
  void onTapped(int i) {
    if (i == 0) {
      Navigator.pushNamed(
        context,
        FindRide.routeName,
      );
    } else if (i == 1) {
      Navigator.pushNamed(
        context,
        OfferRide.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "PoolIIIT",
            style: TextStyle(
              fontFamily: 'Lato',
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
                text: "Home",
              ),
              Tab(
                icon: Icon(
                  Icons.local_taxi,
                  color: Theme.of(context).accentColor,
                ),
                text: "Offer Ride",
              ),
              Tab(
                icon: Icon(
                  Icons.airport_shuttle,
                  color: Theme.of(context).accentColor,
                ),
                text: "Find Ride",
              ),
            ],
            indicatorColor: Theme.of(context).accentColor,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
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
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        CarouselItem(
                          path: "assets/images/carousal1.jpg",
                          title: "Iconic Bangalore Palace",
                        ),
                        CarouselItem(
                          path: "assets/images/carousal2.jpg",
                          title: "Majestic Vidhan Soudha",
                        ),
                        CarouselItem(
                          path: "assets/images/carousal3.jpg",
                          title: "Get the taste of the city lights",
                        ),
                        CarouselItem(
                          path: "assets/images/carousal4.png",
                          title: "Charming Lal Bagh",
                        ),
                        CarouselItem(
                          path: "assets/images/carousal5.jpg",
                          title: "Greenery umm sorry Bangalore",
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
                            fontFamily: 'Lato',
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
                            fontFamily: 'Lato',
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
            OfferRide(),
            FindRide(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_bike,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                "My Bookings",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
          currentIndex: _index,
          onTap: onTapped,
          selectedItemColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
