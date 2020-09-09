import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class Food extends StatefulWidget {
  static const routeName = '/food';

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<String> imageList = [
    "assets/images/food.jpg",
    "assets/images/food.jpg",
    "assets/images/food.jpg",
    "assets/images/food.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        title: Text("Food"),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Find your favourite",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Food",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Expanded(
                        child: new StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: imageList[index],
                                  ),
                                ));
                          },
                          staggeredTileBuilder: (index) {
                            return new StaggeredTile.count(
                                1, index.isEven ? 1.2 : 1.0);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
