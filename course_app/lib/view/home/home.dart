import 'package:animate_do/animate_do.dart';
import 'package:course_app/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../detail/details_screen.dart';
import '../../model/category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                FadeInRight(
                  duration: const Duration(milliseconds: 1500),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(profileImg),
                  ),
                ),
              ],
            ),
            FadeInLeft(
              duration: const Duration(milliseconds: 1500),
              child: const Text(
                "Hey Zain !",
                style: kHeadingextStyle,
              ),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              child: Text(
                "Find a course you want to learn",
                style: kTitleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]),
              ),
            ),
            FadeIn(
              delay: const Duration(milliseconds: 1000),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 214, 214),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(width: 16),
                    const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: 'Search Course',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ))
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: kTitleTextStyle,
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: Color.fromARGB(255, 34, 56, 226),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: MasonryGridView.builder(
                itemCount: categories.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FadeInUp(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: index.isEven ? 300 : 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(categories[index].image),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories[index].name,
                                  style: kSubtitleTextSyule.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${categories[index].numOfCourses} Courses',
                                  style: kSubtitleTextSyule.copyWith(
                                      fontSize: 14, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
