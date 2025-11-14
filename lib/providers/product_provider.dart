import 'package:ecommerce_chat/models/product_model.dart';
import 'package:ecommerce_chat/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _product = [];
  List<ProductModel> get product => _product;

  set product(List<ProductModel> product) {
    _product = product;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> product = await ProductService().getProducts();
      _product = product;
    } catch (e) {
      print(e);
    }
  }
}
