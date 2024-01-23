import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../../core/data/dummy_data.dart';
import '../../../core/models/activity_model.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/theme.dart';
import '../../widgets/button_widget.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ActivityModel> activities = activity();
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              ActivityModel data = activities[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 23.0,
                              backgroundImage: AssetImage(data.profile),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 10.0,
                                  child: Image.asset(
                                    data.type == 'follow_request'
                                        ? Assets.icons.badgeRequest.path
                                        : Assets.icons.badgeFollow.path,
                                  ),
                                ),
                              ),
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data.username,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    4.width,
                                    Text(
                                      data.timeAgo,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF999999),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  data.type == 'following'
                                      ? 'Followed you'
                                      : 'Follow Request',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF999999),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        data.type == 'follow_request'
                            ? Row(
                                children: [
                                  AppsButton(
                                    text: 'Confirm',
                                    buttonType: AppsButtontype.secondary,
                                    color: AppsTheme.color.neutral.shade500,
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                  ),
                                  8.width,
                                  AppsButton(
                                    text: 'Hide',
                                    buttonType: AppsButtontype.secondary,
                                    color: AppsTheme.color.neutral.shade500,
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                  ),
                                ],
                              )
                            : AppsButton(
                                text: data.isFollowing ? 'Following' : 'Follow',
                                buttonType: AppsButtontype.secondary,
                                color: AppsTheme.color.neutral.shade500,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: data.isFollowing
                                      ? AppsTheme.color.neutral.shade500
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 8),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    margin: const EdgeInsets.symmetric(vertical: 9),
                    child: const Divider(thickness: 0.5),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
