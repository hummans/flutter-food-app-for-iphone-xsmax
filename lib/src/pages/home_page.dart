import 'package:flutter/material.dart';
import 'package:foodapp2/src/utils.dart';
import 'package:foodapp2/src/widgets/bottomsheet_clipper.dart';

import 'package:foodapp2/src/widgets/custom_apbar.dart';
import 'package:foodapp2/src/widgets/favorite_images.dart';
import 'package:foodapp2/src/widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double sliderVal = 100.0;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          buildYellowCircle(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: _media.height / 3 + 30,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(
                        "Your Favorite",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      bottom: 10,
                      left: 50,
                    ),
                    buildHeaderImage(_media),
                    CustomApbar(),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ListView(
                  padding: EdgeInsets.only(left: 35),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FavoriteImage(
                      pizzaImagePath: "assets/images/pizza1.jpg",
                      pizzaName: "Pizza",
                      pizzaPrice: "5.60 usd",
                    ),
                    FavoriteImage(
                      pizzaImagePath: "assets/images/chicken.jpg",
                      pizzaName: "Fried Chicken",
                      pizzaPrice: "6.70 usd",
                    ),
                    FavoriteImage(
                      pizzaImagePath: "assets/images/buger.jpg",
                      pizzaName: "Burger",
                      pizzaPrice: "15 usd",
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 55,
                  top: 0,
                  bottom: 15,
                ),
                child: Text(
                  "Restaurants",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    RestaurantCard(
                      imagePath: "assets/images/toast.jpg",
                      restaurantName: "Ruchi Restaurant",
                      adress: "Adress text no: 5 ",
                      discount: 20,
                      star: 4,
                    ),
                    RestaurantCard(
                      imagePath: "assets/images/soup.jpg",
                      restaurantName: "Ruchi Restaurant",
                      adress: "Adress text no: 5 ",
                      discount: 20,
                      star: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: appMainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: GestureDetector(
          onTap: () => _settingModalBottomSheet(context),
          child: Icon(
            Icons.keyboard_arrow_up,
            size: 60,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container buildHeaderImage(Size _media) {
    return Container(
      height: _media.height / 4.8,
      width: _media.width,
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      margin: EdgeInsets.only(
        top: 90,
        left: 50,
        right: 45,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
          )
        ],
        image: DecorationImage(
            image: NetworkImage(
              images[0],
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.colorBurn,
            )),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Use Prome Code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Get 50 % Off",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Align buildYellowCircle(BuildContext context) {
    return Align(
      alignment: Alignment(4, -1.48),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.9,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          color: appMainColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  onChanged(double value) {
    setState(() {
      sliderVal = value;
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ClipOval(
            clipper: OvalTopBorderClipper(),
            child: Container(
              padding: EdgeInsets.only(
                top: 40,
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              color: appMainColor,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 50,
                    height: 20,
                    child: Slider(
                      activeColor: Colors.red,
                      inactiveColor: Colors.black54,
                      value: sliderVal,
                      min: 0.0,
                      max: 1000.0,
                      onChanged: (double v) => onChanged(v),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/icons/but.png",
                                ),
                              ),
                              Text(
                                "Non Veg",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/icons/havuc.png",
                                ),
                              ),
                              Text(
                                "Veg",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        Align(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/icons/cupcake.png",
                                ),
                              ),
                              Text(
                                "Sweets",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        Align(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/icons/hotdog.png",
                                ),
                              ),
                              Text(
                                "Hot Dogs",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
