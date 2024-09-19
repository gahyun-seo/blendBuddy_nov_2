import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'vo_drinks.dart';

// 음료 박스
// 홈페이지, 음료 추가 페이지 등에서 사용
// 더미 데이터와 클래스로 처리해놨으나 map 미사용 -> 해결해야함

class DrinkBox extends StatelessWidget {
  final Drink drink;

  const DrinkBox(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 387,
          height: 147,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: secondColor,
              // border: Border.all(
              // color: Colors.grey
              // ),
              borderRadius: BorderRadius.circular(0)),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Container(
                width: 119,
                height: 119,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(drink.image),
                  )
                ),
              ),
            ),
            Container(
              width: 228,
              height: 147,
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${drink.drinkName}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: thirdColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${drink.drinkBrand}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: thirdColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${drink.drinkInfo}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: thirdColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
