import 'package:fashion/models/product_details.dart';
import 'package:fashion/utils/colors.dart';
import 'package:fashion/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final ProductDetails productDetails;
  const DetailScreen({super.key, required this.productDetails});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Product Detail',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            SizedBox(
                height: 400,
                width: double.infinity,
                child: Hero(
                    tag: widget.productDetails.imagePath,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.productDetails.imagePath,
                          fit: BoxFit.cover,
                        )))),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                        text: widget.productDetails.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: "\n\n\$${widget.productDetails.price}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: AppColors.buttonColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900),
                          ),
                        ]),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.productDetails.isFav =
                            !widget.productDetails.isFav!;
                      });
                    },
                    icon: Icon(
                      widget.productDetails.isFav!
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: widget.productDetails.isFav!
                          ? Colors.red
                          : Colors.white,
                      size: 35,
                    )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Short Sleeve Polyester Letter,Landscape Print Embellished Slight Stretch Summer Men Tops,     A modern take on a mens headshot with glasses and black T-shirt',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const Spacer(),
            CupertinoButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                onPressed: () {}),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
