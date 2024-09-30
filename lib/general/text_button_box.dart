import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'colorPalette.dart';

class TextButtonBox extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;

  const TextButtonBox({
    required this.text,
    super.key,
    required this.width,
    required this.height,
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              //보더라인 넣고 싶으면 side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
