import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_app/data/constants.dart';

import '../home/components/custom_icons.dart';
import 'components/temperature_card.dart';

class ModeView extends StatefulWidget {
  final String modeName;

  const ModeView({super.key, required this.modeName});

  @override
  State<ModeView> createState() => _ModeViewState();
}

class _ModeViewState extends State<ModeView> {
  bool isAcON = true;
  double _currentSliderValue = 20;
  double _temperatureValue = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CustomIcons(icon: Icons.menu),
        centerTitle: true,
        title: Text(widget.modeName,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
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
                  colors: [
                CustomColor.kBackground2,
                CustomColor.kBackground1
              ])),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 20),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                    size: 190,
                    infoProperties: InfoProperties(
                        topLabelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w100),
                        topLabelText: 'Room Temperature',
                        mainLabelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                        modifier: (double value) {
                          final temperature = value.toInt();
                          return '$temperature°C';
                        }),
                    customColors: CustomSliderColors(
                        dotColor: CustomColor.kLightOrange,
                        progressBarColor: CustomColor.kLightOrange,
                        trackColors: [
                          CustomColor.kBackground2,
                          CustomColor.kBackground1
                        ]),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 10,
                      trackWidth: 30,
                    )),
                min: 16,
                max: 54,
                initialValue: _temperatureValue,
                onChange: (value) {
                  setState(() {
                    _temperatureValue = value;
                  });
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Current Temperature',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        '28°C',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Current Humidity',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        '54%',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 80,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColor.kBackground2,
                    border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.1))),
                child: Row(
                  children: [
                    const Icon(Icons.snowing, color: Colors.white),
                    const SizedBox(width: 10),
                    const Text(
                      "Samsung AC",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: Colors.lightGreenAccent,
                      value: isAcON,
                      onChanged: (value) {
                        setState(() {
                          isAcON = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(
                      child: TemperatureCard(
                    heading: 'Heating',
                    temperature: '28°C',
                    color: CustomColor.kOrange,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TemperatureCard(
                    heading: 'Cooling',
                    temperature: '18°C',
                    color: Colors.lightBlueAccent,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TemperatureCard(
                    heading: 'Airwave',
                    temperature: '28°C',
                    color: Colors.lightGreenAccent,
                  )),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.maxFinite,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: CustomColor.kNavyBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text("Timer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        Spacer(),
                        Icon(Icons.settings, size: 15, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "Setting",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.black, thickness: 1),
                    const SizedBox(height: 10),
                    SliderTheme(
                      data: SliderThemeData(
                          trackShape: CustomTrackShape(), trackHeight: 10),
                      child: Slider(
                        activeColor: CustomColor.kLightOrange,
                        value: _currentSliderValue,
                        max: 100,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("2H",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text("4H",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text("6H",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text("8H",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text("10H",
                            style: TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    )
                  ],
                ),
              )
            ]),
          ))),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
