import 'package:flutter/material.dart';

import '../../widgets/button_tab.dart';
import '../activity/activity_screen.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({super.key});

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: "All"),
    const Tab(text: "Follows"),
    const Tab(text: "Replies"),
    const Tab(text: "Mentions"),
    const Tab(text: "Quotes"),
    const Tab(text: "Reposts"),
    const Tab(text: "Verified"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text(
                'Activity',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              pinned: true,
              floating: true,
              elevation: 0,
              centerTitle: false,
              forceElevated: innerBoxIsScrolled,
              bottom: ButtonsTabBar(
                borderWidth: 1,
                backgroundColor: Colors.black,
                unselectedBackgroundColor: Colors.white,
                unselectedBorderColor: const Color(0xFFD9D9D9),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                // Add your tabs here
                tabs: tabs,
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            ActivityScreen(),
            ActivityScreen(),
            ActivityScreen(),
            ActivityScreen(),
            ActivityScreen(),
            ActivityScreen(),
            ActivityScreen(),
          ],
        ),
      ),
    );
  }
}
