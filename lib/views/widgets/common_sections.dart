import 'package:flutter/material.dart';

class CopyRightText extends StatelessWidget {
  const CopyRightText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        'Copyrights © ${DateTime.now().year}. All Rights Reserved by Credence Rewards',
        style: const TextStyle(fontSize: 12.0, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PowerdByRowText extends StatelessWidget {
  const PowerdByRowText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Powered by ',
            style: TextStyle(fontSize: 12),
          ),
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
    );
  }
}
