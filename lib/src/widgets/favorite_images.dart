import 'package:flutter/material.dart';

class FavoriteImage extends StatelessWidget {
  final String pizzaName;
  final String pizzaImagePath;
  final String pizzaPrice;
  FavoriteImage({this.pizzaName, this.pizzaImagePath, this.pizzaPrice});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 140,
            width: 140,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                )
              ],
              image: DecorationImage(
                image: AssetImage(pizzaImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            pizzaName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(pizzaPrice),
        ]);
  }
}
