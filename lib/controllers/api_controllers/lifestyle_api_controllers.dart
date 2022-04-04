import 'dart:convert';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'auth_api_controllers.dart';

final lifestyleApiProvider = Provider<LifestyleApiControllers>((ref) {
  return LifestyleApiControllers();
});

class LifestyleApiControllers {
  Future createLifestyleOrder(Map form) async {
    // try {
    var response =
        await http.post(Uri.parse(baseUrl + 'lifeStyle/addUser'), body: form);
    log(response.body);

    var data = json.decode(response.body);
    return data;
    // } catch (e) {
    //   return e;
    // }
  }
}
