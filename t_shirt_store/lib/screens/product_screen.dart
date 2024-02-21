import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/filter_widget.dart';
import '../widgets/product_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Top Sales",
          style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 28,
                    )),
                Positioned(
                  top: 10,
                  right: 8,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const FilterWidget(),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 6,
                      mainAxisExtent: MediaQuery.of(context).size.height / 3),
                  itemBuilder: (context, index) {
                    return index.isOdd
                        ? Padding(
                            padding: const EdgeInsets.only(top: 26.0),
                            child: ProductView(
                              productDetails: Constants.productDetails[index],
                              onPressed: () {
                                setState(() {
                                  Constants.productDetails[index].isFav =
                                      !Constants.productDetails[index].isFav!;
                                });
                              },
                              imagePath:
                                  Constants.productDetails[index].imagePath,
                              title: Constants.productDetails[index].name,
                              price: Constants.productDetails[index].price,
                              isFav: Constants.productDetails[index].isFav,
                            ),
                          )
                        : ProductView(
                            productDetails: Constants.productDetails[index],
                            onPressed: () {
                              setState(() {
                                Constants.productDetails[index].isFav =
                                    !Constants.productDetails[index].isFav!;
                              });
                            },
                            imagePath:
                                Constants.productDetails[index].imagePath,
                            title: Constants.productDetails[index].name,
                            price: Constants.productDetails[index].price,
                            isFav: Constants.productDetails[index].isFav,
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
