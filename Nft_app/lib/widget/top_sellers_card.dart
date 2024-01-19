// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class TopSellersCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String total;

  const TopSellersCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 74,
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        color: kGreyColorCard,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 54,
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  total,
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          ),
          Text(
            "Follow",
            style: greenTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }
}
