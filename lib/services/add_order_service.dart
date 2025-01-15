import 'dart:convert';

import 'package:delivery_app/helper/api.dart';
import 'package:http/http.dart' as http;

class AddOrderService {
  Future<bool> addOrder({required dynamic body, required String token}) async {
     dynamic response =
          await Api().post(url: '/Purchases/store', body: body, token: token);
      print(response);

    

    return true;
  }
}
