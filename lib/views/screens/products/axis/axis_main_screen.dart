import 'package:flutter/material.dart';

import 'choose_provider.dart';

class AxisMainScreen extends StatelessWidget {
  const AxisMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.green, size: 50.0),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: 300,
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
            children: [
              const Text(
                'Have a coupon code?',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Coupon code',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Container(
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
                return const ChooseProvider();
              }));
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            child: Text(
              'Redeem',
              style: whiteTextStyle.copyWith(fontSize: 18),
            ),
          ),
        ),
        const Align(
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text('Powered by Credencerewards'),
          ),
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }
}

TextStyle whiteTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xffFFFFFF),
);
