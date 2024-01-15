import 'package:flutter/material.dart';

class HomePortionTabs extends StatelessWidget {
  const HomePortionTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 4,
        child: TabBar(
            indicatorColor: Colors.lightGreenAccent,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white, fontSize: 14),
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            tabs: [
              Tab(
                text: 'Living Room',
              ),
              Tab(
                text: 'Bedroom',
              ),
              Tab(
                text: 'Bathroom',
              ),
              Tab(
                text: 'Kitchen',
              )
            ]));
  }
}
