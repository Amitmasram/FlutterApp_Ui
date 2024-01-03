import 'package:epay_flutter/components/peopleAndBills/mobileRecharge/GPMobileRechargeComponent.dart';
import 'package:epay_flutter/model/GPModel.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPDataProvider.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPPhoneNumberComponent extends StatefulWidget {
  static String tag = '/GPPhoneNumberComponent';

  @override
  GPPhoneNumberComponentState createState() => GPPhoneNumberComponentState();
}

class GPPhoneNumberComponentState extends State<GPPhoneNumberComponent> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode countryCodeFocusNode = FocusNode();
  bool isShowList = false;

  List<GPContactModel> getContactList = getContactData();
  List<GPContactModel> getNewContactList = [];
  bool isFloatingVisible = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    countryController.text = '+91';

    await 200.milliseconds.delay;
    FocusScope.of(context).requestFocus(countryCodeFocusNode);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 2,
        automaticallyImplyLeading: true,
        title: Text("Start a payment", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert_outlined),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];

              list.add(PopupMenuItem(child: Text("Send feedback", style: TextStyle(color: GPColorBlack)), value: 1));
              return list;
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0, //Edit Here
        backgroundColor: !isFloatingVisible ? Colors.grey[200] : GPAppColor,
        child: !isFloatingVisible ? Icon(Icons.navigate_next_rounded, color: Colors.grey[600]) : Icon(Icons.navigate_next_rounded, color: backgroundColor),
        onPressed: () {
          GPMobileRechargeComponent().launch(context);
        },
      ).visible(getNewContactList.isNotEmpty && getNewContactList != null),
      body: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          Text('enter mobile number'.toUpperCase(), style: primaryTextStyle(color: GPColorBlack, weight: FontWeight.bold, size: 14)),
          20.height,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
                    child: TextFormField(
                      controller: countryController,
                      style: TextStyle(fontSize: 18, color: GPColorBlack),
                      cursorColor: GPAppColor,
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor))),
                      keyboardType: TextInputType.text,
                    ),
                  )
                ],
              ),
              10.width,
              TextFormField(
                focusNode: countryCodeFocusNode,
                controller: phoneController,
                autofocus: true,
                maxLength: 10,
                style: primaryTextStyle(size: 20, color: GPColorBlack),
                cursorColor: GPAppColor,
                decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                  counter: new SizedBox(height: 0.0),
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      getNewContactList = getContactList.where((list) => (list.userPhoneNumber.contains(text))).toList();
                      if (text.length > 9) {
                        setState(() {
                          isFloatingVisible = !isFloatingVisible;
                        });
                      }
                    } else {
                      isShowList = false;
                      getNewContactList.clear();
                    }
                  });
                },
              ).expand(),
              10.width,
              Image.asset(GP_user_icon, color: GPColorBlack, height: 24, width: 24),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: getNewContactList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              GPContactModel mData = getNewContactList[index];
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
                  )
                ],
              ).paddingOnly(top: 10, bottom: 10);
            },
          ).visible(getNewContactList.isNotEmpty && getNewContactList != null)
        ],
      ),
    );
  }
}
