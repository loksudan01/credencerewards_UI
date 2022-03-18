import 'package:cr_rewards_flutter/views/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0)
                .copyWith(top: 5.0),
            child: Row(
              children: [
                const IconTextWidget(
                  icon: Icon(
                    Icons.newspaper,
                    size: 16,
                    color: Colors.blue,
                  ),
                  title: 'Blogs',
                ),
                const SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                const IconTextWidget(
                  icon: Icon(
                    Icons.local_offer_sharp,
                    color: Colors.red,
                    size: 16,
                  ),
                  title: 'Offers',
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Reedem',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
