import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/material.dart';

import '../../../../general/drinkBox/vo_drinks.dart';

// 영양성분 표
// 커뮤니티 페이지 디테일 뷰에 사용

class NutritionTable extends StatelessWidget {
  final Drink drink;

  const NutritionTable(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 323,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6, bottom: 10),
            child: Container(
              width: 370,
              child: Text(
                '영양 성분 보기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Table(
            border: TableBorder.all(color: secondColor),
            columnWidths: {
              0: FractionColumnWidth(0.5),
              1: FractionColumnWidth(0.5),
              2: FractionColumnWidth(0.5),
              3: FractionColumnWidth(0.5),
              4: FractionColumnWidth(0.5),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      height: 30,
                      width: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text('나트륨 (mg)'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      height: 30,
                      width: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(drink.sodium.toString()),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text('단백질 (g)')),
                  ),
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(drink.protein.toString())),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text('포화지방 (g)')),
                  ),
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(drink.saturatedFat.toString())),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text('당류 (g)')),
                  ),
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(drink.sugars.toString())),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text('카페인 (mg)')),
                  ),
                  TableCell(
                    child: Container(
                        height: 30,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(drink.caffeine.toString())),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 370,
            padding: EdgeInsets.only(top: 10, right: 6, left: 6),
            alignment: Alignment.bottomRight,
            child: Text(
              '총 열량 ${drink.calories} kcal',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
