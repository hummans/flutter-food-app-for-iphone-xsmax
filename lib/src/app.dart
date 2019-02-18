import 'package:flutter/material.dart';
import 'package:foodapp2/src/pages/home_page.dart';
import 'package:foodapp2/src/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appMainColor,
        canvasColor: Colors.transparent,
      ),
    );
  }
}
