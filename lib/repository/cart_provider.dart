import 'package:flutter/material.dart';
import 'package:futurelabinterviewapp/screens/cart_page.dart';

import '../model/cart_model.dart';

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + double.parse(item.price.replaceAll('\$', '')));
  }

  void addItem(String name, String quantity, String price, String image, String description) {
    _items.add(CartItem(name: name, quantity: quantity, price: price, image: image,description: description));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}