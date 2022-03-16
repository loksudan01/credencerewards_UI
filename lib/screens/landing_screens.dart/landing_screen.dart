import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopBarWidget(),
          Divider(),
        ],
      )),
    );
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Row(
        children: [
          const IconTextWidget(
            icon: Icon(
              Icons.star_border,
              color: Colors.blue,
            ),
            title: 'empuls',
          ),
          const SizedBox(
            height: 25,
            child: VerticalDivider(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          const IconTextWidget(
            icon: Icon(Icons.lock_clock),
            title: 'Compass',
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Reedem',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
            child: VerticalDivider(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.blur_circular,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
            child: VerticalDivider(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  const IconTextWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Row(
          children: [
            icon,
            Text(title),
          ],
        ),
      ),
    );
  }
}
