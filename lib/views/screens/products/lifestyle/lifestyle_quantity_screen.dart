import 'dart:convert';
import 'dart:developer';

import 'package:cr_rewards_flutter/controllers/controllers.dart';
import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../../../controllers/providers/lifestyle_providers.dart';
import '../../../../controllers/routes.dart';
import '../../../constants.dart';
import 'payment_screen.dart';

class LifeStyleQuantityScreen extends HookConsumerWidget {
  const LifeStyleQuantityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _firstQuantity = useState(1);
    final _secondQuantity = useState(0);

    final processProvider = ref.read(lifestyleProcessStateProvider);


    ref.listen<LifeStyleChangeNotifier>(lifestyleChangeNotifier,
        (previous, next) async {
      final newData = await next.addOrderItemsResponse?['status'];
      if (newData == 200) {
        processProvider.orderId = next.addOrderItemsResponse?["orderId"];
        EasyLoading.dismiss();
        next.addOrderItemsResponse = null;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const PaymentWebScreen();
        }));
      } else if (next.addOrderItemsResponse != null) {
        Fluttertoast.showToast(msg: 'Please verify your details');
        EasyLoading.dismiss();
        next.addOrderItemsResponse = null;
      }
      if (next.isLoading) {
        EasyLoading.show(
            maskType: EasyLoadingMaskType.clear,
            status: 'Initializing payment');
      }
    });

    return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.lifeStyle, (Route<dynamic> route) => false);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: context.isDarkMode()
                              ? Colors.black
                              : Colors.white,
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
                                horizontal: ResponsiveLayout.isMobile(context)
                                    ? 10.0
                                    : 25.0),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                          _firstQuantity.value = val.toInt();
                                        },
                                        onDecrement: (val) {
                                          _firstQuantity.value = val.toInt();
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
                                          _secondQuantity.value = val.toInt();
                                        },
                                        onDecrement: (val) {
                                          _secondQuantity.value = val.toInt();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                      '${_firstQuantity.value + _secondQuantity.value}',
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
                                      '₹${_calculateDiscount((_firstQuantity.value * 1000 + (_secondQuantity.value * 2000)))}',
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
                                if ((_firstQuantity.value +
                                        _secondQuantity.value) <
                                    1) {
                                  Fluttertoast.showToast(
                                      msg: 'Please choose a voucher');
                                } else {
                                  Map form = {
                                    "processId":
                                        "${ref.read(lifestyleProcessStateProvider).processId}",
                                    "items": []
                                  };
                                  for (var i = 0;
                                      i < _firstQuantity.value;
                                      i++) {
                                    form["items"].add({
                                      "amount": _firstQuantity.value * 1000,
                                      "quantity": _firstQuantity.value,
                                    });
                                  }
                                  for (var i = 0;
                                      i < _secondQuantity.value;
                                      i++) {
                                    form["items"].add({
                                      "amount": _secondQuantity.value * 2000,
                                      "quantity": _secondQuantity.value,
                                    });
                                  }
                                  log(json.encode(form));
                                  processProvider.totalAmount =
                                      _calculateDiscount((_firstQuantity.value *
                                                  1000 +
                                              (_secondQuantity.value * 2000)))
                                          .toString();
                                  ref
                                      .read(lifestyleChangeNotifier)
                                      .addOrderItems(form);
                                }
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
              ),
            ),
          ),
        ));
  }
}

int _calculateDiscount(int total) {
  double discount = total * .1;
  int newTotal = total - discount.toInt();
  return newTotal;
}
