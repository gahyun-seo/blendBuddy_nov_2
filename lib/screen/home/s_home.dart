import 'package:blend_buddy/screen/home/w_addDrinksButton.dart';
import 'package:blend_buddy/screen/home/w_character.dart';
import 'package:blend_buddy/screen/home/w_nutrition_status.dart';
import 'package:flutter/material.dart';

import 'w_picks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        child: Column(
          // mainAxisAlignment:,
          children: [
            Container(
              width: 393,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 369, left: 11, right: 11),
                    child: NutritionStatus(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 126, left: 67, right: 67),
                    child: CharacterContainer(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 59, left: 225),
                    child: AddTodayDrinksButton(),
                  ),
                ],
              ),
            ),
            Picks(),
          ],
        ),
      ),
    );
  }
}
