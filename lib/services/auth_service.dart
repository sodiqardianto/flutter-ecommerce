import 'dart:convert';

import 'package:ecommerce_chat/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "http://localhost:8000/api";

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    if (name.isEmpty) {
      throw Exception('Name is required');
    }

    var url = Uri.parse("$baseUrl/register");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse("$baseUrl/login");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email, 'password': password});

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
