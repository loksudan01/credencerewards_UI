import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../../../controllers/routes.dart';
import '../axis/axis_main_screen.dart';
import 'payment_screen.dart';

class LifeStyleQuantityScreen extends StatefulWidget {
  const LifeStyleQuantityScreen({Key? key}) : super(key: key);

  @override
  State<LifeStyleQuantityScreen> createState() =>
      _LifeStyleQuantityScreenState();
}

class _LifeStyleQuantityScreenState extends State<LifeStyleQuantityScreen> {
  int _firstQuantity = 1;
  int _secondQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.axisBank, (Route<dynamic> route) => false);
          return false;
        },
        child: Container(
          color: Colors.blueGrey.shade900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(20),
                width: 500,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/lifestyle.webp',
                      width: 200,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Divider(),
                    ),
                    const SizedBox(height: 25.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveLayout.isMobile(context) ? 10.0 : 25.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Denominations',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.asset(
                                    'assets/images/blank_gift_card.png',
                                    width: 150,
                                  ),
                                  const Positioned(
                                      child: Text(
                                        '₹1000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      ),
                                      right: 10.0,
                                      top: 10.0),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 100,
                                height: 55,
                                child: NumberInputWithIncrementDecrement(
                                  controller: TextEditingController(),
                                  min: 0,
                                  max: 100,
                                  initialValue: 1,
                                  onIncrement: (val) {
                                    setState(() {
                                      _firstQuantity = val.toInt();
                                    });
                                  },
                                  onDecrement: (val) {
                                    setState(() {
                                      _firstQuantity = val.toInt();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.asset(
                                    'assets/images/blank_gift_card.png',
                                    width: 150,
                                  ),
                                  const Positioned(
                                      child: Text(
                                        '₹2000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      ),
                                      right: 10.0,
                                      top: 10.0),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 100,
                                height: 55,
                                child: NumberInputWithIncrementDecrement(
                                  controller: TextEditingController(),
                                  min: 0,
                                  max: 100,
                                  onIncrement: (val) {
                                    setState(() {
                                      _secondQuantity = val.toInt();
                                    });
                                  },
                                  onDecrement: (val) {
                                    setState(() {
                                      _secondQuantity = val.toInt();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${_firstQuantity + _secondQuantity}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Text(
                                'Amount',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '₹${_calculateDiscount((_firstQuantity * 1000 + (_secondQuantity * 2000)))}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
                            return const PaymentWebScreen();
                          }));
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'PAY',
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const PowerdByRowText()
                  ],
                ),
              ),
              const CopyRightText(),
            ],
          ),
        ));
  }
}

int _calculateDiscount(int total) {
  double discount = total * .1;
  int newTotal = total - discount.toInt();
  return newTotal;
}
