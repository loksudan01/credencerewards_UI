import 'dart:developer';

import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../messages/error_message.dart';
import '../messages/success_message.dart';

class PaymentWebScreen extends StatelessWidget {
  const PaymentWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RazorpayWeb(
      rzpKey: 'rzp_live_eZygSOHhn3NsiW',
      options: RzpOptions(
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
        colorhex: "#FF0000",
      ),
      onPaymentSuccess: (String paymentId) {
        debugPrint("Payment Success");
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
    );
  }
}
