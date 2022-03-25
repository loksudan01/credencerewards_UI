import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String baseUrl =
    'credence-env.eba-tk4ufehw.us-east-1.elasticbeanstalk.com';

class AuthApiControllers {
  static Future adminLogin(Map form) async {
    var data;
    // try {
    var response = await http.post(
        Uri.parse(
            'http://credence-env.eba-tk4ufehw.us-east-1.elasticbeanstalk.com/Login/'),
        body: json.encode(form),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        });

    debugPrint(response.body);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      return data;
    } else {
      data["error"] = true;
      data["message"] = 'Wrong Password';
      return data;
    }
    // } catch (e) {
    //   rethrow;
    // }
  }


}
