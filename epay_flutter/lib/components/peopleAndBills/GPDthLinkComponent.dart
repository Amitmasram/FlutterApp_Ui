import 'package:epay_flutter/components/commanWidget/GPAppRaisedButtonWidget.dart';
import 'package:epay_flutter/components/peopleAndBills/GPDthLinkFormComponent.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DthLinkComponent extends StatefulWidget {
  static String tag = '/DthLinkComponent';
  GPDthDetailsModel? dthListData;

  DthLinkComponent({this.dthListData});

  @override
  DthLinkComponentState createState() => DthLinkComponentState();
}

class DthLinkComponentState extends State<DthLinkComponent> {
  List<GPDthDetailsModel>? gpDthData;
  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        titleSpacing: 0,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                icon: Icon(isEnable ? Icons.close : Icons.arrow_back_outlined),
                onPressed: () {
                  setState(() {
                    if (isEnable == false) {
                      finish(context);
                    }
                    if (isEnable == true) {
                      isEnable = false;
                    }
                  });
                }),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: CircleAvatar(radius: 16, backgroundImage: AssetImage(widget.dthListData!.img)),
            ),
            8.width,
            Text(widget.dthListData!.name, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_outlined,
              color: GPColorBlack,
            ),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(
                PopupMenuItem(
                  child: Text("Refresh", style: TextStyle(color: GPColorBlack)),
                  value: 1,
                ),
              );
              list.add(
                PopupMenuItem(
                  child: Text("Send feedback", style: TextStyle(color: GPColorBlack)),
                  value: 1,
                ),
              );
              return list;
            },
          )
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            isEnable
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20, right: 12, left: 12),
                        child: Row(
                          children: [
                            FDottedLine(
                              color: GPAppColor,
                              height: 60.0,
                              width: 60.0,
                              space: 3.0,
                              corner: FDottedLineCorner.all(30),
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                child: Icon(Icons.add, color: GPAppColor),
                              ),
                            ),
                            10.width,
                            Text("Link account", style: primaryTextStyle(size: 14, color: GPColorBlack)),
                          ],
                        ),
                      ).onTap(() {
                        DthLinkFormComponent(data: widget.dthListData).launch(context);
                      }),
                      Flexible(
                        child: Container(
                          width: context.width(),
                          height: context.height(),
                          color: Colors.grey,
                        ).onTap(() {
                          setState(() {
                            isEnable = !isEnable;
                          });
                        }),
                      )
                    ],
                  ).expand()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(boxShadow: <BoxShadow>[
                          BoxShadow(color: Colors.grey, blurRadius: 10.0, offset: Offset(0.0, 0.75)),
                        ], color: backgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("No accounts linked", style: secondaryTextStyle(size: 12, weight: FontWeight.bold)), Icon(Icons.keyboard_arrow_down, color: GPColorBlack)],
                        ),
                      ).onTap(() {
                        setState(() {
                          isEnable = !isEnable;
                        });
                      }),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Link your ACT Digital TV accounts to pay and\ntrack your payments easily.", style: primaryTextStyle(size: 14), textAlign: TextAlign.center),
                            16.height,
                            AppRaisedButton(
                              title: 'Get started',
                              titleSize: 14,
                              onPressed: () {
                                DthLinkFormComponent(data: widget.dthListData).launch(context);
                              },
                              borderRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ).expand(),
          ],
        ),
      ),
    );
  }
}
