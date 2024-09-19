import 'package:flutter/material.dart';

// 레시피 포스트 페이지의 앱바
// 현재는 뒤로가기 버튼만 있음

class DetailRecipeAppBar extends StatelessWidget {
  const DetailRecipeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  size: 35,
                )),
          ],
        ),
      ),
    );
  }
}
