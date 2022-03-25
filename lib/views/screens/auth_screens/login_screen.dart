import 'package:cr_rewards_flutter/controllers/api_controllers/auth_api_controllers.dart';
import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(height: 25.0),
              const Text('Admin Console',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50.0),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,

                  validator: (input) {
                    if (EmailValidator.validate(input!)) {
                      return null;
                    } else {
                      return 'Enter correct email';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (input) {
                    if (input!.length < 8) {
                      return 'Enter atleast 8 digit password';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text('Remember me',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: (() async {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.consoleScreen);
                      // EasyLoading.show(
                      //     maskType: EasyLoadingMaskType.clear,
                      //     status: 'Authenticating...');
                      // Map body = {
                      //   "email_id": _emailController.text.trim(),
                      //   "password": _passwordController.text.trim(),
                      // };
                      // var _response = await AuthApiControllers.adminLogin(body);
                      // EasyLoading.dismiss();
                      // if (_response["error"] == false) {
                      //   SharedPreferences _prefs =
                      //       await SharedPreferences.getInstance();
                      //   _prefs.setString(
                      //       'accessToken', _response["access_token"]);
                      //   _prefs.setString(
                      //       'userId', _response["profile_id"].toString());

                      // Navigator.pushReplacementNamed(
                      //       context, AppRoutes.consoleScreen);
                      // } else {
                      //   EasyLoading.showError(_response["message"]);
                      // }

                    }),
                    child: const Text('Login'),
                  )),
                ],
              ),
              const SizedBox(height: 25.0),
              Text(
                'Credence Rewards © ${DateTime.now().year}',
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              const Text(
                'Developed by @swarup13',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              )
            ],
          ),
        ),
      )),
    );
  }
}
