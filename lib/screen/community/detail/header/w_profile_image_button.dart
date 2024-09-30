import 'package:blend_buddy/screen/community/detail/vo_recipe_post.dart';
import 'package:flutter/material.dart';

import '../../../../general/colorPalette.dart';

// 레시피 포스팅 헤더에서의 프로필 이미지
// 나중을 위해 버튼으로 제작

class ProfileImageButton extends StatelessWidget {
  final RecipePost recipePost;

  const ProfileImageButton(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 59,
      height: 59,
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(recipePost.userImage),
        iconSize: 59,
      ),
    );
  }
}
