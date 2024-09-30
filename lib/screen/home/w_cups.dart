import 'package:clip_shadowx/clip_shadowx.dart';
import 'package:flutter/material.dart';

import '../../general/w_theme.dart';

class CupWidget extends StatelessWidget {
  final double width;
  final double height;

  const CupWidget({required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipShadow(
        clipper: TestClipper(),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}

class TestClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // DRAWING CLIPPER
    path.moveTo(0, 0);
    path.lineTo(size.width / 5, size.height);
    path.lineTo(size.width / 5 * 4, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
