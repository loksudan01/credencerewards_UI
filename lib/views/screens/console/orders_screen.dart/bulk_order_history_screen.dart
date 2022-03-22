import 'package:flutter/material.dart';

class BulkOrderHistoryScreen extends StatefulWidget {
  const BulkOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BulkOrderHistoryScreen> createState() => _BulkOrderHistoryScreenState();
}

class _BulkOrderHistoryScreenState extends State<BulkOrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Bulk Order History'));
  }
}
