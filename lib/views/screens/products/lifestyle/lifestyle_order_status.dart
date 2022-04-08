import 'package:cr_rewards_flutter/views/screens/products/message_screens/success_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/providers/lifestyle_providers.dart';
import '../../../../controllers/routes.dart';
import '../message_screens/error_message.dart';

class LifestyleOrderStatus extends HookConsumerWidget {
  const LifestyleOrderStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final processData = ref.read(lifestyleProcessStateProvider);
    final paymentStatus =
        ref.read(verifyLifestylePaymentFutureProvider(processData.orderId!));
    return Scaffold(
      body: SafeArea(
        child: paymentStatus.when(
            data: (data) {
              SchedulerBinding.instance!.addPostFrameCallback((_) {
                ref.read(lifestyleProcessStateProvider).status =
                    data?["status"];
              });
              if (data?["status"] == 'paid') {
                return  PaymentSuccessMessageScreen(
                  companyImage: 'assets/images/lifestyle.webp',
                  route: AppRoutes.lifeStyle,
                );
              } else {
                return const PaymentErrorMessageScreen(
                  companyImage: 'assets/images/lifestyle.webp',
                  route: AppRoutes.lifeStyle,
                );
              }
            },
            error: (e, s) {
              return Center(
                  child: Text('Something went wrong. msg: ${e.toString()}'));
            },
            loading: () => Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 25.0),
                    Text("Please don't press back button"),
                  ],
                ))),
      ),
    );
  }
}
