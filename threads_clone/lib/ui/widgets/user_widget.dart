import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../core/models/user_model.dart';
import '../../gen/assets.gen.dart';
import '../utils/theme.dart';
import 'button_widget.dart';

// ignore: must_be_immutable
class FindUserWidget extends StatelessWidget {
  UserModel data;
  FindUserWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(data.profile),
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
                        if (data.isVerified)
                          Assets.icons.verified.image(height: 16),
                      ],
                    ),
                    Text(
                      data.name,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppsTheme.color.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.height,
                    Row(
                      children: [
                        if (data.friendsFollow != null)
                          RowSuper(
                            fitHorizontally: true,
                            innerDistance:
                                data.friendsFollow!.length > 1 ? -10.0 : 0,
                            alignment: Alignment.centerLeft,
                            children: List.generate(data.friendsFollow!.length,
                                (index) {
                              return Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                      data.friendsFollow![index].photo),
                                ),
                              );
                            }),
                          ),
                        if (data.friendsFollow != null) 5.width,
                        Text(
                          '${data.followers} followers',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            AppsButton(
              text: 'Follow',
              buttonType: AppsButtontype.secondary,
              color: AppsTheme.color.neutral.shade500,
              textColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width - 120,
          margin: const EdgeInsets.symmetric(vertical: 9),
          child: const Divider(thickness: 0.5),
        )
      ],
    );
  }
}
