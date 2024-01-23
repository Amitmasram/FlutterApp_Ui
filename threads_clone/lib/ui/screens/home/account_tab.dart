import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/theme.dart';
import '../../widgets/profile_widget.dart';
import '../activity/threads_tab.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Transform.scale(
          scale: 0.5,
          child: Assets.icons.globe.image(height: 22),
        ),
        toolbarHeight: 50,
        actions: [
          Transform.scale(
            scale: 0.5,
            child: Assets.icons.instagram.image(height: 22),
          ),
          Transform.scale(
            scale: 0.5,
            child: Assets.icons.menu.image(width: 50),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: 250,
                  title: const ProfileWidget(),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            width: 1.5,
                            color: AppsTheme.color.neutral.shade400,
                          ),
                        ),
                      ),
                      child: TabBar(
                        indicatorColor: Colors.black,
                        unselectedLabelColor: AppsTheme.color.neutral.shade500,
                        labelStyle: const TextStyle(fontSize: 16),
                        tabs: const <Tab>[
                          Tab(text: "Threads"),
                          Tab(text: "Replies"),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                ThreadsTab(),
                ThreadsTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
