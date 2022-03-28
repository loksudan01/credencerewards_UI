import 'package:flutter/material.dart';

import 'axis_main_screen.dart';
import 'user_details_form.dart';

class ChooseProvider extends StatelessWidget {
  const ChooseProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Redeem',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 50.0),
        Image.asset('assets/images/flipkart-small.png', height: 50),
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
                return const UserDetailsForm();
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
