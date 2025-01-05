import 'dart:convert';
import 'package:delivery_app/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  String baseURL = 'http://192.168.230.239:8000/api';

  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
    }

    http.Response response = await http.get(
      Uri.parse('$baseURL$url'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code with ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse('$baseURL$url'),
      body: body,
      headers: headers,
    );
    print('url = $baseURL$url ');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      print(data["message"]);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code with ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
