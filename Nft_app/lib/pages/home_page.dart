// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nft_app/pages/detail_page.dart';

import '../theme.dart';
import '../widget/button.dart';
import '../widget/featured_card.dart';
import '../widget/top_sellers_card.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List img = [
    'assets/image_nft1.png',
    'assets/image_nft3.png',
    'assets/3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo_img.png",
                    width: 32,
                  ),
                  SizedBox(width: 13),
                  Text(
                    "8.42 ETH",
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: extraBold,
                    ),
                  )
                ],
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo_search.png",
                    width: 48,
                  ),
                  SizedBox(width: 13),
                  Image.asset(
                    "assets/logo_notification.png",
                    width: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "View All",
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  title: "Art",
                  width: 61,
                  height: 35,
                  backgroundColor: kGreenColor,
                  fontColor: kWhiteColor,
                  fontSize: 14,
                  onClick: () {},
                ),
                Button(
                  title: "Music",
                  width: 61,
                  height: 35,
                  backgroundColor: kWhiteColor,
                  fontColor: kBlackColor,
                  fontSize: 14,
                  onClick: () {},
                ),
                Button(
                  title: "Games",
                  width: 71,
                  height: 35,
                  backgroundColor: kWhiteColor,
                  fontColor: kBlackColor,
                  fontSize: 14,
                  onClick: () {},
                ),
                Button(
                  title: "Domains",
                  width: 81,
                  height: 35,
                  backgroundColor: kWhiteColor,
                  fontColor: kBlackColor,
                  fontSize: 14,
                  onClick: () {},
                )
              ],
            )
          ],
        ),
      );
    }

    Widget featured() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured NFTs",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "View All",
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              img: img[index],
                            ),
                          )),
                      child: FeaturedCard(
                        imageUrl: img[index],
                        author: "MekaVerse",
                        title: "Meka #3139",
                        price: 10,
                      ),
                    ),
                  );
                }),
          )
        ],
      );
    }

    Widget topSellers() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Sellers",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "View All",
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          TopSellersCard(
            imageUrl: "assets/image_sellers1.png",
            title: "The Watcher",
            total: "\$ 739,420",
          ),
          TopSellersCard(
            imageUrl: "assets/image_nft1.png",
            title: "MekaVerse",
            total: "\$ 6409,120",
          ),
          TopSellersCard(
            imageUrl: "assets/image_nft2.png",
            title: "Monster",
            total: "\$ 5301,001",
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              header(),
              SizedBox(height: 40),
              categories(),
              SizedBox(height: 40),
              featured(),
              SizedBox(height: 40),
              topSellers(),
            ],
          ),
        ),
      ),
    );
  }
}
