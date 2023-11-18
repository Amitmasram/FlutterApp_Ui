import 'package:flutter/cupertino.dart';

import 'package:ninebot/Modals/card_modals.dart';
import 'package:ninebot/Utils/Space.dart';
import 'package:ninebot/Utils/styles.dart';

import 'package:ninebot/components/card.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<BundleCard> cards = [
      BundleCard('assets/images/card-1.png', 'Front LED Light', 99.00),
      BundleCard('assets/images/card-2.png', 'Aerodynamic ', 129.00),
      BundleCard('assets/images/card-3.png', 'Metal pedals', 49.00),
      BundleCard('assets/images/card-4.png', 'Rear Wing', 100.00)
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        60.ph,
        Text(
          'Extra Bundle Include',
          style: h2,
        ),
        20.ph,
        SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: cards.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                var card = cards[index];
                return MyCard(
                    image: card.image, name: card.name, price: card.price);
              }),
            ))
      ]),
    );
  }
}
