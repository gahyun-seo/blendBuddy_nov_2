import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/screen/home/myDrinksRecord/w_drinks_record_appBar.dart';
import 'package:blend_buddy/screen/home/myDrinksRecord/w_searchBar.dart';
import 'package:flutter/material.dart';

import '../../../general/drinkBox/w_drinkBox.dart';


class DrinksRecordPage extends StatefulWidget {
  const DrinksRecordPage({Key? key}) : super(key: key);

  @override
  State<DrinksRecordPage> createState() => _DrinksRecordPageState();
}

class _DrinksRecordPageState extends State<DrinksRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DrinksRecordAppBar(),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              RecipeSearchBar(),
              SizedBox(height: 14),
              MyRecipeTitle(),
              DrinkBox(icedAmericano),
              SizedBox(height: 14),
              DrinkBox(malchaFrappuchino),
              SizedBox(height: 14),
              DrinkBox(dolceColdBrew),
              SizedBox(height: 14),
              DrinkBox(icedAmericano),
              SizedBox(height: 14),
              DrinkBox(dolceColdBrew),
              SizedBox(height: 14),
              DrinkBox(icedAmericano),
              SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRecipeTitle extends StatelessWidget {
  const MyRecipeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        '내 레시피',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

