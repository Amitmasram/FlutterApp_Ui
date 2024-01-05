import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store/data/data.dart';
import '../const/CustomIcon.dart';

class ProductCard extends StatelessWidget {
  final Data datalist;

  const ProductCard({super.key, required this.datalist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .37,
      decoration: BoxDecoration(
          color: Color(datalist.cardColor),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Hero(
              tag: datalist.imgUrl,
              child: Image.asset(datalist.imgUrl, width: 281.0, height: 191.0)),
          Text(datalist.title,
              style: const TextStyle(fontSize: 25.0, fontFamily: "Raleway")),
          const SizedBox(height: 15.0),
          Text(datalist.previousPrice,
              style: const TextStyle(
                  color: Colors.pink, fontSize: 18.0, fontFamily: "Helvetica")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(CustomIcons.favorite),
                  onPressed: () {},
                ),
                Text(datalist.price,
                    style: GoogleFonts.merriweather(
                        fontSize: 28.0, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(CustomIcons.cart),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
