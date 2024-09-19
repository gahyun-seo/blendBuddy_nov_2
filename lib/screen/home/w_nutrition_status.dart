import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:flutter/material.dart';

class NutritionStatus extends StatefulWidget {
  const NutritionStatus({super.key});

  @override
  State<NutritionStatus> createState() => _NutritionStatusState();
}

class _NutritionStatusState extends State<NutritionStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372,
      height: 166,
      color: thirdColor,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(right: 55, top: 10),
        child: const Text(
          '''
        사용자가
        섭취한
        성분
        ''',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
