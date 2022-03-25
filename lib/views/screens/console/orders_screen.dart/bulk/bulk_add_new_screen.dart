import 'package:flutter/material.dart';

class BulkAddNewScreen extends StatefulWidget {
  const BulkAddNewScreen({Key? key}) : super(key: key);

  @override
  State<BulkAddNewScreen> createState() => _BulkAddNewScreenState();
}

class _BulkAddNewScreenState extends State<BulkAddNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Order Name'),
              )),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Company'),
              )),
            ],
          )
        ],
      ),
    );
  }
}
