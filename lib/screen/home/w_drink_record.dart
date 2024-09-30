
import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../general/drinkBox/drinks_dummy.dart';
import '../../general/drinkBox/w_drinkBox.dart';
import 'myDrinksRecord/f_drinks_record.dart';



class DrinkRecordToday extends StatelessWidget {
  const DrinkRecordToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // context
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 188.6,
                //margin: EdgeInsets.symmetric(horizontal: 14),
                child: DrinkRecordTodayContent()),
              DrinkRecordTodayTitle(),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          StatusBar(),
        ],
      ),
    );
  }
}

// 구현 X 디자인만 완성
class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 7,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: secondColor,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}

class DrinkRecordTodayTitle extends StatelessWidget {
  const DrinkRecordTodayTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '오늘 마신 음료',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Container(
            width: 29.7,
            height: 20.99,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrinksRecordPage(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add_circle,
                color: mainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrinkRecordTodayContent extends StatelessWidget {
  const DrinkRecordTodayContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            DrinkBox(dolceColdBrew),
            SizedBox(width: 14),
            DrinkBox(icedAmericano),
            SizedBox(width: 14),
          ]),
        )
      ],
    );
  }
}

