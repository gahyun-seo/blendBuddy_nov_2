import 'dart:math';

import 'package:blend_buddy/general/colorPalette.dart';
import 'package:blend_buddy/screen/calendar/s_calendar.dart';
import 'package:blend_buddy/screen/settings/s_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      //height: 40,
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );},
                  icon: Icon(Icons.person_3_rounded, color: mainColor, size: 30,),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 30,
                height: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarScreen(),
                      ),
                    );},
                  icon: Icon(Icons.calendar_month_rounded, color: mainColor, size: 30,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
