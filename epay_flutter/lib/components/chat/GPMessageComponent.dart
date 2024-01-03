import 'package:epay_flutter/components/chat/GPChatMessageWidget.dart';
import 'package:epay_flutter/components/chat/GPPayComponent.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPMessageComponent extends StatefulWidget {
  static String tag = '/MessageComponent';

  final String? personName;

  @override
  GPMessageComponentState createState() => GPMessageComponentState();

  GPMessageComponent({this.personName});
}

class GPMessageComponentState extends State<GPMessageComponent> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';
  bool isTabSelected = true;
  String? msg;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  sendMessage() async {
    if (msgController.text.trim().isNotEmpty) {
      var msgModel = GPMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.senderId = sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = GPMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.senderId = receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget msgList() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.separated(
          separatorBuilder: (_, i) => Divider(color: Colors.transparent),
          shrinkWrap: true,
          reverse: true,
          controller: scrollController,
          itemCount: msgListing.length,
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
          itemBuilder: (_, index) {
            GPMessageModel data = msgListing[index];
            var isMe = data.senderId == sender_id;

            return GPChatMessageWidget(isMe: isMe, data: data);
          },
        ),
      );
    }

    Widget textField() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: defaultBoxShadow()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 100),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: GPAppColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text("Pay", style: secondaryTextStyle(size: 12, color: backgroundColor, weight: FontWeight.bold)),
              ).visible(isTabSelected).onTap(() {
                GPPayComponent().launch(context);
              }),
              8.width,
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: GPAppColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text("Request", style: secondaryTextStyle(size: 12, color: backgroundColor, weight: FontWeight.bold)),
              ).visible(isTabSelected),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 16,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.navigate_next_outlined),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      isTabSelected = true;
                      hideKeyboard(context);
                    });
                  },
                ),
              ).onTap(() {}).visible(!isTabSelected),
              16.width,
              TextField(
                controller: msgController,
                focusNode: msgFocusNode,
                autofocus: false,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    filled: true,
                    suffixIcon: Icon(Icons.navigate_next_outlined, color: GPColorBlack, size: 40).visible(!isTabSelected),
                    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)), borderSide: BorderSide(color: Colors.grey[300]!)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)), borderSide: BorderSide(color: Colors.grey[300]!)),
                    hintText: personName.isNotEmpty ? 'Write to ${widget.personName}' : 'Type message',
                    hintStyle: primaryTextStyle(size: 14, color: Colors.grey)),
                style: primaryTextStyle(),
                onSubmitted: (s) {
                  sendMessage();
                },
                onTap: () {
                  isTabSelected = false;
                  setState(() {});
                },
              ).expand(),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        msgList(),
        textField(),
      ],
    );
  }
}
