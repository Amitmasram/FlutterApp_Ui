import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/model/picks_model.dart';

import 'components/custom_bottom_bar.dart';
import 'components/custom_icons.dart';
import 'components/picks_card.dart';
import 'components/relax_card.dart';
import 'components/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.poppins(
                              fontSize: 24, color: Colors.white),
                        ),
                        const Icon(Icons.menu, color: Colors.white)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          'Hi Amit',
                          style: GoogleFonts.poppins(
                              fontSize: 44,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset('assets/hi.gif', height: 40)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        const Expanded(child: SearchField()),
                        const SizedBox(width: 10),
                        CustomIcons(
                          onTap: () {},
                          icon: Icons.mic,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Personalized Picks",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 210,
                    child: ListView.separated(
                        padding: const EdgeInsets.only(left: 24),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) => PicksCard(
                              picks: dummyPicks[index],
                            ),
                        separatorBuilder: (ctx, index) =>
                            const SizedBox(width: 10),
                        itemCount: dummyPicks.length),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text("Relax and Recharge",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  const RelaxCard(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const Align(
                alignment: Alignment.bottomCenter, child: CustomBottomBar())
          ],
        ),
      ),
    );
  }
}
