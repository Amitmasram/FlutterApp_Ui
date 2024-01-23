import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import 'package:timelines/timelines.dart';

import '../../gen/assets.gen.dart';
import '../utils/theme.dart';

class WriteWidget extends StatelessWidget {
  const WriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        alignment: Alignment.topLeft,
        heightFactor: 1,
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQueryData.fromWindow(
            WidgetsBinding.instance.window,
          ).padding.top),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                    15.width,
                    const Text(
                      'New Thread',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 9),
                child: const Divider(thickness: 0.5),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    indicatorPosition: 0,
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemCount: 2,
                    contentsBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: index == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'agis',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    autofocus: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 5),
                                      hintText: 'Start a thread...',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppsTheme.color.neutral.shade600,
                                      ),
                                    ),
                                  ),
                                  12.height,
                                  Assets.icons.iconPark.image(height: 20),
                                  40.height,
                                ],
                              )
                            : Text(
                                'Add to thread',
                                style: TextStyle(
                                  color: AppsTheme.color.neutral.shade500,
                                ),
                              ),
                      );
                    },
                    indicatorBuilder: (_, index) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(left: index == 0 ? 0.0 : 5.0),
                          child: CircleAvatar(
                            radius: index == 0 ? 20.0 : 15.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: index == 0 ? 20.0 : 10.0,
                              backgroundImage: AssetImage(
                                Assets.images.profileAgis.path,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    connectorBuilder: (_, index, ___) => SolidLineConnector(
                      thickness: 1.5,
                      indent: 6,
                      color: AppsTheme.color.neutral.shade400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Anyone can reply',
              style: TextStyle(
                color: AppsTheme.color.neutral.shade600,
                fontSize: 14,
              ),
            ),
            const Text(
              'Post',
              style: TextStyle(
                color: Color(0xFF2BA3FA),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
