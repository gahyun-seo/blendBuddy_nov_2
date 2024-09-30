import 'package:blend_buddy/screen/community/detail/vo_recipe_post.dart';
import 'package:flutter/material.dart';

import '../../../../general/w_theme.dart';

// 커뮤니티 레시피 포스팅의 음료를 내 음료로 추가할 수 있는 버튼

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 51.78,
          height: 51.78,
          child: IconButton(
            padding: EdgeInsets.zero,
              onPressed: () {},
              style: ButtonStyle(
                padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(mainColor),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                    //보더라인 넣고 싶으면 side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              iconSize: 22.18,
              icon: Icon(Icons.add, color: mainColor, weight: 500,)),
        ),
      ],
    );
  }
}
