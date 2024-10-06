import 'package:flutter/material.dart';

class TextButtonBox extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  const TextButtonBox({
    required this.text,
    super.key,
    required this.width,
    required this.height,
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize, required this.fontWeight,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
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
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
