import 'package:cr_rewards_flutter/views/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class BodySecion extends StatelessWidget {
  const BodySecion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 200),
            child: Text(
              'Rewards, Incentives, Benefits & Payouts Infrastructure for Businesses',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 300),
            child: Text(
              "Thousands of businesses of all sizes, from start-ups to large enterprises, use Xoxoday's business currency to send rewards, perks, incentives, & disburse payouts.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrangeColorButton(
                title: 'Schedule a demo',
                textSize: 16,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                onTap: () {},
              ),
              const SizedBox(width: 15),
              TextButton.icon(
                onPressed: () {},
                icon: const Text(
                  'Start free trial',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                label: const Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Image.asset('assets/images/home_preview.png'),
          ),
        ],
      ),
    );
  }
}
