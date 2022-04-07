import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../controllers/controllers.dart';
import '../../../constants.dart';
import 'choose_provider.dart';

class AxisMainScreen extends StatefulWidget {
  const AxisMainScreen({Key? key}) : super(key: key);

  @override
  State<AxisMainScreen> createState() => _AxisMainScreenState();
}

class _AxisMainScreenState extends State<AxisMainScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isError = false;
  final TextEditingController _code1Controller = TextEditingController();
  final TextEditingController _code2Controller = TextEditingController();
  final TextEditingController _code3Controller = TextEditingController();
  final TextEditingController _code4Controller = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _code1Controller.dispose();
    _code2Controller.dispose();
    _code3Controller.dispose();
    _code4Controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.isNotMobile(context) ? 125 : 10,
              vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Enter code to redeem your voucher',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Align(
                alignment: ResponsiveLayout.isNotMobile(context)
                    ? Alignment.centerLeft
                    : Alignment.center,
                child: SizedBox(
                  width: 320.0,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 65,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'XXXX',
                                ),
                                controller: _code1Controller,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              width: 10,
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'XXXX',
                                ),
                                controller: _code2Controller,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              width: 10,
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'XXXX',
                                ),
                                controller: _code3Controller,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              width: 10,
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'XXXX',
                                ),
                                controller: _code4Controller,
                                onChanged: (val) {
                                  if ((_code1Controller.text.length +
                                          _code2Controller.text.length +
                                          _code3Controller.text.length +
                                          _code4Controller.text.length) !=
                                      16) {
                                    isError = true;
                                  } else {
                                    isError = false;
                                  }
                                  if (val.length == 4) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                validator: (text) {
                                  if ((_code1Controller.text.length +
                                          _code2Controller.text.length +
                                          _code3Controller.text.length +
                                          _code4Controller.text.length) !=
                                      16) {
                                    isError = true;
                                    return null;
                                  } else {
                                    isError = false;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isError)
                const SizedBox(
                  width: 320.0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Invalid voucher code'),
                  ),
                ),
              const SizedBox(height: 30),
              Align(
                alignment: ResponsiveLayout.isNotMobile(context)
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kAxisBankPrimaryColor,
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if ((_code1Controller.text.length +
                              _code2Controller.text.length +
                              _code3Controller.text.length +
                              _code4Controller.text.length) !=
                          16) {
                        setState(() {
                          isError = true;
                        });
                      } else {
                        setState(() {
                          isError = false;
                        });
                      }
                      formSubmitFunction(
                          formKey: _formKey,
                          submitFunction: () {
                            if (!isError) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ChooseProvider();
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
                      'Redeem',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Spacer(),
              const PowerdByRowText(),
              const SizedBox(height: 15),
              const Align(alignment: Alignment.center, child: CopyRightText()),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            color: kAxisBankPrimaryColor,
            padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal:
                    ResponsiveLayout.isNotMobile(context) ? 125.0 : 10.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/axis-white.png',
                  height: 50.0,
                ),
                const Spacer(),
                ResponsiveLayout.isNotMobile(context)
                    ? Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Contact Support',
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Terms & Conditions',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle whiteTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xffFFFFFF),
);
