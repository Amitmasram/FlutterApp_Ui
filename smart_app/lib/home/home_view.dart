import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/data/constants.dart';
import 'package:smart_app/home/components/custom_icons.dart';
import 'package:smart_app/home/components/custom_tabbar.dart';
import 'package:smart_app/home/components/home_portions_tabbar.dart';
import 'package:smart_app/mode/mode_view.dart';

import 'components/account_info_card.dart';
import 'components/switch_card.dart';
import 'components/weather_info_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool smartLampValue = true;
  bool smartTVValue = false;
  bool routerValue = false;
  bool climateValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CustomIcons(icon: Icons.menu),
        actions: const [CustomIcons(icon: Icons.notifications)],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [CustomColor.kBackground2, CustomColor.kBackground1])),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              AccountInfoCard(addCallback: () {}),
              const SizedBox(height: 20),
              const WeatherInfoCard(),
              const SizedBox(height: 20),
              const CustomTabbar(),
              const SizedBox(height: 20),
              const HomePortionTabs(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.bubble_chart,
                    label: 'Smart Lamp',
                    switchValue: smartLampValue,
                    onChanged: (value) {
                      smartLampValue = value;
                      setState(() {});
                    },
                    onTap: () {
                      Get.to(() => const ModeView(modeName: 'Smart Lamp'));
                    },
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.tv,
                    label: 'Smart TV',
                    switchValue: smartTVValue,
                    onChanged: (value) {
                      smartTVValue = value;
                      setState(() {});
                    },
                    onTap: () {
                      Get.to(() => const ModeView(modeName: 'Smart TV'));
                    },
                  )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.alt_route_rounded,
                    label: 'Router',
                    switchValue: routerValue,
                    onChanged: (value) {
                      routerValue = value;
                      setState(() {});
                    },
                    onTap: () {
                      Get.to(() => const ModeView(modeName: 'Router'));
                    },
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.snowing,
                    label: 'Climate',
                    switchValue: climateValue,
                    onChanged: (value) {
                      climateValue = value;
                      setState(() {});
                    },
                    onTap: () {
                      Get.to(() => const ModeView(modeName: 'Climate'));
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
