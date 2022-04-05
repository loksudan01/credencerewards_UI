import 'package:cr_rewards_flutter/controllers/controllers.dart';
import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../message_screens/success_message.dart';
import 'axis_main_screen.dart';

class ChooseProvider extends StatefulWidget {
  const ChooseProvider({Key? key}) : super(key: key);

  @override
  State<ChooseProvider> createState() => _ChooseProviderState();
}

class _ChooseProviderState extends State<ChooseProvider> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _tcChecked = false;
  bool isButtonTapped = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.axisBank, (Route<dynamic> route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50.0),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  width: 500,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/axis-bank.png',
                          width: 200,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Please fill in the below details to receive your voucher.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.asset('assets/images/flipkart-card.png',
                                width: 300),
                            Positioned(
                              top: 20,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Gift Card Value',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12.0)),
                                  Text('₹500',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16.0)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          controller: _nameController,
                          validator: (text) {
                            if (text!.length < 2) {
                              return 'Please enter valid name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (text) {
                            if (text?.isValidEmail() == false) {
                              return 'Please enter valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: _phoneController,
                          validator: (text) {
                            if (text?.length != 10) {
                              return 'Please enter valid number';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Checkbox(
                            checkColor: context.isDarkMode()
                                ? Colors.black
                                : Colors.white,
                            value: _tcChecked,
                            onChanged: (value) {
                              setState(() {
                                _tcChecked = !_tcChecked;
                              });
                              if (value == true) {}
                            },
                          ),
                          title: RichText(
                            text: TextSpan(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                TextSpan(
                                    text: 'I accept the ',
                                    style: TextStyle(
                                      color: context.isDarkMode()
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchURL(
                                          'https://credencerewards.com/terms-and-conditions');
                                    },
                                  text: 'terms and conditions *',
                                  style: TextStyle(color: Colors.blue.shade900),
                                ),
                              ],
                            ),
                          ),
                          subtitle: !_tcChecked && isButtonTapped
                              ? const Padding(
                                  padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                  child: Text(
                                    'Required field',
                                    style: TextStyle(
                                        color: Color(0xFFe53935), fontSize: 12),
                                  ),
                                )
                              : null,
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
                              setState(() {
                                isButtonTapped = true;
                              });
                              formSubmitFunction(
                                  formKey: _formKey,
                                  submitFunction: () {
                                    if (_tcChecked) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const PaymentSuccessMessageScreen(
                                          companyImage:
                                              'assets/images/axis-bank.png',
                                          route: AppRoutes.axisBank,
                                        );
                                      }));
                                    }
                                  });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'SUBMIT',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const PowerdByRowText()
                      ],
                    ),
                  ),
                ),
                const CopyRightText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

