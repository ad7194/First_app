import 'package:first_app/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';

//The reason for building this widget is for itembuilder

class ProductItem extends StatelessWidget {
  //The information we are expecting here to show on the screen.
  //This can be custom as below or by calling a instance of the model too

  // final String id, title, imageUrl;

  // //This is constructor
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

//NOTE:- we will add parameter listen: false when we don't want the method to be rebuild for the change notifier event
    //For cart
    final cart = Provider.of<Cart>(context, listen: false);

    //Image -> to use image viewer to show image
    //fit -> to set the image design to fit depending to distribute equal space to all image by cropping them
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        footer: GridTileBar(
          //to give a manual background color
          backgroundColor: Color.fromRGBO(205, 35, 91, 0.57),
          //This method is used in scenarios where we want to refresh the wrapped function instead of whole method
          //Make sure to listen false
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
