import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:flutter/material.dart';

class SpeechBox extends StatelessWidget {
  const SpeechBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
        width: 274,
      margin: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: secondColor,
        //border: Border.all(color: Colors.black, width: 0.0),
        borderRadius: new BorderRadius.all(Radius.elliptical(200, 80)),
      ),
      child: Text('말풍선', style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 25,
        color: thirdColor
      ),),
    );
  }
}
