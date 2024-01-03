import 'package:epay_flutter/components/peopleAndBills/GPBankTransferComponent.dart';
import 'package:epay_flutter/components/peopleAndBills/GPContactComponent.dart';
import 'package:epay_flutter/components/peopleAndBills/GPSelfTransferComponent.dart';
import 'package:epay_flutter/components/peopleAndBills/phoneNumber/GPPhoneNumberComponent.dart';
import 'package:epay_flutter/screens/GPBillPaymentsScreen.dart';
import 'package:epay_flutter/screens/GPMobileRechargeScreen.dart';
import 'package:epay_flutter/screens/GPQrScannerComponent.dart';
import 'package:epay_flutter/utils/AppWidget.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:epay_flutter/utils/GPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PeopleAndBillsComponent extends StatefulWidget {
  static String tag = '/PeopleAndBillsComponent';

  @override
  PeopleAndBillsComponentState createState() => PeopleAndBillsComponentState();
}

class PeopleAndBillsComponentState extends State<PeopleAndBillsComponent> {
  String? screenName;
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
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Recharge and pay bills",
            style: secondaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold),
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rechargeWidget(GP_mobile, "Mobile recharge").onTap(() {
                GPMobileRechargeScreen().launch(context);
              }),
              8.width,
              rechargeWidget(GP_bill_pay, "Bill payments").onTap(() {
                BillPaymentsScreen().launch(context);
              }),
            ],
          ),
          25.height,
          Text("Transfer money", style: primaryTextStyle(size: 15, color: GPColorBlack, weight: FontWeight.bold)),
          25.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              moneyWidget(GP_benk_transfer, "Bank \ntransfer").onTap(() {
                GPBankTransferComponent().launch(context);
              }),
              moneyWidget(GP_phone_number, "Phone \nnumber").onTap(() {
                GPPhoneNumberComponent().launch(context);
              }),
              moneyWidget(GP_upi_id, "UPI ID \not QR").onTap(() {
                dialogWidget(context);
              }),
              moneyWidget(GP_self_transfer, "Self \ntransfer").onTap(() {
                GPSelfTransferComponent().launch(context);
              }),
            ],
          ),
          25.height,
          ContactComponent(),
        ],
      ).paddingOnly(top: 20, right: 30, left: 30),
    );
  }

  Widget rechargeWidget(String image, String title) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: Row(
        children: [
          Image.asset(image, height: 22, width: 22, color: GPAppColor),
          12.width,
          Text(title, style: primaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget moneyWidget(String image, String title) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: GPAppColor,
          radius: 25,
          child: Image.asset(image, height: 28, width: 28, color: backgroundColor),
        ),
        10.height,
        Text(title, style: primaryTextStyle(size: 12, color: GPColorBlack), textAlign: TextAlign.center)
      ],
    );
  }

  dialogWidget(dialogContext) {
    return showDialog(
      context: dialogContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Pay to', style: primaryTextStyle(color: GPColorBlack, size: 20, weight: FontWeight.bold), textAlign: TextAlign.start),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [Image.asset(GP_upi_id_icon, height: 20, width: 20, color: GPColorBlack), 10.width, Text('UPI ID', style: primaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold))],
              ).onTap(() {
                finish(context);
                upiDialogWidget(context);
              }),
              40.height,
              Row(
                children: [
                  commonCacheImageWidget(GPAY_qr_scanner, height: 20, width: 20),
                  10.width,
                  Text('OPEN CODE SCANNER', style: primaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)).onTap(() {
                    GPQrScannerComponent(screenName: "PeopleAndBillsScreen").launch(context);
                  })
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  upiDialogWidget(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter UPI ID', style: primaryTextStyle(color: GPColorBlack, size: 20, weight: FontWeight.bold), textAlign: TextAlign.start),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("To:", style: secondaryTextStyle(size: 14, color: Colors.grey)),
                  TextFormField(
                      cursorColor: Colors.grey[300],
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      )).expand(),
                ],
              )
            ],
          ).paddingTop(20),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Cancel".toUpperCase(), style: primaryTextStyle(size: 13, color: GPAppColor, weight: FontWeight.bold)).onTap(() {
                  finish(context);
                }),
                20.width,
                Text("Verify".toUpperCase(), style: primaryTextStyle(size: 13, color: GPColorBlack, weight: FontWeight.bold)).onTap(() {
                  toast("verify");
                }),
              ],
            ).paddingOnly(bottom: 15, right: 15, top: 15)
          ],
        );
      },
    );
  }
}
