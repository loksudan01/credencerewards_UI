import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cr_rewards_flutter/controllers/controllers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../controllers/providers/lifestyle_providers.dart';
import '../../../../controllers/routes.dart';
import '../../../widgets/common_sections.dart';
import '../axis/axis_main_screen.dart';
import 'lifestyle_quantity_screen.dart';

class LifestyleMainPage extends HookConsumerWidget {
  LifestyleMainPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneController = useTextEditingController();
    final _tcChecked = useState(false);

    ref.listen<LifeStyleChangeNotifier>(lifestyleChangeNotifier,
        (previous, next) async {
      final newCode = await next.initOrderResponse?['status'];
      if (newCode == 201) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: next.initOrderResponse?["message"]);
        next.initOrderResponse = null;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const LifeStyleQuantityScreen();
        }));
      } else if (next.initOrderResponse != null) {
        Fluttertoast.showToast(msg: 'Something went wrong');
        EasyLoading.dismiss();
        next.initOrderResponse = null;
      }
      if (next.isLoading) {
        EasyLoading.show(maskType: EasyLoadingMaskType.clear);
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
        body: Center(
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50.0),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                          'assets/images/lifestyle.webp',
                          width: 200,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Your Details',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                            value: _tcChecked.value,
                            onChanged: (value) {
                              _tcChecked.value = !_tcChecked.value;

                              if (value == true) {}
                            },
                          ),
                          title: RichText(
                            text: TextSpan(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                const TextSpan(text: 'I accept the '),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchURL(
                                          'https://credencerewards.com/terms-and-conditions');
                                    },
                                  text: 'terms and conditions',
                                  style: TextStyle(color: Colors.blue.shade900),
                                ),
                              ],
                            ),
                          ),
                          subtitle: !_tcChecked.value
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
                              formSubmitFunction(
                                  formKey: _formKey,
                                  submitFunction: () async {
                                    if (_tcChecked.value) {
                                      Map form = {
                                        "name": _nameController.text,
                                        "email": _emailController.text,
                                        "mobile": _phoneController.text
                                      };
                                      ref
                                          .read(lifestyleChangeNotifier)
                                          .createOrder(form);
                                  
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
