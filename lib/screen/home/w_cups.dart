import 'package:clip_shadowx/clip_shadowx.dart';
import 'package:flutter/material.dart';

import '../../general/w_theme.dart';
import 'dart:math';

class CupWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final double proportion; // 오늘 섭취한 성분의 권장 섭취에 대한 비율

  const CupWidget({required this.width, required this.height, super.key, required this.backgroundColor, required this.proportion});

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
      LiquidAnimationWidget(
        width: width,
        height: height,
        backgroundColor: backgroundColor,
        proportion: proportion,
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


class LiquidAnimationWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final double proportion;

  const LiquidAnimationWidget({
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.proportion,
    Key? key,
  }) : super(key: key);

  @override
  _LiquidAnimationWidgetState createState() => _LiquidAnimationWidgetState();
}

class _LiquidAnimationWidgetState extends State<LiquidAnimationWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    animation = Tween<double>(begin: -0.12, end: 0.12).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LiquidPainter(
        proportion: widget.proportion,
        waveHeight: animation.value,
        color: widget.backgroundColor,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}

class LiquidPainter extends CustomPainter {
  final double proportion;
  final double waveHeight;
  final Color color;

  LiquidPainter({required this.proportion, required this.waveHeight, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var path = Path();
    double effectiveProportion = min(proportion, 0.98);
    double liquidHeight = size.height * (1 - effectiveProportion);

    if (effectiveProportion > 0) {
      path.moveTo(0.1 * size.width, liquidHeight);
      path.lineTo(0.2 * size.width, size.height);
      path.lineTo(0.8 * size.width, size.height);
      path.lineTo(0.9 * size.width, liquidHeight);

      // 비율이 0이 아닌 경우에만 웨이브를 추가
      if (proportion > 0) {
        path.quadraticBezierTo(0.75 * size.width, liquidHeight + waveHeight * size.height, 0.5 * size.width, liquidHeight);
        path.quadraticBezierTo(0.25 * size.width, liquidHeight - waveHeight * size.height, 0.1 * size.width, liquidHeight);
      }
    }



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
