import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/general/text_button_box.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/todays_consumed_drink_list.dart';
import 'package:blend_buddy/screen/home/w_cups.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NutritionStatus extends StatefulWidget {
  const NutritionStatus({super.key});

  @override
  State<NutritionStatus> createState() => _NutritionStatusState();
}

class _NutritionStatusState extends State<NutritionStatus> {

  int recommendedSaturatedFat = 15;
  int recommendedCaffeine = 400;
  int recommendedSugars = 100;

  // 오늘의 전체 섭취 성분
  int totalCalories = 0;
  int totalSaturatedFat = 0;
  int totalCaffeine = 0;
  int totalSugars = 0;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 오늘의 음료 리스트를 가져와서, 오늘의 섭취 성분 계산하기
    final drinkList = Provider.of<TodaysConsumedDrinkList>(context);
    setState(() {
      totalCalories = drinkList.drinks.fold(0, (sum, drink) => sum + drink.calories);
      totalSaturatedFat = drinkList.drinks.fold(0, (sum, drink) => sum + drink.saturatedFat.toInt());
      totalCaffeine = drinkList.drinks.fold(0, (sum, drink) => sum + drink.caffeine.toInt());
      totalSugars = drinkList.drinks.fold(0, (sum, drink) => sum + drink.sugars.toInt());
    });
  }
  
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
                    text: '$totalCalories kcal',
                    // MARK: 오늘 마신 음료 데이터에서 가져와야함
                    width: 106,
                    height: 32,
                    textColor: Colors.white,
                    backgroundColor: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    onPressed: () {},
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
                    child: Stack(children: [
                      CupWidget(
                        width: 80,
                        height: 90,
                        backgroundColor: brown800,
                        proportion: totalCaffeine / recommendedCaffeine,
                      ),
                      CupTitle(
                        color: totalCaffeine / recommendedCaffeine < 0.8 ? brown800: Colors.white ,
                        width: 80,
                        title: '카페인',
                      ),
                      CupText(
                        width: 80,
                        height: 90,
                        text: '${totalCaffeine}mg', // MARK: 이후 데이터에서 끌어오기
                        fontSize: 14,
                        color: totalCaffeine / recommendedCaffeine < 0.3 ? brown800: Colors.white ,
                      )
                    ]),
                  ),
                  SizedBox(width: 20),
                  Stack(
                    children: [
                      CupWidget(
                        width: 100,
                        height: 120,
                        backgroundColor: mainColor,
                        proportion: totalSaturatedFat / recommendedSaturatedFat,
                      ),
                      CupTitle(
                        color: totalSaturatedFat / recommendedSaturatedFat < 0.8 ? mainColor: Colors.white,
                        width: 100,
                        title: '포화지방',
                      ),
                      CupText(
                        width: 100,
                        height: 120,
                        text: '${totalSaturatedFat}g', // MARK: 이후 데이터에서 끌어오기
                        fontSize: 16,
                        color: totalSaturatedFat / recommendedSaturatedFat < 0.3 ? mainColor: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Stack(
                      children: [
                        CupWidget(
                          width: 80,
                          height: 90,
                          backgroundColor: yellow300,
                          proportion: totalSugars / recommendedSugars,
                        ),
                        CupTitle(
                          color: totalSugars / recommendedSugars < 0.8 ? yellow300: Colors.white,
                          width: 80,
                          title: '당류',
                        ),
                        CupText(
                          width: 80,
                          height: 90,
                          text: '${totalSugars}g',
                          fontSize: 14,// MARK: 이후 데이터에서 끌어오기
                          color: totalSugars / recommendedSugars < 0.3 ? yellow300: Colors.white,
                        )
                      ],
                    ),
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

class CupTitle extends StatelessWidget {
  final Color color;
  final double width;
  final String title;

  const CupTitle(
      {required this.color,
      super.key,
      required this.width,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: color,
        ),
      ),
    );
  }
}

class CupText extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;
  final double padding = 5.3;
  final Color color;

  const CupText(
      {super.key,
      required this.width,
      required this.height,
      required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: height/padding),
      child: Text(text, // MARK: 이후 데이터에서 가져오기
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            color: color,
          )),
    );
  }
}
