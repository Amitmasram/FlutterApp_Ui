import 'package:epay_flutter/components/commanWidget/GPAppRaisedButtonWidget.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/AppWidget.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scratcher/scratcher.dart';

class GPRewardComponent extends StatefulWidget {
  static String tag = '/GPRewardComponent';

  @override
  GPRewardComponentState createState() => GPRewardComponentState();
}

class GPRewardComponentState extends State<GPRewardComponent> {
  List<GPRewardAmountModel> rewardDataList = getRewardAmount();
  bool threshold = false;
  String? rewardAmount;
  ScrollController scrollController = new ScrollController();
  bool isAppbarChange = false;
  int newAmount = 0;
  var totalAmount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 30));
    setStatusBarColor(Color(0xFFfce285));

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          setState(() {
            isAppbarChange = false;
            print("visible");
          });
        } else {
          setState(() {
            isAppbarChange = true;
            print("hide");
          });
        }
      }
    });
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.black);
    scrollController.dispose();

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Color(0xFFfce285),
        title: Text(totalAmount != null ? '${'\u20B9'} $totalAmount' : "\u20B9 0", style: primaryTextStyle(size: 18, color: GPColorBlack, weight: FontWeight.bold)).visible(isAppbarChange),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(
                PopupMenuItem(child: Text("Send Feedback", style: TextStyle(color: GPColorBlack)), value: 1),
              );
              return list;
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 220,
            width: context.width(),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(GP_reward_bg), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(totalAmount != null ? '${'\u20B9'} $totalAmount' : "\u20B9 0", style: primaryTextStyle(size: 30, color: GPColorBlack, weight: FontWeight.bold)),
                5.height,
                Text("Total rewards", style: primaryTextStyle(size: 20, color: GPColorBlack))
              ],
            ).paddingLeft(16),
          ),
          ListView(
            shrinkWrap: true,
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(top: 200),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: backgroundColor, borderRadius: radiusOnly(topRight: 14, topLeft: 14), border: Border.all(color: backgroundColor)),
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                  scrollDirection: Axis.vertical,
                  itemCount: rewardDataList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0, childAspectRatio: 1.0),
                  itemBuilder: (context, index) {
                    GPRewardAmountModel mData = rewardDataList[index];

                    return GestureDetector(
                      onTap: () async {
                        bool? res = await scratchCardDialog(context, mData);
                        mData.isScratch = res ?? false;

                        if (mData.rewardAmount.isDigit()) {
                          rewardAmount = mData.rewardAmount;
                          newAmount = int.parse(rewardAmount!);
                          totalAmount += int.parse(rewardAmount!);
                        }
                        setState(() {});
                      },
                      child: ScratchWidget(mData: mData),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ScratchWidget extends StatelessWidget {
  const ScratchWidget({
    Key? key,
    required this.mData,
  }) : super(key: key);

  final GPRewardAmountModel mData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: backgroundColor,
            boxShadow: [
              BoxShadow(color: Colors.grey[300]!, blurRadius: 2.0, offset: Offset(0.0, 0.10)),
            ],
            borderRadius: radius(10),
            border: Border.all(color: mData.isScratch.validate() ? backgroundColor : Colors.blueGrey),
          ),
          height: 300,
          width: 300,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mData.rewardAmount!, style: primaryTextStyle(size: 24, color: GPAppColor, weight: FontWeight.bold)),
              Text(mData.description, style: primaryTextStyle(size: 20, color: GPAppColor)),
            ],
          ),
        ),
        Image.asset(GP_gp_buy_now, height: 300, width: 300, fit: BoxFit.fill).visible(!mData.isScratch.validate()),
      ],
    );
  }
}

Future<bool?> scratchCardDialog(context, GPRewardAmountModel mData) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black12.withOpacity(0.4),
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: Material(
          color: Colors.black12.withOpacity(0.4),
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close, color: backgroundColor, size: 24),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ),
                StatefulBuilder(builder: (context, StateSetter setState) {
                  setState(() {});
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.all(0.0),
                    content: Scratcher(
                      accuracy: ScratchAccuracy.low,
                      brushSize: 50,
                      threshold: 50,
                      color: Colors.transparent,
                      image: commonCacheImageWidget(GP_reward_square_img, fit: BoxFit.cover, height: 300, width: 300) as Image?,
                      onThreshold: () {
                        finish(context, true);
                      },
                      child: Container(
                        height: 300,
                        width: 300,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(mData.rewardAmount!, style: primaryTextStyle(size: 24, color: GPAppColor, weight: FontWeight.bold)),
                            Text(mData.description, style: primaryTextStyle(size: 20, color: GPAppColor)),
                          ],
                        ),
                      ),
                    ).cornerRadiusWithClipRRect(10),
                  );
                }),
                10.height,
                Text("Hooray!", style: primaryTextStyle(size: 18, color: backgroundColor, weight: FontWeight.bold)),
                3.height,
                Text("Paid on 26 March", style: primaryTextStyle(size: 14, color: backgroundColor)),
                Text("Ref #: CIDSKYRBFJ", style: primaryTextStyle(size: 14, color: backgroundColor)),
                15.height,
                Text("Earned for paying John Doe.", style: primaryTextStyle(size: 16, color: backgroundColor)),
                Spacer(),
                AppRaisedButton(
                  height: 45,
                  color: GPAppColor,
                  title: 'Tell your friends',
                  titleColor: Colors.white,
                  titleSize: 14,
                  onPressed: () {
                    toast('continue');
                  },
                  borderRadius: 25,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
