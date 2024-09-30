import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/community/detail/vo_recipe_post.dart';
import 'package:blend_buddy/screen/community/detail/recipe_post_dummy.dart';
import 'package:flutter/material.dart';

// 레시피 글에 대한 포맷팅

class TitleText extends StatelessWidget {
  final RecipePost recipePost;

  const TitleText(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${recipePost.recipeTitle}',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class KeywordText extends StatelessWidget {

  final RecipePost recipePost;

  const KeywordText(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${recipePost1.recipeKeyword}',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: mainColor,
      ),
    );
  }
}

class ContentText extends StatelessWidget {

  final RecipePost recipePost;

  const ContentText(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${recipePost.recipeContent}',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: Colors.black
      ),
    );
  }
}

