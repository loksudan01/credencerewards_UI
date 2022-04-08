import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive_layout.dart';

class AxisSubmitButton extends StatelessWidget {
  const AxisSubmitButton({Key? key, required this.onTap, required this.title}) : super(key: key);
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveLayout.isNotMobile(context) ? 200 : 150,
      height: ResponsiveLayout.isNotMobile(context) ? 50 : 40,
      margin: const EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(
        color: kAxisBankPrimaryColor,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
              fontSize: ResponsiveLayout.isNotMobile(context) ? 18 : 16),
        ),
      ),
    );
  }
}
