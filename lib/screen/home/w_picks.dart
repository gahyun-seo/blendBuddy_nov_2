import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/general/drinkBox/w_drinkBox.dart';
import 'package:blend_buddy/general/drinkBox/w_theme.dart';
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
      width: 387,
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 134,
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '케피들의 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Pick',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 21,
                height: 21,
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.check_circle,
                  size: 21,
                  color: mainColor,
                ),
              )
            ],
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
