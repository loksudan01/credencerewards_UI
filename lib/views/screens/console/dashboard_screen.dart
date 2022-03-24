import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1 / .32),
            crossAxisCount: (orientation == Orientation.portrait) ? 1 : 5),
        itemCount: apiBalanceList.length,
        itemBuilder: (context, index) {
          return ApiBalanceCard(data: apiBalanceList[index]);
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ApiBalanceCard extends StatelessWidget {
  final ApiBalanceDataModel data;
  const ApiBalanceCard({Key? key, index, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
              color: data.color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
          child: Image.asset(
            data.imagePath,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('₹ ' + data.balance.toString(),
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              const Text('Api Balance', style: TextStyle(color: Colors.grey)),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  margin: const EdgeInsets.only(right: 5.0),
                  child: const Text(
                    'Enabled',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade700,
                      borderRadius: BorderRadius.circular(2.0)),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class ApiBalanceDataModel {
  final String title;
  final int balance;
  final String imagePath;
  final Color color;
  ApiBalanceDataModel({
    required this.title,
    required this.balance,
    required this.imagePath,
    required this.color,
  });
}

List<ApiBalanceDataModel> apiBalanceList = [
  ApiBalanceDataModel(
    title: 'Flipkart',
    balance: 12982,
    imagePath: 'assets/images/flipkart-small.png',
    color: Colors.blue,
  ),
  ApiBalanceDataModel(
    title: 'Amazon',
    balance: 12982,
    color: Colors.black,
    imagePath: 'assets/images/amazon-small.png',
  ),
  ApiBalanceDataModel(
      title: 'Text Local',
      balance: 12982,
      color: Colors.lightBlue,
      imagePath: 'assets/images/textlocal-small.png'),
  ApiBalanceDataModel(
      title: 'Text Local',
      balance: 12982,
      color: Colors.lightBlue,
      imagePath: 'assets/images/textlocal-small.png'),
  ApiBalanceDataModel(
      title: 'Text Local',
      balance: 12982,
      color: Colors.lightBlue,
      imagePath: 'assets/images/textlocal-small.png'),
  ApiBalanceDataModel(
      title: 'Text Local',
      balance: 12982,
      color: Colors.lightBlue,
      imagePath: 'assets/images/textlocal-small.png'),
];
