import 'package:blend_buddy/screen/community/detail/vo_recipe_post.dart';
import 'package:flutter/material.dart';

// 레시피가 저장된 수를 나타내는 텍스트

class DetailRecipeLikes extends StatelessWidget {

  final RecipePost recipePost;

  const DetailRecipeLikes(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      Text(
        '${recipePost.likes}',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white),
      );
  }
}
