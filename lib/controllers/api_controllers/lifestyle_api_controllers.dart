import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'auth_api_controllers.dart';

final lifestyleApiProvider = Provider<LifestyleApiControllers>((ref) {
  return LifestyleApiControllers();
});

class LifestyleApiControllers {

  Future initLifestyleOrder(Map form) async {
    debugPrint(json.encode(form));
    
    var response =
        await http
        .post(
        Uri.http(baseUrl, '/api/lifestyle/order/init'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(form));
    debugPrint(response.body);

    var data = jsonDecode(response.body);
    return data;
  }

  Future addOrderItems(Map form) async {
    log(jsonEncode(form));
    var response = await http
        .post(
        Uri.http(baseUrl, '/api/lifestyle/order/additems'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(form));
    debugPrint(response.body);

    var data = jsonDecode(response.body);
    return data;
  }

  Future verifyPayment(String id) async {
    var response = await http.get(
      Uri.http(baseUrl, '/api/lifestyle/order/verify/$id'),
      headers: {"Content-Type": "application/json"},
    );
    debugPrint(response.body);

    var data = jsonDecode(response.body);
    return data;
  }
}
