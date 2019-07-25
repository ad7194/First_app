import 'package:flutter/material.dart';

//import the screen which will load the data
import './screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App from scratch',
      theme: ThemeData(
        primarySwatch: Colors.deepPurpleAccent[300],
        accentColor: Colors.yellow,
        fontFamily: 'Lato',
      ),
      //This wil load the screen data on the loadup
      home: ProductOverviewScreen(),
    );
  }
}
