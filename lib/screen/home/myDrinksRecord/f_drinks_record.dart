import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/screen/home/myDrinksRecord/w_drinks_record_appBar.dart';
import 'package:flutter/material.dart';

import '../../../general/drinkBox/w_drinkBox.dart';
import '../w_character.dart';
import 'w_speech_box.dart';

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
        preferredSize: Size.fromHeight(30),
        child: DrinksRecordAppBar(),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 114, left: 70, right: 70),
                  child: CharacterContainer(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 61, left: 103),
                  child: SpeechBox(),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(right: 3, left: 3),
              child: DrinkBox(icedAmericano),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.only(right: 3, left: 3),
              child: DrinkBox(dolceColdBrew),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.only(right: 3, left: 3),
              child: DrinkBox(malchaFrappuchino),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.only(right: 3, left: 3),
              child: DrinkBox(icedAmericano),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 307, bottom: 30),
        child: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: 40,
              weight: 500,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
