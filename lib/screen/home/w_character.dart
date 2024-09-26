import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/home/w_character_speech.dart';
import 'package:flutter/material.dart';

import 'myDrinksRecord/f_drinks_record.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Stack(
        children: [
          // character image
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/fat_character.png'),
            )),
          ),
          // character 말풍선
          CharacterSpeech(),
        ],
      ),
    );
  }
}
