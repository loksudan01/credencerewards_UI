import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:flutter/material.dart';

import '../message_screens/success_message.dart';
import 'axis_main_screen.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        margin: const EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        padding: const EdgeInsets.all(20),
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
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Details',
              style: TextStyle(
                fontSize: 18.0,
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
            TextField(
              decoration: const InputDecoration(
                labelText: 'Company',
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
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: 297,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff7F9BFA),
                      Color(0xff4665D1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const PaymentSuccessMessageScreen(
                        companyImage: 'assets/images/axis-bank.png',
                        route: AppRoutes.axisBank,
                      );
                    }));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text('Powered by Credencerewards'),
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
