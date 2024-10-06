import 'package:blend_buddy/screen/home/todaysConsumedDrinks/todays_consumed_drinks_page.dart';
import 'package:blend_buddy/screen/home/w_character.dart';
import 'package:blend_buddy/screen/home/w_drink_record.dart';
import 'package:blend_buddy/screen/home/w_home_header.dart';
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
          top: 60,
          bottom: 0,
        ),
        child: Column(
          // mainAxisAlignment:,
          children: [
            HomeHeader(),
            CharacterContainer(),
            NutritionStatus(),
            TodaysConsumedDrinksFragment(),
            Picks(),
          ],
        ),
      ),
    );
  }
}
