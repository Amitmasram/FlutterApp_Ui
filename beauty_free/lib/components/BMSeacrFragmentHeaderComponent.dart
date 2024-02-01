import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/BMColors.dart';

class BMSeacrFragmentHeaderComponent extends StatefulWidget {
  @override
  State<BMSeacrFragmentHeaderComponent> createState() => _BMSeacrFragmentHeaderComponentState();
}

class _BMSeacrFragmentHeaderComponentState extends State<BMSeacrFragmentHeaderComponent> {
  TextEditingController searchCont = TextEditingController();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.height,
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppTextField(
                controller: searchCont,
                onChanged: (text) {
                  searchText = text;
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search_sharp, color: bmPrimaryColor),
                  hintText: 'Search',
                  hintStyle: primaryTextStyle(color: bmPrimaryColor),
                  suffixIcon: searchText.length > 0
                      ? Icon(Icons.cancel, color: bmPrimaryColor).onTap(() {
                          searchCont.clear();
                        })
                      : Offstage(),
                ),
                textFieldType: TextFieldType.NAME,
                cursorColor: bmPrimaryColor,
              ),
            ).flexible(flex: 3),
            TextButton(onPressed: () {}, child: Text('Cancel', style: boldTextStyle(color: bmTextColorDarkMode))),
          ],
        ),
        16.height,
      ],
    );
  }
}
