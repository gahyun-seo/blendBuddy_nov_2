import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/general/colorPalette.dart';
import 'package:flutter/material.dart';

import '../../../../general/drinkBox/vo_drinks.dart';
import '../../../../general/drinkBox/w_drinkBox.dart';

// 커뮤니티 페이지에서 유저 사진 클릭 시 나타나는 페이지에 사용되는 음료 박스
// round padding이 있다는 점과 텍스트 내용 등이 다름
// 현재는 drinks_dummy 그대로 사용, 나중에 분리 예정

class DetailRecipeDrinkBox extends StatelessWidget {
  final Drink drink;

  const DetailRecipeDrinkBox(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 0),
      child: DrinkBox(dolceColdBrew),
    );
  }
}
