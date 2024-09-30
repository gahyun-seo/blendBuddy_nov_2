import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/general/text_button_box.dart';
import 'package:blend_buddy/screen/home/w_cups.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                    // MARK: 오늘 마신 음료 데이터에서 가져와야함
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
                    child: Stack(children: [
                      CupWidget(
                        width: 80,
                        height: 90,
                        backgroundColor: brown800,
                      ),
                      CupTitle(
                        color: brown800,
                        width: 80,
                        title: '카페인',
                      ),
                      CupText(
                        width: 80,
                        height: 90,
                        text: '155mg', // MARK: 이후 데이터에서 끌어오기
                        fontSize: 14,
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
                      ),
                      CupTitle(
                        color: mainColor,
                        width: 100,
                        title: '포화지방',
                      ),
                      CupText(
                        width: 100,
                        height: 120,
                        text: '9g', // MARK: 이후 데이터에서 끌어오기
                        fontSize: 16,
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
                        ),
                        CupTitle(
                          color: yellow300,
                          width: 80,
                          title: '당류',
                        ),
                        CupText(
                          width: 80,
                          height: 90,
                          text: '29g',
                          fontSize: 14,// MARK: 이후 데이터에서 끌어오기
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

  const CupText(
      {super.key,
      required this.width,
      required this.height,
      required this.text, required this.fontSize});

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
            color: Colors.white,
          )),
    );
  }
}
