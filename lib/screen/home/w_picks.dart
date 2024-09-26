import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/general/drinkBox/w_drinkBox.dart';
import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/material.dart';

import '../../general/drinkBox/vo_drinks.dart';

class Picks extends StatefulWidget {
  const Picks({super.key});

  @override
  State<Picks> createState() => _PicksState();
}

class _PicksState extends State<Picks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Column(
        children: [
          Container(
            width: 350,
            height: 48,
            padding: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '버피들의 ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Pick ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
                Container(
                  width: 21,
                  height: 21,
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.arrow_circle_right,
                    size: 21,
                    color: mainColor,
                  ),
                )
              ],
            ),
          ),
          DrinkBox(icedAmericano),
          SizedBox(height: 14,),
          DrinkBox(malchaFrappuchino),
          SizedBox(height: 14,),
          DrinkBox(dolceColdBrew),
          SizedBox(height: 14,),
          DrinkBox(icedAmericano),
          SizedBox(height: 14,),
        ],
      ),
    );
  }
}
