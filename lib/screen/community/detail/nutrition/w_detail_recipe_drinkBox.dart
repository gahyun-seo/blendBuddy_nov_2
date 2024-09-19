import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:flutter/material.dart';

import '../../../../general/drinkBox/vo_drinks.dart';

// 커뮤니티 페이지에서 유저 사진 클릭 시 나타나는 페이지에 사용되는 음료 박스
// round padding이 있다는 점과 텍스트 내용 등이 다름
// 현재는 drinks_dummy 그대로 사용, 나중에 분리 예정

class DetailRecipeDrinkBox extends StatelessWidget {
  final Drink drink;

  const DetailRecipeDrinkBox(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 387,
        height: 147,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: secondColor,
            // border: Border.all(
            // color: Colors.grey
            // ),
            borderRadius: BorderRadius.circular(15)),
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
              )),
            ),
          ),
          Container(
            width: 180,
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
    ]);
  }
}
