import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/BMColors.dart';

class BMSocialIconsLoginComponents extends StatelessWidget {
  const BMSocialIconsLoginComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: facebook),
          child: SvgPicture.asset(
            'images/ic_facebook.svg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: twitter),
          child: SvgPicture.asset(
            'images/ic_twitter.svg',
            fit: BoxFit.cover,
          ),
        ),
        Image.asset(
          'images/google_logo.png',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ).cornerRadiusWithClipRRect(100),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: appStore.isDarkModeOn ? bmPrimaryColor : bmSpecialColorDark),
          child: Image.asset(
            'images/ic_apple.png',
            color: white,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
