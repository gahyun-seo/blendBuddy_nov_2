import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:flutter/material.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 259,
      height: 259,
      alignment: Alignment.center,
      child: Container(
        width: 259,
        height: 259,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          '캐릭터',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
