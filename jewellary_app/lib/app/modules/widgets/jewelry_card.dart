// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jewelry_app/app/models/jewelry_model.dart';

import '../../data/data.dart';

class JewelryCard extends StatelessWidget {
  final Jewelry jewelry;
  final VoidCallback onTap;
  const JewelryCard({
    Key? key,
    required this.jewelry,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(jewelry.image),
      title: Text(
        "${jewelry.carrot} Carrot",
        style: CustomTextStyles.kBold16,
      ),
      subtitle: Text(
        jewelry.jewelryType,
        style: CustomTextStyles.kBold14,
      ),
      trailing: Text('${jewelry.pricePerHour.toInt()}\$/h',
          style: CustomTextStyles.kBold14),
    );
  }
}
