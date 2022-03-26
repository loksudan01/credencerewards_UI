import 'package:cr_rewards_flutter/views/screens/console/orders_screen.dart/bulk/bulk_order_history_screen.dart';
import 'package:cr_rewards_flutter/views/screens/console/orders_screen.dart/bulk/bulk_orders_screen.dart';
import 'package:flutter/material.dart';

import 'api_orders_screen.dart';
import 'offline_orders_screen.dart';

class OrdersScreenMain extends StatefulWidget {
  const OrdersScreenMain({Key? key}) : super(key: key);

  @override
  State<OrdersScreenMain> createState() => _OrdersScreenMainState();
}

class _OrdersScreenMainState extends State<OrdersScreenMain> {
  int _selectedIndex = 0;

  Widget _bodyChild = const BulkOrdersScreen();

  void _managebody() {
    switch (_selectedIndex) {
      case 0:
        _bodyChild = const BulkOrdersScreen();
        break;
      case 1:
        _bodyChild = const BulkOrderHistoryScreen();
        break;
      case 2:
        _bodyChild = const ApiOrdersScreen();
        break;
      case 3:
        _bodyChild = const OfflineOrdersScreen();
        break;
      default:
        _bodyChild = const BulkOrdersScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyChild,
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                _managebody();
              },
              child: Text(
                'Bulk Orders',
                style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    fontWeight: _selectedIndex == 0
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                _managebody();
              },
              child: Text(
                'Bulk History',
                style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    fontWeight: _selectedIndex == 1
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                _managebody();
              },
              child: Text(
                'Api Order',
                style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                    fontWeight: _selectedIndex == 2
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
                _managebody();
              },
              child: Text(
                'Offline Order',
                style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.black : Colors.grey,
                    fontWeight: _selectedIndex == 3
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
