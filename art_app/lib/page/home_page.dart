import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/art.dart';
import '../widget/background_widget.dart';
import '../widget/buy_button_widget.dart';
import '../widget/art_card_widget.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        //    extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            BackgroundWidget(controller: controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                    itemCount: art.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return ArtCardWidget(art: art[index]);
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.75,
                      height: MediaQuery.of(context).size.height * 0.7,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  const BuyButtonWidget(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      );
}
