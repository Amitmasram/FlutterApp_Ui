import 'package:flutter/material.dart';

import '../../../core/data/dummy_data.dart';
import '../../../core/models/helper_model.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/theme.dart';
import '../../widgets/feed_widget.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<FeedModel> feedData = feeds();
    return Scaffold(
      backgroundColor: AppsTheme.color.neutral.shade100,
      body: Center(
        child: ListView(
          children: [
            Assets.images.logo.image(height: 32),
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
