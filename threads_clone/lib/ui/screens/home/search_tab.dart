// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../../core/data/dummy_data.dart';
import '../../../core/models/user_model.dart';
import '../../utils/theme.dart';
import '../../widgets/components.dart';
import '../../widgets/user_widget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with TickerProviderStateMixin {
  var animation;
  var controller;
  List<UserModel> userData = findUsers();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppsTheme.color.neutral.shade100,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppsTheme.color.neutral.shade100,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innnerBoxIsScrolled) {
                if (innnerBoxIsScrolled) {
                  /* Animation */
                  controller = AnimationController(
                    vsync: this,
                    duration: const Duration(seconds: 1),
                  );
                  animation = Tween(begin: 0.0, end: 1.0).animate(controller);
                  controller.forward();
                }
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 120.0,
                    floating: false,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    titleSpacing: 0.0,
                    toolbarHeight: 80.0,
                    centerTitle: false,
                    elevation: 0.0,
                    leadingWidth: 0.0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (innnerBoxIsScrolled == true)
                          FadeTransition(
                            opacity: animation,
                            child: const SearchForm(),
                          ),
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Search",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0,
                                  ),
                                ),
                                10.height,
                                const SearchForm(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Builder(
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: userData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: FindUserWidget(data: userData[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
