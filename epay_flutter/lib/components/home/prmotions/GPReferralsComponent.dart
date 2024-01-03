import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPReferralsComponent extends StatefulWidget {
  static String tag = '/GPReferralsComponent';

  @override
  GPReferralsComponentState createState() => GPReferralsComponentState();
}

class GPReferralsComponentState extends State<GPReferralsComponent> {
  List<GPContactModel> getContactList = getContactData();

  var searchController = TextEditingController();

  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isEnable) {
          hideKeyboard(context);
          isEnable = false;

          setState(() {});
          return false;
        }
        return !isEnable;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFe8ebfd),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              if (isEnable) {
                hideKeyboard(context);
                isEnable = false;

                setState(() {});
                return;
              }
              finish(context);
            },
          ),
          title: isEnable
              ? TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      hintText: 'Search Friends',
                      hintStyle: secondaryTextStyle(size: 12),
                      prefixIcon: Icon(Icons.search, color: GPColorBlack)),
                  onTap: () {
                    //   hideKeyboard(context);
                  },
                )
              : Text(""),
          actions: [
            IconButton(
              icon: isEnable ? Container() : Icon(Icons.search, color: GPColorBlack),
              onPressed: () {
                isEnable = true;
                setState(() {});
              },
            ).visible(!isEnable)
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(GP_referral_bg), fit: BoxFit.cover)),
              height: 180,
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u20B951 earned", style: primaryTextStyle(size: 26, color: GPColorBlack)),
                  10.height,
                  Text("For referring 1 friend", style: primaryTextStyle(size: 18, color: GPColorBlack)),
                ],
              ).paddingTop(10),
            ),
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: context.height(),
                  margin: EdgeInsets.only(top: 160),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: backgroundColor, borderRadius: radius(20), border: Border.all(color: backgroundColor)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            radius: 20,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.next_plan_outlined, color: GPAppColor),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("32y52b", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)), 3.height, Text("Your referral code", style: secondaryTextStyle(size: 12, color: GPColorBlack))],
                          ),
                          Spacer(),
                          Text("Share", style: primaryTextStyle(size: 14, color: GPAppColor, weight: FontWeight.bold))
                        ],
                      ),
                      10.height,
                      Divider(color: Colors.grey[300], thickness: 1),
                      10.height,
                      referralContactList()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget referralContactList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: getContactList.length,
      itemBuilder: (context, index) {
        GPContactModel mData = getContactList[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 22, backgroundColor: Colors.white, backgroundImage: AssetImage(mData.userImg)),
            20.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mData.userName, style: secondaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
                3.height,
                Text(mData.userPhoneNumber, style: secondaryTextStyle(size: 11, color: Colors.black54)),
              ],
            ).expand(),
            Text("Invite", style: primaryTextStyle(size: 14, color: GPAppColor, weight: FontWeight.bold))
          ],
        ).paddingBottom(20);
      },
    );
  }
}
