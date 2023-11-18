import 'package:flutter/material.dart';

import 'package:ninebot/Utils/styles.dart';

class MyNav extends StatelessWidget {
  const MyNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back,
            color: text,
            size: 24,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: bgIcon,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 1, color: Color.fromRGBO(0, 0, 0, 0.40)),
                ]),
            child: Icon(
              Icons.shopping_basket_outlined,
              color: text,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
