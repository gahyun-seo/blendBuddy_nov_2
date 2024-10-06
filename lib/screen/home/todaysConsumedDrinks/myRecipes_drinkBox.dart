import 'package:blend_buddy/screen/home/todaysConsumedDrinks/todays_consumed_drink_list.dart';
import 'package:flutter/material.dart';

import '../../../general/drinkBox/vo_drinks.dart';
import '../../../general/w_theme.dart';
import 'package:provider/provider.dart';

class MyRecipeDrinkBox extends StatelessWidget {
  final Drink drink;
  final VoidCallback? onTap; // 음료를 선택하거나 눌렀을 때 호출될 함수
  final bool showDeleteButton; // 삭제 버튼 표시 여부
  final VoidCallback? onDeletePressed;


  MyRecipeDrinkBox({required this.drink, this.onTap, this.showDeleteButton = false, this.onDeletePressed,});

  @override
  Widget build(BuildContext context) {
    final drinkList =
        Provider.of<TodaysConsumedDrinkList>(context, listen: false);

    return GestureDetector(
      onTap: onTap, // 음료 버튼 클릭 시 호출될 콜백
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
        child: Stack(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: 100,
                  height: 100,
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
          if (showDeleteButton) Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 135,
            alignment: Alignment.bottomRight,
            child:
              IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              iconSize: 20,
              onPressed: onDeletePressed,
            ),
          ),
        ]),
      ),
    );
  }
}
