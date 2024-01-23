import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../gen/assets.gen.dart';
import '../utils/theme.dart';
import 'button_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Agis R Herdiana',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  8.height,
                  Row(
                    children: [
                      const Text(
                        'agis',
                        style: TextStyle(fontSize: 14),
                      ),
                      8.width,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(48),
                          ),
                        ),
                        child: Text(
                          'threads.net',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppsTheme.color.neutral.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.height,
                  const Text(
                    "Adventurer at heart, capturing life's moments one photo at a time 📸✨",
                    style: TextStyle(fontSize: 14),
                    maxLines: 3,
                    softWrap: false,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(Assets.images.profileAgis.path),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10.0,
                  child: Image.asset(Assets.icons.verified.path),
                ),
              ),
            )
          ],
        ),
        24.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowSuper(
              fitHorizontally: true,
              innerDistance: -10.0,
              alignment: Alignment.centerLeft,
              children: List.generate(3, (index) {
                return Container(
                  height: 28,
                  width: 28,
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
                    child: Image.asset('assets/images/avatar-${index + 1}.png'),
                  ),
                );
              }),
            ),
            8.width,
            Text(
              '21k followers',
              style: TextStyle(
                fontSize: 14,
                color: AppsTheme.color.neutral.shade600,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 3.0,
              height: 3.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppsTheme.color.grey,
              ),
            ),
            Text(
              'linktr.ee/johndoe_1717',
              style: TextStyle(
                fontSize: 14,
                color: AppsTheme.color.neutral.shade600,
              ),
            )
          ],
        ),
        12.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppsButton(
              text: 'Edit Profile',
              buttonType: AppsButtontype.primary,
              color: Colors.black,
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 8,
              ),
            ),
            AppsButton(
              text: 'Share Profile',
              buttonType: AppsButtontype.secondary,
              color: AppsTheme.color.neutral.shade500,
              textColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
