import 'package:dtask/Ui/home_page.dart';

import 'package:flutter/material.dart';

import '../Utils/assets.dart';
import '../Utils/labels.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;

    return Scaffold(
      backgroundColor: scheme.primaryContainer,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ImageIcon(AssetImage(Assets.dashboard)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(Assets.menuIcon)),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Labels.market,
                      style:
                          style.displayMedium!.copyWith(color: Colors.black87),
                      children: const [
                        WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                          ),
                        )),
                        TextSpan(text: Labels.yourGrowth)
                      ])),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: Colors.white),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(EdgeInsets.only(left: 20))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Labels.getStarted,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(left: 20),
                        child: CircleAvatar(
                          backgroundColor: scheme.surface,
                          child: Icon(
                            Icons.arrow_forward,
                            color: scheme.secondary,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
