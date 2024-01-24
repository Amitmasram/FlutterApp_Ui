import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/home/home_view.dart';
import 'package:meditation_app/introduction/components/loading_dialog.dart';

import 'components/custom_floating_button.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(stops: [
                  _animation.value - 0.5,
                  _animation.value,
                  _animation.value + 0.5
                ], colors: const [
                  Colors.blueAccent,
                  Colors.purple,
                  Colors.pink
                ]).createShader(rect);
              },
              child: Text(
                "Your",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Text(
              "Personal",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 40),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        stops: [_animation.value - 0.5, _animation.value + 0.5],
                        colors: const [Colors.yellow, Colors.white])
                    .createShader(rect);
              },
              child: Text(
                "Journey",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Text(
              "Begins",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 40),
            ),
            Text(
              "Here",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 40),
            ),
            Text(
              "Start your journey to better\nmental and physical health with\nMind & Body",
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 18),
            ),
            const Spacer()
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        icon: Icons.arrow_forward,
        onTap: () {
          showLoadingDialog();
          2.9.seconds.delay().then((value) {
            hideLoadingDialog();
          });
          3.seconds.delay().then((value) => Get.to(() => const HomeView()));
        },
      ),
    );
  }
}
