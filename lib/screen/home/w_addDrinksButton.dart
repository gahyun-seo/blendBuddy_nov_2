import 'package:blend_buddy/screen/home/myDrinksRecord/f_drinks_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../general/drinkBox/w_theme.dart';

class AddTodayDrinksButton extends StatelessWidget {
  const AddTodayDrinksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 162,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DrinksRecordPage(),
            ),
          );
        },
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(thirdColor),
          backgroundColor: MaterialStateProperty.all<Color>(secondColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
              //보더라인 넣고 싶으면 side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: const Text(
          '+ 추가하기',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
