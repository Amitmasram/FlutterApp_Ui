import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadius = 100;
  final Tween<double> _backgrounScale = Tween<double>(begin: 0.0, end: 1.0);
  AnimationController? _starIconAnimationController;
  @override
  void initState() {
    super.initState();
    _starIconAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _starIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(clipBehavior: Clip.none, children: [
          _pageBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_circularAnimationButton(), _starIcon()],
          )
        ]),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      curve: Curves.bounceIn,
      tween: _backgrounScale,
      duration: const Duration(seconds: 2),
      builder: (_context, _scale, _child) {
        return Transform.scale(
          child: _child,
          scale: _scale,
        );
      },
      child: Container(
        color: Colors.orange,
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadius += _buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          curve: Curves.bounceInOut,
          duration: const Duration(seconds: 2),
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(child: Text("Basic!")),
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
        animation: _starIconAnimationController!.view,
        builder: (_builcontext, _child) {
          return Transform.rotate(
            angle: _starIconAnimationController!.value * 2 * pi,
            child: _child,
          );
        },
        child: Icon(
          Icons.star,
          size: 100,
        ));
  }
}
