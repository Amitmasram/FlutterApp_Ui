import 'package:flutter/material.dart';
import 'package:image_parallex/model/Data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Vintag Classic !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '30 March 1853',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(bottom: 30),
                  child: PageView.builder(
                      itemCount: paintings.length,
                      controller: pageController,
                      itemBuilder: (context, i) {
                        return Transform.scale(
                          scale: 1,
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    paintings[i]['image'],
                                    height: 370,
                                    fit: BoxFit.cover,
                                    alignment:
                                        Alignment(-pageOffset.abs() + i, 0),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 20,
                                  right: 10,
                                  child: Text(
                                    paintings[i]['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
