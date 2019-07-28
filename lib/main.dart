import 'package:first_app/providers/cart.dart';
import 'package:flutter/material.dart';

//import the screen which will load the data
import './screens/product_overview_screen.dart';

//to register a provider in our app, we need to import provider first
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';

//importing the provider
import './providers/products.dart';

import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//Here we are using the provider..........
//Instead of returning MaterialApp we will wrap the data in new widget and then we will rename the widget to
//The new widget is now a provider
//The recommended provider to use is ChangeNotifierProvider
//ChangeNotifierProvider is provided by the provider package
//this will rebuild the widgets which are listening in the app it will not rebuild the child in the app

//next is to provide the builder method
//the buiilder should receive the context and return the instance of the provider class for which the data is to be rebuild

//the place we could be interested now are I mean to use the providers are:
// products_overview_screen.dart in screens

//We can group multiple ChangeNotfierProvider by provider

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
          title: 'Shopping App from scratch',
          theme: ThemeData(
            primarySwatch: Colors.deepPurpleAccent[300],
            accentColor: Colors.yellow,
            fontFamily: 'Lato',
          ),

          //This wil load the screen data on the loadup
          home: ProductOverviewScreen(),

          //routes to the app
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
