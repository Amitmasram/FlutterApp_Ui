import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:ninebot/Utils/Space.dart';
import 'package:ninebot/Utils/styles.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 473,
      height: 54,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 54,
              width: 170,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [accentDark, accent]),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Add to cart',
                      style: p4,
                    ),
                    10.pw,
                    Icon(
                      Icons.shopping_basket_outlined,
                      color: accentText,
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: bgIcon,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Color.fromRGBO(0, 0, 0, 0.40))
                    ]),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4, top: 2),
                  child: LikeButton(
                    bubblesColor: BubblesColor(
                        dotPrimaryColor: Color.fromARGB(255, 85, 255, 7),
                        dotSecondaryColor: Color(0xFFACFD3E),
                        dotThirdColor: Color(0xFFFF5722),
                        dotLastColor: Color(0xFFF44336)),
                    size: 28,
                  ),
                )
                // Icon(
                //   Icons.favorite_border_outlined,
                //   color: text,
                //   size: 20,
                // ),
                )
          ],
        ),
      ),
    );
  }
}
