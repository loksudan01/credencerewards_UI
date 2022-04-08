import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive_layout.dart';

class AxisAppBar extends StatelessWidget {
  final void Function() onPressed;
  const AxisAppBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAxisBankPrimaryColor,
      padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: ResponsiveLayout.isNotMobile(context) ? 125.0 : 10.0),
      child: Row(
        children: [
          if (!ResponsiveLayout.isNotMobile(context))
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
          Image.asset(
            'assets/images/axis-white.png',
            height: !ResponsiveLayout.isNotMobile(context) ? 30 : 50.0,
          ),
          const Spacer(),
          if (ResponsiveLayout.isNotMobile(context))
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
        ],
      ),
    );
  }
}
