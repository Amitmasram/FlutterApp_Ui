import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final Widget child;

  CustomAppBar({required this.height, required this.child})
      : super(preferredSize: Size.fromHeight(height), child: child);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        alignment: Alignment.bottomCenter,
        child: child);
  }
}
