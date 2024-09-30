import 'package:flutter/material.dart';

import '../../general/colorPalette.dart';

class CalendarAppBar extends StatelessWidget {
  const CalendarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),),
          ],
        ),
      ),
    );
  }
}
