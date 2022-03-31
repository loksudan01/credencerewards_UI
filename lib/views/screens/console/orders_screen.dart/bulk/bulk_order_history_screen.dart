

import 'package:flutter/material.dart';

class BulkOrderHistoryScreen extends StatefulWidget {
  const BulkOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BulkOrderHistoryScreen> createState() => _BulkOrderHistoryScreenState();
}

class _BulkOrderHistoryScreenState extends State<BulkOrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
           SizedBox(height: 50.0),

              Text(
                'Orders',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              Text(
                'Flipkart Bulk',
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 20.0),
              Divider(),
            ],
          ),
        ),
        Expanded(
            child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Created',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Actions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('1')),
                      const DataCell(Text('Flipkart')),
                      const DataCell(Text('2022-02-23 19:31:39')),
                      DataCell(
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text('View')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('2')),
                      const DataCell(Text('Amazon')),
                      const DataCell(Text('2022-02-23 19:31:39')),
                      DataCell(
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text('View')),
                          
                          ],
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('3')),
                      const DataCell(Text('Purvi')),
                      const DataCell(Text('2022-02-23 19:31:39')),
                      DataCell(
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text('View')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('4')),
                      const DataCell(Text('CR Test')),
                      const DataCell(Text('2022-02-23 19:31:39')),
                      DataCell(
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text('View')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
