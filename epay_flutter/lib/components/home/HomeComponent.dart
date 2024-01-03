import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/screens/GPChatScreen.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeListComponent extends StatefulWidget {
  final List<GPChatModel>? getPeopleList;

  HomeListComponent({this.getPeopleList});

  @override
  _HomeListComponentState createState() => _HomeListComponentState();
}

class _HomeListComponentState extends State<HomeListComponent> {
  int lengths = 40;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lengths > 11 ? 12 : lengths,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 0.0, crossAxisSpacing: 16.0, childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        GPChatModel mData = widget.getPeopleList![index % widget.getPeopleList!.length];
        return Column(
          children: [
            CircleAvatar(radius: 30, backgroundColor: black, backgroundImage: AssetImage(mData.img.toString().validate())),
            5.height,
            Text(mData.name, style: primaryTextStyle(size: 14, color: GPColorBlack)),
          ],
        ).onTap(() {
          GPChatScreen(userData: mData).launch(context);
        });
      },
    );
  }
}
