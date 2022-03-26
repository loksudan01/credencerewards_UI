import 'package:flutter/material.dart';

class ApiOrdersScreen extends StatefulWidget {
  const ApiOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ApiOrdersScreen> createState() => _ApiOrdersScreenState();
}

class _ApiOrdersScreenState extends State<ApiOrdersScreen> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Api Orders',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              const SizedBox(height: 20.0),

              ElevatedButton(onPressed: () {}, child: const Text('New')),
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
