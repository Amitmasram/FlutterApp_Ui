import 'package:beauty_master/main.dart';
import 'package:beauty_master/utils/BMColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/BMCommentModel.dart';
import '../utils/BMWidgets.dart';

class BMCommentComponent extends StatefulWidget {
  BMCommentModel element;

  BMCommentComponent({required this.element});

  @override
  _BMCommentComponentState createState() => _BMCommentComponentState();
}

class _BMCommentComponentState extends State<BMCommentComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.element.image, height: 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.element.name, style: primaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor)),
                titleText(title: widget.element.message, size: 16),
                Text(
                  '${widget.element.time}  . Reply',
                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor),
                )
              ],
            )
          ],
        ).expand(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.element.isLiked
                ? Icon(Icons.favorite, color: Colors.amber).onTap(() {
                    widget.element.isLiked = !widget.element.isLiked;
                    setState(() {});
                  })
                : Icon(Icons.favorite_outline, color: bmPrimaryColor).onTap(() {
                    widget.element.isLiked = !widget.element.isLiked;
                    setState(() {});
                  }),
            Text(widget.element.likes, style: secondaryTextStyle(color: bmPrimaryColor))
          ],
        )
      ],
    ).paddingOnly(top: 8, bottom: 8, left: widget.element.isSubComment ? 50 : 0);
  }
}
