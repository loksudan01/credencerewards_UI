import 'package:cr_rewards_flutter/views/responsive_layout.dart';
import 'package:cr_rewards_flutter/views/screens/products/axis/axis_submit_button.dart';
import 'package:cr_rewards_flutter/views/widgets/common_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../controllers/controllers.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              Text(
                'Enter code to redeem your voucher',
                style: TextStyle(
                  fontSize: ResponsiveLayout.isNotMobile(context) ? 30.0 : 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: ResponsiveLayout.isNotMobile(context) ? 375 : 320.0,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          VoucherCodeTextField(
                            codeController: _code1Controller,
                            onChanged: (val) {},
                          ),
                          const _VoucherCodeDivider(),
                          VoucherCodeTextField(
                            codeController: _code2Controller,
                            onChanged: (val) {},
                          ),
                          const _VoucherCodeDivider(),
                          VoucherCodeTextField(
                            codeController: _code3Controller,
                            onChanged: (val) {},
                          ),
                          const _VoucherCodeDivider(),
                          VoucherCodeTextField(
                            codeController: _code1Controller,
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
                              
                            },
                            validator: (val) {
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
                         
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (isError)
                SizedBox(
                  width: ResponsiveLayout.isNotMobile(context) ? 375 : 320.0,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Invalid voucher code',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: ResponsiveLayout.isNotMobile(context) ? 75 : 30),
              Align(
                alignment: ResponsiveLayout.isMobile(context)
                    ? Alignment.centerRight
                    : Alignment.center,
                  child: AxisSubmitButton(
                    title: 'Redeem',
                    onTap: () {
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
                  )),
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

class VoucherCodeTextField extends StatelessWidget {
  const VoucherCodeTextField({
    Key? key,
    required this.onChanged,
    required this.codeController,
    this.validator,
  }) : super(key: key);

  final TextEditingController codeController;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveLayout.isNotMobile(context) ? 75 : 65,
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(4),
        ],
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'XXXX',
        ),
        validator: validator,
        controller: codeController,
        onChanged: (val) {
          if (val.length == 4) {
            FocusScope.of(context).nextFocus();
          }
          onChanged(val);
        },
      ),
    );
  }
}

class _VoucherCodeDivider extends StatelessWidget {
  const _VoucherCodeDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 10,
      child: const Divider(
        color: Colors.black,
      ),
    );
  }
}
final GlobalKey<ScaffoldState> _axisMainKey = GlobalKey();

