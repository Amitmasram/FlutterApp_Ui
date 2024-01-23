import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/theme.dart';
import '../../widgets/write_widget.dart';
import 'account_tab.dart';
import 'activity_tab.dart';
import 'feed_tab.dart';
import 'search_tab.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ui = DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppsTheme.color.neutral.shade300,
        bottomNavigationBar: SizedBox(
          height: 70 + (MediaQuery.of(context).padding.bottom / 2),
          child: const HomeTabBar(),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FeedTab(),
            SearchTab(),
            FeedTab(),
            ActivityTab(),
            AccountTab()
          ],
        ),
      ),
    );
    return ui;
  }
}

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    TabController? tabController = DefaultTabController.of(context);
    tabController.addListener(() {
      setState(() {});
    });
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom / 2),
      color: AppsTheme.color.neutral.shade100,
      child: TabBar(
        unselectedLabelColor: AppsTheme.color.neutral.shade600,
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        controller: tabController,
        onTap: (index) {
          if (index == 2) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const WriteWidget();
              },
            );
          }
        },
        tabs: [
          Tab(
            icon: tabController.index == 0
                ? Assets.icons.feedFill.image(height: 32)
                : Assets.icons.feed.image(height: 32),
          ),
          Tab(
            icon: tabController.index == 1
                ? Assets.icons.exploreFill.image(height: 32)
                : Assets.icons.explore.image(height: 32),
          ),
          Tab(
            icon: Assets.icons.write.image(height: 32),
          ),
          Tab(
            icon: tabController.index == 3
                ? Assets.icons.likeFill.image(height: 32)
                : Assets.icons.like.image(height: 32),
          ),
          Tab(
            icon: tabController.index == 4
                ? Assets.icons.accountFill.image(height: 32)
                : Assets.icons.account.image(height: 32),
          ),
        ],
      ),
    );
  }
}
