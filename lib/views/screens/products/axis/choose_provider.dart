import 'package:cr_rewards_flutter/views/screens/products/axis/success_message.dart';
import 'package:flutter/material.dart';

import 'axis_main_screen.dart';

class ChooseProvider extends StatelessWidget {
  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50.0),
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
                  const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please fill in the below details to receive your voucher.',
                    textAlign: TextAlign.center,
                  ),
                  Image.asset('assets/images/flipkart-card.png', width: 300),
                  const Text(
                    'Voucher Value: Rs.500',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text('I accept the terms and conditions')
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(138, 35, 77, 1),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SuccessMessageAxisScreen();
                        }));
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'SUBMIT',
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Powered by '),
                        Container(
                          margin: const EdgeInsets.only(bottom: 3.0),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  ),
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
      ),
    );
  }
}
