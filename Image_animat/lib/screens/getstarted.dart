import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_starter/screens/home.dart';
import 'package:flutter_animated_starter/widgets/backgroundcircle.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  bool _isContainerVisible = false;
  Offset offset = const Offset(120, 0);
  final double height = 200;
  final double width = 200;
  bool charactermoving = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 19, 32),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: FadeInLeft(
              delay: Duration(seconds: 1),
              child: Text("Share !",
                  style: Theme.of(context).textTheme.headline2!.merge(
                      const TextStyle(
                          color: Colors.white, fontFamily: 'UbuntuBold'))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: FlipInY(
              duration: Duration(seconds: 1),
              child: Text(
                  "It's not how much we give but\nhow much love we put into giving.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .merge(const TextStyle(color: Colors.white))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: _isContainerVisible ? res_height * 0.5 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            curve: Curves.easeOut,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  right: offset.dx - (width / 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BackgroundCircle(
                        circleWidth: res_width * 0.9,
                        circleBorderWidth: 80.0,
                        circleOpacity: 0.15,
                        circleColor: Colors.white,
                      ),
                      BackgroundCircle(
                        circleWidth: res_width * 0.8,
                        circleBorderWidth: 40.0,
                        circleOpacity: 0.9,
                        circleColor: Colors.amber,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox getBox = context.findRenderObject() as RenderBox;
                    setState(() {
                      offset = getBox.localToGlobal(details.globalPosition);
                      charactermoving = true;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      offset = const Offset(120, 0);
                      charactermoving = false;
                    });
                  },
                  child: SizedBox(
                    height: res_height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          left: offset.dx - (width / 2),
                          child: SizedBox(
                            width: res_width * 0.9,
                            height: res_height * 0.5,
                            child: Image.asset(
                              'assets/images/character-1.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              setState(() {
                offset = getBox.localToGlobal(details.globalPosition);
                charactermoving = true;
              });
            },
            onPanEnd: (details) {
              setState(() {
                offset = const Offset(120, 0);
                charactermoving = false;
              });
            },
            child: SizedBox(
              height: 44,
              child: !charactermoving
                  ? Image.asset(
                      'assets/images/left-and-right-arrows.png',
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Builder(
            builder: (context) {
              final GlobalKey<SlideActionState> _key = GlobalKey();
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: res_width * 0.8,
                  child: SlideAction(
                    text: "Get Started",
                    textStyle: Theme.of(context).textTheme.headline6!.merge(
                        const TextStyle(
                            color: Color(0xff28a5da),
                            fontWeight: FontWeight.bold)),
                    key: _key,
                    onSubmit: () async {
                      // await _player.setAsset('assets/audio/chimeup.mp3');
                      // _player.play();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    innerColor: Color(0xff28a5da),
                    outerColor: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
