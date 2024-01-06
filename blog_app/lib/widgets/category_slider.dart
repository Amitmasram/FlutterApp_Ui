import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) => Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                categories[index].imageFileName,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            child: Text(
              categories[index].title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          )
        ],
      ),
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        aspectRatio: 1.2,
        viewportFraction: 0.8,
        padEnds: true,
        initialPage: 0,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
    );
  }
}
