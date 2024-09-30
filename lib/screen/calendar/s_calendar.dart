import 'package:blend_buddy/screen/calendar/w_calendar_app_bar.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: const Text('calendar screen'),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CalendarAppBar(),
      ),
    );
  }
}
