import 'package:flutter/material.dart';

import 'custom_icons.dart';

class RelaxCard extends StatelessWidget {
  const RelaxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 160,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding:const  EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/relax.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: CustomIcons(
                onTap: (){},
                icon: Icons.play_arrow,
              ),
            );
  }
}