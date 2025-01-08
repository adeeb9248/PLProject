

import 'dart:collection';
import 'package:delivery_app/helper/api.dart';
import 'package:delivery_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _items = [];

  TextEditingController searchController = TextEditingController(); 

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  getProductsAsync(int storeId) async {
    var data = await Api().get(url: '/store/$storeId', token: null);

    var products = Products.fromJson(data);

    _items = products.listOfProduct ?? [];
    notifyListeners();
  }

  getTopProductsAsync() async {
    var data = await Api().get(url: '/products/top3', token: null);

    var products = Products.fromJson(data);

    _items = products.listOfProduct ?? [];
    notifyListeners();
  }

  searchForProductAsync(String name) async {
    var data = await Api().post(
      url: '/products/search', 
      token: null,
      body: {
      'name': name
      }
    );

    var products = Products.fromJson(data);

    _items = products.listOfProduct ?? [];
    notifyListeners();
  }
}