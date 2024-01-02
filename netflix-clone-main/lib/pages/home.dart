import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/trending.dart';

import '../widgets/dot_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      animationDuration: const Duration(milliseconds: 500),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: const Icon(CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white),
          title: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png',
            height: kToolbarHeight - 25,
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicator:
                CircleTabIndicator(color: const Color(0xffF62E1F), radius: 2),
            labelColor: Colors.white,
            indicatorColor: Colors.red,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                child: Text('Treanding', style: TextStyle(fontSize: 16)),
              ),
              Tab(
                child: Text('Movies', style: TextStyle(fontSize: 16)),
              ),
              Tab(
                child: Text('Originals', style: TextStyle(fontSize: 16)),
              ),
              Tab(
                child: Text('Kids', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TrendingPage(),
            Center(
                child: Text(
              'Originals',
              style: TextStyle(color: Colors.white),
            )),
            Center(
                child: Text(
              'Originals',
              style: TextStyle(color: Colors.white),
            )),
            Center(
                child: Text(
              'Kids',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }
}
