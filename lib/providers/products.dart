import 'package:flutter/material.dart';

//What is provider?
//Provider is used to refer the model of the data which you are referring to as we are modeling our data as the data within the app changes
//we can't use the model object as the single data is just a single object
// We use provider to handle the big data list i.e, list of all products

//Need to define a list of product for that need to import product modal
import '../models/product.dart';

//Here we have used mixin method same as extend method
//Mixing is like merging properties and methods to existing class and we don't return the inherited class instance

//ChangeNotifier is built in material.dart

class Products with ChangeNotifier {
  //we may define whatever we want from this class

  //in this scenario we want to have list of the products
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

//Adding the getter here
//To make a getter need to add get keywork before the instance name
//we will return the copy of _items
//to make a copy of instance we will wrap the instance name with square bracket and will prepend spread operators with the returned instance name
//... are spread operators
  List<Product> get items {
    return [..._items];
  }
//why we are doing this ???
//As in flutter or dart all the objects are reference type. If we would return the _items directly then we are returnig the pointer at the objet in memory so in application where the
//user is getting access to class product or and then gets access to _items the user gets access to the direct list of _items which can grant access to edit items

  Product findById(String id) {
    return _items.firstWhere((a) => a.id == id);
  }

// we will convert this class into data providers wherever we are calling the product in our app in this scenario we are calling the product details in main.dart & product details
//go to main.dart for better understanding why we did this??
  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
