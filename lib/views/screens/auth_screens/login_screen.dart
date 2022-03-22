import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:flutter/material.dart';

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
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                ),
              ),
              const SizedBox(height: 25.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
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
                    onPressed: (() {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.consoleScreen);
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
