import 'package:epay_flutter/components/businesses/GPBusinessesComponent.dart';
import 'package:epay_flutter/components/peopleAndBills/GPPeopleAndBillsComponent.dart';
import 'package:epay_flutter/utils/GPColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ExploreScreen extends StatefulWidget {
  static String tag = '/ExploreScreen';
  int? tabIndex;

  ExploreScreen({this.tabIndex});

  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool isStopped = false;
  var searchController = TextEditingController();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(Colors.black, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark);
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.tabIndex.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                  hintText: 'Search for people',
                  hintStyle: secondaryTextStyle(size: 12),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                onTap: () {
                  //   hideKeyboard(context);
                },
              ).expand(),
              PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined, color: GPColorBlack),
                onSelected: (dynamic v) {
                  toast('Click');
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry<Object>> list = [];

                  list.add(PopupMenuItem(child: Text("Refresh", style: TextStyle(color: GPColorBlack)), value: 1));
                  list.add(PopupMenuItem(child: Text("Send feedback", style: TextStyle(color: GPColorBlack)), value: 1));
                  return list;
                },
              )
            ],
          ).paddingOnly(top: 5, bottom: 5),
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: GPAppColor,
            labelColor: GPAppColor,
            labelStyle: secondaryTextStyle(size: 14),
            tabs: [
              Tab(text: "People & bills"),
              Tab(text: "Businesses"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            PeopleAndBillsComponent(),
            BusinessesComponent(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
