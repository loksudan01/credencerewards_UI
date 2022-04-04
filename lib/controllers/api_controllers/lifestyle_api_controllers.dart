import 'dart:convert';

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
        .post(Uri.http(baseUrl, '/api/lifestyle/order/init'), body: form);
    debugPrint(response.body);

    var data = json.decode(response.body);
    return data;
  }

  Future addOrderItems(Map form) async {
    debugPrint(json.encode(form));

    var response = await http
        .post(Uri.http(baseUrl, '/api/lifestyle/order/additems'), body: form);
    debugPrint(response.body);

    var data = json.decode(response.body);
    return data;
  }
}
