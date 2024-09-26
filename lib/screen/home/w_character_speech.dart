import 'package:blend_buddy/screen/home/myDrinksRecord/f_drinks_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../general/w_theme.dart';

class CharacterSpeech extends StatelessWidget {
  const CharacterSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 30),
      child: Container(
        width: 122,
        height: 80,
        child: TextButton(
          onPressed: () {
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(thirdColor),
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                //보더라인 넣고 싶으면 side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          child: const Text(
            '말풍선',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
