import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Frost extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const Frost(this.child, {this.width = 180, this.height = 60});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: Color(0x99EEEEEE)),
        child: child,
      ),
    );
  }
}
