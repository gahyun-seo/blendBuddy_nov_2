import 'package:clip_shadowx/clip_shadowx.dart';
import 'package:flutter/material.dart';

import '../../general/w_theme.dart';

class CupWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  const CupWidget({required this.width, required this.height, super.key, required this.backgroundColor});

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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      ClipPath(
        clipper: liquidClipper(),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
          ),
        ),
      )
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

class liquidClipper extends CustomClipper<Path> {


  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.1*size.width, 0.5*size.height);
    path.lineTo(0.2*size.width, size.height);
    path.lineTo(0.8*size.width, size.height - 0.1);
    path.lineTo(0.9*size.width, 0.5*size.height);
    path.quadraticBezierTo(0.75*size.width, 0.65*size.height, 0.5*size.width, 0.5*size.height);
    path.quadraticBezierTo(0.25*size.width, 0.35*size.height, 0.1*size.width, 0.5*size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}