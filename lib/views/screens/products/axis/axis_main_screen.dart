import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../controllers/controllers.dart';
import '../../../constants.dart';
import 'axis_app_bar.dart';
import 'axis_bank_drawer.dart';
import 'choose_provider.dart';

class AxisMainScreen extends StatefulWidget {
  const AxisMainScreen({Key? key}) : super(key: key);

  @override
  State<AxisMainScreen> createState() => _AxisMainScreenState();
}

class _AxisMainScreenState extends State<AxisMainScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isError = false;
  final TextEditingController _code1Controller =
      TextEditingController(text: 'XXXX');
  final TextEditingController _code2Controller =
      TextEditingController(text: 'XXXX');
  final TextEditingController _code3Controller =
      TextEditingController(text: 'XXXX');
  final TextEditingController _code4Controller =
      TextEditingController(text: 'XXXX');
      


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
            crossAxisAlignment: ResponsiveLayout.isMobile(context) ||
                    ResponsiveLayout.isTablet(context)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              Text(
                'Enter code to redeem your voucher',
                style: TextStyle(
                  fontSize: ResponsiveLayout.isNotMobile(context) ? 24.0 : 20.0,
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
                  margin: const EdgeInsets.only(right: 25.0),
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
          child: AxisAppBar(
            onPressed: () {
              _axisMainKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: const AxisBankDrawer(),
        key: _axisMainKey,
      ),
    );
  }
}
final GlobalKey<ScaffoldState> _axisMainKey = GlobalKey();

