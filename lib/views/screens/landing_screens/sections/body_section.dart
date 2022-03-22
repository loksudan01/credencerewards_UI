import 'package:cr_rewards_flutter/views/responsive_layout.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayout.isDesktop(context) ? 200 : 15),
            child: Text(
              "Digital gift cards for everyone, Pick your card, personalise it and we'll take care of the rest!",
              style: TextStyle( 
                fontSize: ResponsiveLayout.isDesktop(context) ? 50 : 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayout.isDesktop(context) ? 300 : 15),
            child: const Text(
              "We've got gift cards for every celebration, from birthdays, mother's day, anniversaries, weddings, baby showers and more",
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
          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayout.isDesktop(context) ? 100 : 15),
            child: Image.asset('assets/images/home_preview.png'),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
                Image.asset(
                  'assets/images/placeholder_company.png',
                  height: 70,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 248, 233, 1)),
            height: 500,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
