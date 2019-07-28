import 'package:flutter/material.dart';

//To add products need to import the product modal
//import '../models/product.dart';

//Import for getting the item builder
//import '../widgets/product_item.dart';

//Need to import now the product overview widget
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //We are returning scaffold as this widget will return the whole screen content if it is not so we would have returned container

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop app"),
      ),
      body: ProductsGrid(),
    );
  }
}
