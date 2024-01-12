import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../users.dart';
import '../widget/panel_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final panelController = PanelController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final user = users[index];

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.person_outline,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 350,
        minHeight: 180,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: panelController,
        color: Colors.transparent,
        body: PageView(
          children: users
              .map((user) => Image.asset(user.urlImage, fit: BoxFit.cover))
              .toList(),
          onPageChanged: (index) => setState(() {
            this.index = index;
          }),
        ),
        panelBuilder: (ScrollController scrollController) => PanelWidget(
          user: user,
          onClickedPanel: panelController.open,
          onClickedFollowing: () => setState(() {
            user.isFollowing = !user.isFollowing!;
          }),
        ),
      ),
    );
  }
}
