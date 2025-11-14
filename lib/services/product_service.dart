import 'dart:convert';

import 'package:ecommerce_chat/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = "http://localhost:8000/api";

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse("$baseUrl/products");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('API Response: $jsonResponse'); // Debug
      var data = jsonResponse['data'];
      print('Data type: ${data.runtimeType}'); // Debug

      // Check if data is a List or Map
      if (data is List) {
        List<ProductModel> products = [];
        for (var item in data) {
          products.add(ProductModel.fromJson(item));
        }
        return products;
      } else if (data is Map) {
        // If data is an object with products array inside
        var productsList = data['products'] ?? data['data'] ?? [];
        List<ProductModel> products = [];
        for (var item in productsList) {
          products.add(ProductModel.fromJson(item));
        }
        return products;
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
