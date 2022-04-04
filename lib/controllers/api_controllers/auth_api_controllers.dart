import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://13.127.218.220:8088/api/';

class AuthApiControllers {
  // static Future adminLogin(Map form) async {

  //   Response response = await Dio().post(
  //     "http://13.127.218.220:8088/api/auth/login",
  //     // data: form,
  //     data: {"mobile": "4455445544", "password": "44444444"},
  //   );

  //   debugPrint("DATA::::---${response.data}");

  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {

  //     Fluttertoast.showToast(msg: 'Incorrect number or password');
  //     return null;
  //   }
  // }

}
