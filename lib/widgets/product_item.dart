import 'package:flutter/material.dart';

//The reason for building this widget is for itembuilder

class ProductItem extends StatelessWidget {
  //The information we are expecting here to show on the screen.
  //This can be custom as below or by calling a instance of the model too

  final String id, title, imageUrl;

  //This is constructor
  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    //Image -> to use image viewer to show image
    //fit -> to set the image design to fit depending to distribute equal space to all image by cropping them
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        header: GridTileBar(
          backgroundColor: Colors.redAccent,
                    title: Text(title,textAlign: TextAlign.center,),
        ),
        footer: GridTileBar(
          //to give a manual background color
          backgroundColor: Color.fromRGBO(205, 35, 91, 0.57),
          leading: IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: () {},
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
