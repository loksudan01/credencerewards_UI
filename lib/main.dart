import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credence Rewards - Digital gift cards for everyone',
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.light),
      builder: EasyLoading.init(),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      // home: const LandingScreen(),
      initialRoute: AppRoutes.landingPage,
      // home: const ConsoleNavigationScreen(),

    );
  }
}
