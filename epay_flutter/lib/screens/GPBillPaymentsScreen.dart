import 'package:epay_flutter/components/peopleAndBills/GPBillsAndDthComponent.dart';
import 'package:epay_flutter/components/peopleAndBills/GPProviderSuggestionComponent.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BillPaymentsScreen extends StatefulWidget {
  static String tag = '/BillPaymentsScreen';

  @override
  BillPaymentsScreenState createState() => BillPaymentsScreenState();
}

class BillPaymentsScreenState extends State<BillPaymentsScreen> {
  var searchController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 0,
        centerTitle: true,
        elevation: 2,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_backspace, color: GPColorBlack),
              onPressed: () {
                finish(context);
              },
            ),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                hintText: 'Search for service providers',
                hintStyle: secondaryTextStyle(size: 12),
                prefixIcon: Icon(Icons.search),
              ),
              onTap: () {
                //
              },
            ).expand(),
            PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined, color: GPColorBlack),
              onSelected: (dynamic v) {
                toast('Click');
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<Object>> list = [];

                list.add(
                  PopupMenuItem(child: Text("Refresh", style: TextStyle(color: GPColorBlack)), value: 1),
                );
                return list;
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Suggested for you", style: secondaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)).paddingOnly(left: 10, right: 10),
            20.height,
            ProviderSuggestionComponent(),
            10.height,
            Text("Pay your bills and DTH", style: secondaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)).paddingOnly(left: 10, right: 10),
            20.height,
            BillsAndDthComponent(),
          ],
        ).paddingOnly(left: 5, right: 5),
      ),
    );
  }
}
