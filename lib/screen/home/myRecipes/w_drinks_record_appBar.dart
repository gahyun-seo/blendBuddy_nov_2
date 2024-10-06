import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/material.dart';

class DrinksRecordAppBar extends StatelessWidget {
  const DrinksRecordAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            // IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.black,
            //       size: 30,
            //     )),
            Text(
              '내 레시피',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
