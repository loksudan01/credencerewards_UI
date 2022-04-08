import 'package:flutter/material.dart';

class AxisBankDrawer extends StatelessWidget {
  const AxisBankDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Image.asset('assets/images/axis-small.png', height: 25.0),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          const ListTile(
            leading: Icon(Icons.contact_support),
            title: Text('Contact Support'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.book),
            title: Text('Terms & Conditions'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
