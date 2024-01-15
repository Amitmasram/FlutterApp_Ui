import 'package:flutter/material.dart';
import 'package:smart_app/data/constants.dart';

class CustomSwitchCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool switchValue;
  final VoidCallback onTap;
  final void Function(bool)? onChanged;

  const CustomSwitchCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.switchValue,
      required this.onTap,
      this.onChanged});

  @override
  State<CustomSwitchCard> createState() => _CustomSwitchCardState();
}

class _CustomSwitchCardState extends State<CustomSwitchCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween =
        ColorTween(begin: CustomColor.kBackground2, end: CustomColor.kNavyBlue)
            .animate(_animationController);
    widget.switchValue
        ? _animationController.reverse()
        : _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: _colorTween.value,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)),
                    child: Icon(
                      widget.icon,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(widget.label,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.switchValue ? 'ON' : 'OFF',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400)),
                      Switch(
                          activeColor: Colors.lightGreenAccent,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey,
                          value: widget.switchValue,
                          onChanged: (value) {
                            widget.onChanged!(value);
                            setState(() {});
                            if (widget.switchValue == true) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
