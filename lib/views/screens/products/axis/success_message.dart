import 'package:flutter/material.dart';

class SuccessMessageAxisScreen extends StatelessWidget {
  const SuccessMessageAxisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(20),
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/axis-bank.png',
                  width: 200,
                ),
                const SizedBox(height: 30),
                const Text('Thank you',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25.0),
                const Text(
                  'You will receive your voucher via email.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                const Divider(),
                const SizedBox(height: 30.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Powered by',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.only(bottom: 3.0),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email,
                            color: Color.fromRGBO(138, 35, 77, 1))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.error_sharp,
                            color: Color.fromRGBO(138, 35, 77, 1))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message,
                            color: Color.fromRGBO(138, 35, 77, 1))),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Copyrights © ${DateTime.now().year}. All Rights Reserved by Credence Rewards',
            style: const TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
