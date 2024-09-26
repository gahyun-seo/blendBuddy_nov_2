import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/calendar/w_calendar_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clip_shadowx/clip_shadowx.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Text('calendar screen'),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CalendarAppBar(),
      ),
    );
  }
}
