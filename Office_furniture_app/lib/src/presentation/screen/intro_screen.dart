import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:provider/provider.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/presentation/screen/home_screen.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget introButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (furnitureContext) => ChangeNotifierProvider.value(
                    value: context.read<FurnitureProvider>(),
                    child: const HomeScreen(),
                  ),
                ),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(8),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.amber.withOpacity(0.8),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            label: Text(
              "Get started",
              style: h3Style.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 10),
              Text(
                "Bari's Office\nStanding\nDesk",
                style: h1Style.copyWith(color: Colors.white),
              ).fadeAnimation(2.0),
              const SizedBox(height: 5),
              Text(
                "Create a sustainable work space with 100% natural bamboo",
                style: h3Style.copyWith(color: Colors.white),
              ).fadeAnimation(1.0),
              const SizedBox(height: 20),
              introButton().fadeAnimation(3.0),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
