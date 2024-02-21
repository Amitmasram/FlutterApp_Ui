import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/product_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.menu_rounded,
            size: 30,
            color: AppColors.tertiaryColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage("assets/images/0.jpg"),
              backgroundColor: AppColors.tertiaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: "New Collection\n",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: AppColors.tertiaryColor, fontSize: 36),
                          children: [
                            TextSpan(
                                text: "with ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: AppColors.tertiaryColor,
                                        fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "15% ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: AppColors.buttonColor,
                                        fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "discount",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: AppColors.tertiaryColor,
                                        fontWeight: FontWeight.w600))
                          ])),
                ),
                const ImageWidget(),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Top Sales",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductView(
                      imagePath: "assets/images/1.jpg",
                      title: "Denim Jacket",
                      price: "39.99",
                    ),
                    ProductView(
                        imagePath: "assets/images/3.jpg",
                        title: "Pleated Pants",
                        price: '29.55'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.tertiaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView(
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Image.asset(
                      "assets/images/0.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/1.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3,
            child: SizedBox(
              height: 42,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  addRepaintBoundaries: true,
                  itemCount: 3,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                        duration: const Duration(milliseconds: 375),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 6,
                        width: pageIndex == index ? 40 : 30,
                        decoration: BoxDecoration(
                          color: pageIndex == index
                              ? Colors.white
                              : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(15),
                        ));
                  }),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 120,
            right: MediaQuery.of(context).size.width / 2 - 120,
            bottom: -25,
            child: MaterialButton(
              onPressed: () {},
              height: 60,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              color: AppColors.buttonColor,
              child: Text(
                "Shop now",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
