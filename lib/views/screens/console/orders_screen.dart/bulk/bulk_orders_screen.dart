import 'package:cr_rewards_flutter/views/screens/console/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'bulk_add_new_screen.dart';

class BulkOrdersScreen extends StatefulWidget {
  const BulkOrdersScreen({Key? key}) : super(key: key);

  @override
  State<BulkOrdersScreen> createState() => _BulkOrdersScreenState();
}

class _BulkOrdersScreenState extends State<BulkOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (1 / .32),
              crossAxisCount: (orientation == Orientation.portrait) ? 1 : 5),
          itemCount: 2,
          itemBuilder: (context, index) {
            return ApiBalanceCard(data: apiBalanceList[index]);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orders',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              const Text(
                'Bulk',
                style: TextStyle(fontSize: 14.0),
              ),
              ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('New')),
              const Divider(),
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
                            const SizedBox(width: 5.0),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Export'))
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
                            const SizedBox(width: 5.0),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Export'))
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
                            const SizedBox(width: 5.0),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Export'))
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
                            const SizedBox(width: 5.0),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Export'))
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
