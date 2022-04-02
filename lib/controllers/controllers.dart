import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AppControllers {
  static Future<bool> checkLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    return token;
  }

  static Future<String?> getUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? id = _prefs.getString('userId');
    return id;
  }

  static void logout(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure"),
            content: const Text("You want to log out?"),
            actions: [
              TextButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: (() async {
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  _prefs.clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.loginScreen, (route) => false);
                }),
                child: const Text('Logout'),
              )
            ],
          );
        });
  }
}



void formSubmitFunction(
    {required GlobalKey<FormState> formKey,
    required Function() submitFunction}) {
  // final _formKey = GlobalKey<FormState>();
  final isValid = formKey.currentState!.validate();
  if (!isValid) {
    return;
  } else {
    submitFunction();
  }
  formKey.currentState!.save();
}


void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
