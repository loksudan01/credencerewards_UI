import 'package:cr_rewards_flutter/controllers/controllers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../controllers/providers/lifestyle_providers.dart';
import '../../../widgets/custom_clipper.dart';

class PaymentSuccessMessageScreen extends HookConsumerWidget {
  final String companyImage;
  final String route;
  const PaymentSuccessMessageScreen(
      {Key? key, required this.companyImage, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, route, (Route<dynamic> route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: DolDurmaClipper(bottom: 100, holeRadius: 40),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: context.isDarkMode() ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        companyImage,
                        width: 300,
                      ),
                      const SizedBox(height: 30),
                      const Text('Thank you',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 25.0),
                      const Text(
                        'You will receive your voucher via Email & SMS.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '#${ref.read(lifestyleProcessStateProvider).paymentId!}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      const Divider(),
                      const SizedBox(height: 60.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Powered by',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            margin: const EdgeInsets.only(bottom: 3.0),
                            child: Image.asset(
                              'assets/logo.png',
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                              text: 'Need help!, email us at ',
                            ),
                            TextSpan(
                              style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline),
                              text: 'support@credencerewards.com',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  const url =
                                      'mailto:support@credencerewards.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: false,
                                    );
                                  }
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                          text: 'or WhatsApp at ',
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 12.0,
                              decoration: TextDecoration.underline),
                          text: '(+91) 9920195348',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              const url = 'https://wa.me/+919920195348';
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                            },
                        ),
                      ]))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Copyrights © ${DateTime.now().year}. All Rights Reserved by Credence Rewards',
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
