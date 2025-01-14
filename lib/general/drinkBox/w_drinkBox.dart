import 'package:blend_buddy/general/drinkBox/w_add_today_drink.dart';
import 'package:blend_buddy/general/w_theme.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddTodayDrinkPage()
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 135,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(drink.image),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        drink.drinkBrand,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        drink.drinkName,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: thirdColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '포화지방 ${drink.saturatedFat}g 당류 ${drink.sugars}g 카페인 ${drink.caffeine}mg',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: thirdColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${drink.calories} kcal (${drink.drinkSize})',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: thirdColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
