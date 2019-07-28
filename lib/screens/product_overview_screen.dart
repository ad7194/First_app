import 'package:flutter/material.dart';

//To add products need to import the product modal
//import '../models/product.dart';

//Import for getting the item builder
//import '../widgets/product_item.dart';

//Need to import now the product overview widget
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
//for showing favorites only
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    //We are returning scaffold as this widget will return the whole screen content if it is not so we would have returned container
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop app"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              //the reason behind setState method is that UI can be rebuilt when data is changed
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
