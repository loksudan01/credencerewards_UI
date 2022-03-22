import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:cr_rewards_flutter/views/screens/console/dashboard_screen.dart';
import 'package:cr_rewards_flutter/views/screens/console/orders_screen.dart/orders_screen_main.dart';
import 'package:cr_rewards_flutter/views/screens/landing_screens/landing_screen.dart';
import 'package:flutter/material.dart';

class ConsoleNavigationScreen extends StatefulWidget {
  const ConsoleNavigationScreen({Key? key}) : super(key: key);

  @override
  State<ConsoleNavigationScreen> createState() =>
      _ConsoleNavigationScreenState();
}

class _ConsoleNavigationScreenState extends State<ConsoleNavigationScreen> {
  int _selectedIndex = 0;

  Widget _bodyChild = const DashboardScreen();

  void _managebody() {
    switch (_selectedIndex) {
      case 0:
        _bodyChild = const DashboardScreen();
        break;
      case 1:
        _bodyChild = const OrdersScreenMain();
        break;
      case 4:
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.landingPage, (route) => false);
        break;
      default:
        _bodyChild = const DashboardScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
                _managebody();
              },
              labelType: NavigationRailLabelType.none,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_basket),
                  label: Text('Orders'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_balance_wallet),
                  label: Text('Balance'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.admin_panel_settings),
                  label: Text('Management'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.logout),
                  label: Text('Logout'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: _bodyChild,
            )
          ],
        ),
      ),
    );
  }
}
