import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ninebot/Utils/styles.dart';

import 'package:ninebot/components/kart360.dart';
import 'package:ninebot/components/navigation.dart';
import 'package:ninebot/components/product_info.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bgLight, bgMed],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          border: const Border(
              bottom: BorderSide(color: Colors.white12, width: 1))),
      child: Column(children: const [
        MyNav(),
        Kart350(),
        ProductInfo(),
      ]),
    );
  }
}
