import 'package:cr_rewards_flutter/views/screens/landing_screens/sections/body_section.dart';
import 'package:cr_rewards_flutter/views/screens/landing_screens/sections/menu_bar_section.dart';
import 'package:cr_rewards_flutter/views/screens/landing_screens/sections/top_bar_section.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const TopBarSection(),
            MenuBarSecion(),
          ],
          body: const BodySecion(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shield),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
