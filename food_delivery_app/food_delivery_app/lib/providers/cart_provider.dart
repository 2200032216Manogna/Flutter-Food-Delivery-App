import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  void addToCart(String item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
