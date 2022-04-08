import 'package:cr_rewards_flutter/views/screens/auth_screens/login_screen.dart';
import 'package:cr_rewards_flutter/views/screens/console/console_navigation_screen.dart';
import 'package:cr_rewards_flutter/views/screens/landing_screens/landing_screen.dart';
import 'package:cr_rewards_flutter/views/screens/products/axis/axis_main_screen.dart';
import 'package:cr_rewards_flutter/views/screens/products/lifestyle/lifestyle_main_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const landingPage = '/';
  static const loginScreen = '/login';
  static const consoleScreen = '/console';
  static const axisBank = '/axis-bank';
  static const lifeStyle = '/lifestyle';


}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LandingScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.consoleScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ConsoleNavigationScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.axisBank:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AxisMainScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.lifeStyle:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LifestyleMainPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LandingScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}
// DispatchTableMainPage
/*
Call AppRoutes.pageName whenever needed

Example scenario in case of arguments passing
case AppRoutes.listingCategorySearch:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ListingCategorySearchView(queryParams: args,),
          settings: settings,
          fullscreenDialog: true,
        );
case AppRoutes.listingDetails:
        ListingDetailsArgs args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ListingDetailsPage(offerID: args.offerID, favouriteCount: args.favouriteCount, commentCount: args.commentCount, dealCount: args.dealCount,viewCount: args.viewCount, isLoadingFromOfferCreateScreen: args.isLoadingFromOfferCreateScreen,),
          settings: settings,
          fullscreenDialog: true,
        );
 */