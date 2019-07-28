import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  //function to add item in cart
  void addItem(String productid, String title, double price) {
//check for the duplicat eentry for the same
    if (_items.containsKey(productid)) {
      //..change quantity
      _items.update(
        productid,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1,
            title: existingCartItem.title),
      );
    } else {
      _items.putIfAbsent(
          productid,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
  }
}
