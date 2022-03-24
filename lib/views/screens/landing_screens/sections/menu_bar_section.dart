import 'package:cr_rewards_flutter/controllers/routes.dart';
import 'package:cr_rewards_flutter/views/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class MenuBarSecion extends StatelessWidget {
  const MenuBarSecion({Key? key}) : super(key: key);

  // final GlobalKey menuKey = GlobalKey();

  // showMenus(BuildContext context) async {
  //   final render = menuKey.currentContext!.findRenderObject() as RenderBox;
  //   await showMenu(
  //     context: context,
  //     position: RelativeRect.fromLTRB(
  //         render.localToGlobal(Offset.zero).dx,
  //         render.localToGlobal(Offset.zero).dy + 50,
  //         double.infinity,
  //         double.infinity),
  //     items: [
  //       PopupMenuItem(
  //         child: const Text("New User"),
  //         onTap: () {
  //           Navigator.pushNamed(context, AppRoutes.loginScreen);
  //         },
  //       ),
  //       const PopupMenuItem(
  //         child: Text("Existing Users"),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      sliver: SliverAppBar(
        elevation: 0.0,
        pinned: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        floating: true,
        // snap: true,
        centerTitle: false,
        leading: Image.asset(
          'assets/logo.png',
          height: 30,
        ),
        title: const Text('CR Rewards',
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        actions: [
          Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 30,
              ),
              const Text('CR Rewards',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              HoverButtonTextWidget(title: 'Features', onTap: () {}),
              HoverButtonTextWidget(title: 'Pricing', onTap: () {}),
              HoverButtonTextWidget(title: 'About Us', onTap: () {}),
              HoverButtonTextWidget(title: 'Support', onTap: () {}),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              InkWell(
                // key: menuKey,
                // onHover: (event) {
                //   showMenus(context);
                // },
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);

                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              OrangeColorButton(
                title: 'Contact Sales',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class MobileMenuBarSection extends StatelessWidget {
  const MobileMenuBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floating: true,
      // snap: true,
      centerTitle: false,
      leading: Image.asset(
        'assets/logo.png',
        height: 30,
      ),
      title: const Text('CR Rewards',
          style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
      ],
    );
  }
}
