import 'package:fashion/models/product_details.dart';
import 'package:fashion/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProductView extends StatelessWidget {
  final ProductDetails? productDetails;
  final String imagePath, title, price;
  final bool? isFav;
  final Function()? onPressed;
  const ProductView(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.price,
      this.isFav = false,
      this.productDetails,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailScreen(
                    productDetails: productDetails!,
                  ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            width: 190,
            child: Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: 190,
                  child: Hero(
                    tag: imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        isFav!
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: isFav! ? Colors.red : Colors.black,
                        size: 25,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
                text: "$title\n",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "\$$price",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.buttonColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
