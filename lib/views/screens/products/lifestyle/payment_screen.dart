import 'dart:developer';

import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../../../controllers/providers/lifestyle_providers.dart';
import '../message_screens/error_message.dart';
import '../message_screens/success_message.dart';


class PaymentWebScreen extends HookConsumerWidget {
  const PaymentWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RazorpayWeb(
        rzpKey: 'rzp_live_eZygSOHhn3NsiW',
        rzpSecret: 'yxY3lxgZrxQUN93D8bQ4cL6w',
        options: RzpOptions(
          orderId: kDebugMode
              ? ""
              : ref.read(lifestyleProcessStateProvider).orderId!,
          amount: 100,
          name: "CREDENCE REWARDS",
          description: "Digital gift cards for everyone",
          image:
              "https://credencerewards.com/pub/media/logo/websites/1/crlogo-tm.png",
          prefill: const PrefillData(
            name: "Razorpay",
            email: "rzp@gmail.com",
            contact: "9876543210",
          ),
          colorhex: "#33adff",
        ),
        onPaymentSuccess: (String paymentId) {
          debugPrint("Payment Success");
          ref.read(lifestyleProcessStateProvider).paymentId = paymentId;
          log(paymentId);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const PaymentSuccessMessageScreen(
              companyImage: 'assets/images/lifestyle.webp',
              route: AppRoutes.lifeStyle,
            );
          }));
        },
        onPaymentError: (String error) {
          debugPrint("Payment Error");
          log(error);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const PaymentErrorMessageScreen(
              companyImage: 'assets/images/lifestyle.webp',
              route: AppRoutes.lifeStyle,
            );
          }));
        },
      ),
    );
  }
}
