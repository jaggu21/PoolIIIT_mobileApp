import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String path;
  final String title;
  CarouselItem({
    @required this.path,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
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
              Theme.of(context).primaryColor.withOpacity(.8),
              Theme.of(context).primaryColor.withOpacity(.2),
            ],
          ),
        ),
      ),
    );
  }
}
