import 'package:flutter/material.dart';

class BulkAddNewScreen extends StatefulWidget {
  const BulkAddNewScreen({Key? key}) : super(key: key);

  @override
  State<BulkAddNewScreen> createState() => _BulkAddNewScreenState();
}

class _BulkAddNewScreenState extends State<BulkAddNewScreen> {
  String _selectedBrand = 'amazon';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 20.0,
        ),
      ]),
      padding: const EdgeInsets.all(30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Create Bulk Order',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 50.0),
          Row(
            children: const [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Order Name'),
              )),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Company'),
              )),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: const [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'CC Email 1'),
              )),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'CC Email 2'),
              )),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              const Text(
                'Brand:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: _selectedBrand,
                items: const [
                  DropdownMenuItem(
                    child: Text("Amazon"),
                    value: 'amazon',
                  ),
                  DropdownMenuItem(
                    child: Text("Flipkart"),
                    value: 'flipkart',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedBrand = value ?? 'amazon';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          const Text(
            'Order items',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Row(
            children: [
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
              )),
              const SizedBox(
                width: 20.0,
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(labelText: 'Quantity'),
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              const SizedBox(width: 100.0),
            ],
          ),
          const SizedBox(height: 50.0),
          ElevatedButton(onPressed: () {}, child: const Text('Create'))
        ],
      ),
    );
  }
}
