import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../controllers/controllers.dart';
import '../../../widgets/custom_clipper.dart';
import 'choose_provider.dart';

class AxisMainScreen extends StatefulWidget {
  const AxisMainScreen({Key? key}) : super(key: key);

  @override
  State<AxisMainScreen> createState() => _AxisMainScreenState();
}

class _AxisMainScreenState extends State<AxisMainScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        color: Colors.blueGrey.shade900,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(20),
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/axis-bank.png',
                      width: 200,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Redeem your Credence Voucher',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 250,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Voucher code',
                            border: const OutlineInputBorder(),
                            suffixIcon: !ResponsiveLayout.isDesktop(context)
                                ? InkWell(
                                    child: const Icon(Icons.qr_code),
                                    onTap: () {},
                                  )
                                : null,
                          ),
                          controller: _codeController,
                          validator: (text) {
                            if (text?.length != 16) {
                              return 'Please enter correct code';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                          formSubmitFunction(
                              formKey: _formKey,
                              submitFunction: () {
            
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const ChooseProvider();
                                }));
                              });
            
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Redeem',
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Copyrights © ${DateTime.now().year}. All Rights Reserved by Credence Rewards',
              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle whiteTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xffFFFFFF),
);