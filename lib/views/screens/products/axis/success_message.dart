import 'package:flutter/material.dart';

class SuccessMessageAxisScreen extends StatelessWidget {
  const SuccessMessageAxisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 300,
          height: 250,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Thank you',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10.0),
              const Text(
                ' You will receive the gift card in your email shortly',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.email, color: Colors.purple)),
                  IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.error_sharp, color: Colors.purple)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.message, color: Colors.purple)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
