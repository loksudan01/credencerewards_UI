import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credence Rewards - Digital gift cards for everyone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),

      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      // home: const LandingScreen(),
      initialRoute: AppRoutes.landingPage,
      // home: const ConsoleNavigationScreen(),

    );
  }
}
