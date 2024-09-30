import 'package:blend_buddy/general/colorPalette.dart';
import 'package:blend_buddy/general/text_button_box.dart';
import 'package:blend_buddy/screen/home/w_cups.dart';
import 'package:flutter/material.dart';

class NutritionStatus extends StatefulWidget {
  const NutritionStatus({super.key});

  @override
  State<NutritionStatus> createState() => _NutritionStatusState();
}

class _NutritionStatusState extends State<NutritionStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 0),
      child: Container(
        width: 329,
        height: 225,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '오늘 ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButtonBox(
                    text: '236kcal',
                    width: 106,
                    height: 32,
                    textColor: Colors.white,
                    backgroundColor: mainColor,
                    fontSize: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      ' 섭취했어요!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CupWidget(width: 80, height: 90,),
                  ),
                  SizedBox(width: 20),
                  CupWidget(width: 100, height: 120,),
                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CupWidget(width: 80, height: 90,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
