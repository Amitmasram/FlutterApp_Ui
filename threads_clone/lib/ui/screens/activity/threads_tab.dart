import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../../core/data/dummy_data.dart';
import '../../../core/models/feed_model.dart';
import '../../utils/theme.dart';
import '../../widgets/feed_widget.dart';

class ThreadsTab extends StatelessWidget {
  const ThreadsTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<FeedModel> feedData = threads();
    return Scaffold(
      backgroundColor: AppsTheme.color.neutral.shade100,
      body: Center(
        child: ListView(
          children: [
            16.height,
            ListView.separated(
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: const Divider(thickness: 0.5),
              ),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: feedData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FeedWidget(data: feedData[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
